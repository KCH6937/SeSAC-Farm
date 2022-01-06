import UIKit

class FirstViewController: UIViewController {
    
    let firstView = FirstView()
    
    override func loadView() {
        self.view = firstView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        firstView.startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        firstView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func startButtonClicked() {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func loginButtonClicked() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
}

