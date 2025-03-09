import UIKit

class A부품 {
    var name: String = "A부품"
}

class B부품 {
    var name: String = "B부품"
}


class C완성품 {
    
    // C완성품이 A부품에 의존한다 ⭐️⭐️⭐️ (의존성이 생긴다.)
    var a: A부품 = A부품()
    
//    init() {
//        self.a = A부품()
//    }
    
//    init(a: A부품) {
//        self.a = a
//    }
    
    func printName() {
        print(a.name)
    }
}


// 완성품을 만드는 방법 1

let c: C완성품 = C완성품()
c.printName()




// 완성품을 만드는 방법 2

let coolA: A부품 = A부품()
coolA.name = "멋진 A부품"


// 주입 방식만 개선
// 외부에서 주입하도록 만들었으나, 여전히 의존한다.

//let c2: C완성품 = C완성품(a: coolA)
//





// 주입(Injection)의 개념 ==============

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// 외부에서 값을 주입(할당/초기화)해서 인스턴스 생성

let p1 = Person(name: "뉴진스")

