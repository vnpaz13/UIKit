//
//  ViewController.swift
//  3. LOGINProject
//
//  Created by VnPaz on 2024/01/17.
//

import UIKit

class ViewController: UIViewController {

    // UIView에 인스턴스를 만들어서 view라는 변수에 넣고 리턴함 클로저를 실행을 하자마자 view를 emailTextFieldView에 담는거임
    // 클로저를 사용하면 코드를 더 간결하게 정리되어 보임.
    // 초기 코드 = let emailTextFieldView = UIView()
    let emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
    
        return view
    }()         //  let 대신 lazy var 로 설정 하면 view.addSubview(emailTextFieldView)도 추가할 수 있다.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
    }
    
    func makeUI() {
    
        //emailTextFieldView.backgroundColor = UIColor.darkGray
        //emailTextFieldView.layer.cornerRadius = 8
        //emailTextFieldView.layer.masksToBounds = true
        
        view.addSubview(emailTextFieldView) // 짜논 코드를 뷰에 올린다. addSubview -> 하위 서브 뷰에 넣는다. ()-> 무엇을? 메서드
        
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        // 코드로 짜면 자동으로 프레임 기준으로 올라가는 기능을 꺼줌
        
        // 오토 레이아웃 잡아주기
        // equalTo: 어디다가 맞출건지 , constant : float
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // 높이는 기준이 없다. equalToConstant -> 숫자에 만큼 맞춘다.
    }

}

