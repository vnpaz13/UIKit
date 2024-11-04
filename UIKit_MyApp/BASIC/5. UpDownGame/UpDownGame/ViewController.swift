import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 컴퓨터가 랜덤으로 숫자 선택
    var comNumber = Int.random(in: 1...10)
    
    // #00000000000000000000000000000000000000000000
    // 내가 선택한 숫자를 담는 변수
    //var myNumber: Int = 1

    
    // 앱의 화면에 들어오면 가정 처음에 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) mainLabel에 "선택하세요"라고 표시
        mainLabel.text = "선택하세요"
        // 2) numberLabel에 "" (공란)
        numberLabel.text = ""
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자를 가져와야함
        guard let numString = sender.currentTitle else {return}
        // let num = sender.currentTitle!
        
        // 2) 숫자 레이블이 변하도록 (숫자에 따라)
        numberLabel.text = numString
        
        // #0000000000000000000000000000000000000000
        // 3) 선택한 숫자를 변수에다가 저장 {선택 사항}
        //guard let num = Int(numString) else {return}
        //myNumber = num
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 다른 방법
        // 숫자레이블에 있는 문자열 가져오기 (optional 해제)
        guard let myNumString = numberLabel.text else {return}
        // 타입 변환 (문자열 --> 정수로)
        guard let myNumber = Int(myNumString) else {return}
        
        // 1) 컴퓨터의 숫자와 내가 선택한 숫자를 비교
        if comNumber > myNumber {
            mainLabel.text = "UP"
        } else if comNumber < myNumber {
            mainLabel.text = "DOWN"
        } else {
            mainLabel.text = "Bingo😎"
        }
        
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) mainLabel "선택하세요"
        mainLabel.text = "선택하세요"
        // 2) numberLabel "" (공란)
        numberLabel.text = ""
        // 3) 컴퓨터 랜덤 숫자값 재설정
        comNumber = Int.random(in: 1...10)
        
        
    }
    
}

