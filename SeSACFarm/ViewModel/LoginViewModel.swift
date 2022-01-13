import Foundation

class LoginViewModel {
    
    var email: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    var isCorrect = false
    
    func postUserLogin(completion: @escaping () -> Void ) {
        
        APIService.login(identifier: email.value, password: password.value) { userData, error in
            
            guard let userData = userData else {
                self.isCorrect = false
                return
            }
            
            self.isCorrect = true
            
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.username, forKey: "nickname")
            UserDefaults.standard.set(userData.user.id, forKey: "id")
            UserDefaults.standard.set(userData.user.email, forKey: "email")
            print(userData.jwt)
            
            completion()
            
        }
    }
}
