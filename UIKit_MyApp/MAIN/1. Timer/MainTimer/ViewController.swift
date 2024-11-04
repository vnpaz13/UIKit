import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
        // 실무에서 많이 쓰임. 코드의 간결화
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    

    @IBAction func sliderChanged(_ sender: UISlider) {
        // slider의 value를 가지고 mainLabel의 텍스트를 셋팅
        let seconds = Int(slider.value * 60)
        // let seconds = Int(sender.value * 60)
        print(seconds)
        mainLabel.text = "\(seconds)초" // Interpolation : 보간법
        number = seconds
        // mainLabel.text = "\(number)초"
    }
  
    
   @IBAction func startButtonTapped(_ sender: UIButton) {
    // 1초씩 지나갈때마다 무언가를 실행
    timer?.invalidate()
    // timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfterSecond), userInfo: nil, repeats: true)
       
       timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            // 반복을 하고 싶은 코드
           
            if number > 0 {
                number -= 1
                // slider도 줄여야됨.
                // Label표시도 다시 해줘야 됨.
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number)초"
                
                
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate()
                // 소리를 나게 해야함
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
    }
    
//  @objc func doSomethingAfterSecond() {
//      if number > 0 {
//          number -= 1
//          slider.value = Float(number) / Float(60)
//          mainLabel.text = "\(number)초"
//      } else {
//          number = 0
//          mainLabel.text = "초를 선택하세요"
//          timer?.invalidate()
//          // 소리를 나게 해야됨
//          AudioServicePlayAlertSound(SystemSoundID(1322))
//      }
              
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 셋팅
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()
        // timer = nil 로 대체 가능
        
        // slider의 가운데 설정
        slider.setValue(0.5, animated: true)
        // false로 하면 animation effect 없음
        // slider.value = 0.5
            
    }
    

}



