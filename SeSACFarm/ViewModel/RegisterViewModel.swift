import Foundation

class RegisterViewModel {
    
    var email: Observable<String> = Observable("")
    var username: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    var passwordConfirm: Observable<String> = Observable("")
    
    let customAlert = CustomAlert()
    
    func postUserRegister(completion: @escaping () -> Void) {
        
        APIService.register(email: email.value, username: username.value, password: password.value) { userData, error in
            
            guard let userData = userData else {
                self.customAlert.oneOptionAlert(title: "알림", message: "아이디가 이미 존재합니다.", buttonTitle: "닫기")
                return
            }
            
            print(userData)

            completion()
        }
        
    }
}
