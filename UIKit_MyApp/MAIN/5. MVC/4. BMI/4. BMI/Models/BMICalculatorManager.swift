//
//  BMICalculatorManager.swift
//  4. BMI
//
//  Created by VnPaz on 1/29/24.
//

import Foundation
import UIKit

struct BMICalculatorManager {       // class 로 바뀌면 mutating이 필요없음
    
    // BMI계산 결과값 보관을 위한 변수
    private var bmi: BMI?
    
    // BMI 얻기 메서드
    mutating func getBMI(height: String, weight: String) -> BMI {
        // BMI 만들기 메서드 호출
        calculateBMI(height: height, weight: weight)
        // BMI 리턴
        return bmi ?? BMI(value: 0.0, advice: "문제발생", matchColor: UIColor.white)
    }
    
    // BMI만들기 메서드(BMI수치 계산해서, BMI구조체 인스턴스 만드는 메서드)
    mutating private func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI(value: 0.0, advice: "문제발생", matchColor: UIColor.white)
            return
        }
        
        var bmiNum = w / (h * h) * 10000
        bmiNum = round(bmiNum * 10) / 10
        
        switch bmiNum {
        case ..<18.6:
            let color = UIColor(displayP3Red: 22/255,green: 231/255,blue: 207/255,alpha:1)
            bmi = BMI(value: bmiNum, advice: "저체중", matchColor: color)
        
        case 18.6..<23.0:
            let color = UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
            bmi = BMI(value: bmiNum, advice: "표준", matchColor: color)
       
        case 23.0..<25.0:
            let color = UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
            bmi = BMI(value: bmiNum, advice: "과체중", matchColor: color)
         
        case 25.0..<30.0:
            let color = UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
            bmi = BMI(value: bmiNum, advice: "중등도비만", matchColor: color)
        
        case 30.0...:
            let color = UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
            bmi = BMI(value: bmiNum, advice: "고도비만", matchColor: color)
            
        default:
            bmi = BMI(value: 0.0, advice: "문제발생", matchColor: UIColor.white)
        }
        
    }

}
