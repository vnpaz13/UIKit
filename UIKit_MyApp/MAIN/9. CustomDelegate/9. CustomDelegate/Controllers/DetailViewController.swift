import UIKit
import PhotosUI


final class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    weak var delegate: MemberDelegate? // weak 선언시 구조체,클래스 둘다 채택 가능하기 때문에 에러뜸. 여기선 타입이 무조건 클래스 타입이어야함 그러면 Member에서 수정 필요
    var member: Member?
    
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupButtonAction()
        setupTapGestures()
    }
    
    private func setupData() {
        detailView.member = member
    }
    // 뷰에 있는 버튼의 타겟 설정
    
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.mainImageView.addGestureRecognizer(tapGesture)
        detailView.mainImageView.isUserInteractionEnabled = true // 반드시 켜줘야지만 동작이 가능함.
    }
    
    @objc func touchUpImageView() {
        print("ImageView Touched")
        setupImagePicker()
    }
    
    func setupImagePicker() {
        // basic setting
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    
    
    
    @objc func saveButtonTapped() {
        print("버튼이 눌림")
        
        if member == nil {
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            var newMember =
            Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
//            let index = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            vc.memberListManager.makeNewMember(newMember)
            
            // delegate 방식으로 구현
             delegate?.addNewMember(newMember)
            
        } else {
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            // 뷰에도 바뀐 멤버를 전달 (뷰컨트롤러 ---> 뷰)
            detailView.member = member
            
//            let index = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            vc.memberListManager.updateMemberInfo(index: memberId, member!)

            // delegate 방식으로 구현
             delegate?.update(index: memberId, member!)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension  DetailViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 피커뷰 dismiss
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self){
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in DispatchQueue.main.async {
                // 이미지뷰에 표시
                self.detailView.mainImageView.image = image as? UIImage
                 }
            }
        } else {
            print("image did not loaded!!!")
        }
    }
    
}


