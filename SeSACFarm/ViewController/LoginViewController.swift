import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let loginViewModel = LoginViewModel()

    let customAlert = CustomAlert()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setEvent()
        setNavLayout()
        setNavButton()
    }
    
    func setEvent() {
        loginViewModel.email.bind { text in
            self.loginView.idTextField.text = text
        }
        
        loginViewModel.password.bind { text in
            self.loginView.passwordTextField.text = text
        }
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        loginView.idTextField.addTarget(self, action: #selector(idTextFieldDidChange(_:)), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setNavLayout() {
        self.navigationItem.title = "새싹 로그인"
        
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
    
    @objc func loginButtonClicked() {
        print(self.loginViewModel.email.value)
        print(loginViewModel.password.value)
        
        if loginViewModel.email.value == "" || loginViewModel.password.value == "" {
            self.customAlert.oneOptionAlert(title: "알림", message: "아이디 또는 비밀번호를 입력해주세요", buttonTitle: "확인")
            
        } else {
            loginViewModel.postUserLogin {
                
                DispatchQueue.main.async {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                    windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: PostBoardViewController())
                    windowScene.windows.first?.makeKeyAndVisible()
                }
            }
        }
    }
    
    @objc func idTextFieldDidChange(_ textField: UITextField) {
        loginViewModel.email.value = textField.text ?? ""
    }
    
    @objc func passwordTextFieldDidChange(_ textField: UITextField) {
        loginViewModel.password.value = textField.text ?? ""
    }
    
}
