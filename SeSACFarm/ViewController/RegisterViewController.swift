import UIKit

class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()
    let registerViewModel = RegisterViewModel()
    
    let customAlert = CustomAlert()
    
    override func loadView() {
        self.view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setEvent()
        setNavLayout()
        setNavButton()
    }
    
    func setEvent() {
        
        registerViewModel.username.bind { text in
            self.registerView.usernameTextField.text = text
        }
        
        registerViewModel.email.bind { text in
            self.registerView.emailTextField.text = text
        }
        
        registerViewModel.password.bind { text in
            self.registerView.passwordTextField.text = text
        }
        
        registerViewModel.passwordConfirm.bind { text in
            self.registerView.confirmPasswordTextField.text = text
        }
        
        registerView.registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        registerView.emailTextField.addTarget(self, action: #selector(idTextFieldDidChange(_:)), for: .editingChanged)
        registerView.usernameTextField.addTarget(self, action: #selector(usernameTextFieldDidChange(_:)), for: .editingChanged)
        registerView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        registerView.confirmPasswordTextField.addTarget(self, action: #selector(passwordConfirmTextFieldDidChange(_:)), for: .editingChanged)
    }

    func setNavLayout() {
        self.navigationItem.title = "새싹 가입하기"
        
        let appearance = UINavigationBarAppearance()
        guard let navBar = self.navigationController?.navigationBar else { return }
        
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
        navBar.tintColor = .black
    }
    
    func setNavButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonClicked))
    }
    
    @objc func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func registerButtonClicked() { // alert 처리 필요
        print(registerViewModel.passwordConfirm.value)
        
        if registerViewModel.email.value == "" || registerViewModel.password.value == "" || registerViewModel.username.value == "" || registerViewModel.passwordConfirm.value == "" {
            self.customAlert.oneOptionAlert(title: "알림", message: "빈 칸을 모두 입력해주세요", buttonTitle: "확인")
            
        } else if registerViewModel.passwordConfirm.value != registerViewModel.password.value {
            self.customAlert.oneOptionAlert(title: "알림", message: "비밀번호가 다릅니다", buttonTitle: "확인")
            
        } else {
            registerViewModel.postUserRegister {
                DispatchQueue.main.async {
                    self.customAlert.oneOptionAlert(title: "알림", message: "회원가입 완료!!\n\(self.registerViewModel.username.value) 가입을 축하드립니다", buttonTitle: "닫기")
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.pushViewController(LoginViewController(), animated: true)
                }
            }
        }
        
    }
    
    @objc func idTextFieldDidChange(_ textField: UITextField) {
        registerViewModel.email.value = textField.text ?? ""
    }
    
    @objc func usernameTextFieldDidChange(_ textField: UITextField) {
        registerViewModel.username.value = textField.text ?? ""
    }
    
    @objc func passwordTextFieldDidChange(_ textField: UITextField) {
        registerViewModel.password.value = textField.text ?? ""
    }
    
    @objc func passwordConfirmTextFieldDidChange(_ textField: UITextField) {
        registerViewModel.passwordConfirm.value = textField.text ?? ""
    }
}
