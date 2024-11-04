//
//  ViewController.swift
//  RPSGame
//

import UIKit

class ViewController: UIViewController {

    // 변수 / 속성
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    // ! => nil값이 생성되지 않게 만들어줌.
    var myChoice: Rps = Rps.rock

    // 함수 / 메서드
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // 1) 첫번째, 두번째 이미지뷰에 준미 이미지를 띄워야함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        // 2) 첫번째, 두번째 레이블에 "준비"라고 문자열을 띄워야함
        comChoiceLabel.text = "Ready"
        myChoiceLabel.text = "Ready"
    }
            
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // R,P,S(enum)를 선택해서 그 정보를 저장해야됨.
        
//        guard let title = sender.currentTitle else{
//            return
//        }
        
        // 버튼의 문자를 가져옴
        let title = sender.currentTitle!
        print(title)
        
        switch title {
        // scissors 열거형을 만들어서 저장
        case "Scissors" :
            myChoice = Rps.scissors
        // rock 열거형을 만들어서 저장
        case "Rock" :
            myChoice = Rps.rock
        // paper 열거형을 만들어서 저장
        case "Paper" :
            myChoice = Rps.paper
        
        default:
            break
        }

    }
        
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 문자열로 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "rock"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "Paper"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "Scissors"
        }
        // 3) 내가 선택한 것을 이미지뷰에 표시
        // 4) 내가 선택한 것을 Label에 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "Rock"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "Paper"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "Scissors"
        }
        
        
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 승패를 판단 -> 표시
        
        if comChoice == myChoice {
            mainLabel.text = "DRAW"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "WIN"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "WIN"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "WIN"
        } else {
            mainLabel.text = "LOSE"
        }
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 다시 준비 이미지뷰에 표시
        // 2) 컴퓨터가 다시 준비 Label에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "READY"
        // 3) 내 선택 이미지뷰에도 준비 이미지를 표시
        // 4) 내 선택 Label에도 준비 문자열 표시 표시
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "READY"
        // 5) 메인 Label에도 "Click it!" 표시
        mainLabel.text = "Choose One"
        // 6) 컴퓨터가 다시 랜덤 R,P,S를 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
}

