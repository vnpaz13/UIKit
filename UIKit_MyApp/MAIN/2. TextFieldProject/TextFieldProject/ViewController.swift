//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 박교정 on 2024/01/13.
//
// delegate - 대리자

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "Email 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder() // simulator에서 가장 처음으로 반응하게 하기
    }
    
    // 화면의 탭을 감지하는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //textField.resignFirstResponder()
    }

    
    // textfield의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function) // 함수의 이름을 출력
        return true
    }
    
    // 시점 -
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("사용자가 텍스트필드의 입력을 시작했다.")
        print(#function)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    //------------------------------------------------------------------
    
    
    // textfield 글자 내용이 (한글자 한글자) 입력되거나 지워질때 호출이 되고 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        //print(#function)
        //return true
        
        //
        
        let maxLength = 10
        let currentString: NSString = (textField.text ?? "" ) as NSString
        let newString: NSString =
        currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
        
        //        입력되고 있는 글자가 '숫자'인 경우 입력을 허용하지 않는 논리
        //        if Int(string) != nil { // { 숫자로 변환이 된다면 nil이 아닐테니
        //            return false
        //        } else {
        //            // 10글자 이상 입력되는 것을 막는 코드
        //            guard let text = textField.text else { return true }
        //            let newLength = text.count + string.count - range.length
        //            return newLength <= 10
        //        }
        
        // Example
        
        //        if (textField.text?.count)! + string.count > 10 {
        //            return false
        //        } else {
        //            return true
        //        }
        
    }
    
    //---------------------------------------------------------------
    
    
    
    // textfield의 엔터 키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == ""{
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
        
        
    }
    
    // textfield의 입력이 끝날 때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // textfield의 입력이 실제 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("사용자가 텍스트필드의 입력을 끝냈다.")
        textField.text = ""
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        
    }
    
}

