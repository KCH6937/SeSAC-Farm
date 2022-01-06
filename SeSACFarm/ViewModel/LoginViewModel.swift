import Foundation

class LoginViewModel {
    
    var email: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    let customAlert = CustomAlert()
    
    func postUserLogin(completion: @escaping () -> Void ) {
        
        APIService.login(identifier: email.value, password: password.value) { userData, error in
            
            guard let userData = userData else {
                self.customAlert.oneOptionAlert(title: "알림", message: "아이디 또는 비밀번호가 일치하지 않습니다.", buttonTitle: "확인")
                return
            }
            
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.username, forKey: "nickname")
            UserDefaults.standard.set(userData.user.id, forKey: "id")
            UserDefaults.standard.set(userData.user.email, forKey: "email")

            completion()
        }
    }
}
