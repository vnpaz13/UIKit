//
//  SecondViewController.swift
//  4. BMI
//
//  Created by VnPaz on 2024/01/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
 
    var bmiNumber: Double?
    var adviceString: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.setTitle("다시 계산하기", for: .normal)
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        guard let bmi = bmiNumber else { return }
        bmiNumberLabel.text = String(bmi)       // bmiNumberLable.text = String(bmi!) 옵셔널 강제로 벗기기 가능 하지만 에러뜨면 강제 종료당함
    
        adviceLabel.text = adviceString
        
        bmiNumberLabel.backgroundColor = bmiColor
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
