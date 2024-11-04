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
 
//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 전화면에서 전달받은 데이터들을 통해 셋팅
        
        configureUI()
    
        guard let bmi = bmi else { return }
        
        bmiNumberLabel.text = "\(bmi.value)"
        bmiNumberLabel.backgroundColor = bmi.matchColor
        adviceLabel.text = bmi.advice
    
    }
    
  
    
    func configureUI() {
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.setTitle("다시 계산하기", for: .normal)
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
    }
    
    
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
