

import Foundation

class FirstPageViewModel {
    
    // 데이터 (모델) ⭐️⭐️⭐️
    private var userEmail: String
    
    // Output
    var userEmailString: String {
        return userEmail
    }
    
    init(userEmail: String) {
        self.userEmail = userEmail
    }
    
    // Logic...
    
}
