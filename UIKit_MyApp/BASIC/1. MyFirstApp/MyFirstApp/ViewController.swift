//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 박교정 on 2024/01/07.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func buttonPressed(_ sender: UIButton) {

        mainLabel.text = "안녕하세요"
//        myButton.backgroundColor = UIColor.red
//        myButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }

}
