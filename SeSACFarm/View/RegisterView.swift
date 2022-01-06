import UIKit
import SnapKit
import Then

class RegisterView: UIView, ViewRepresentable {
    
    let textFieldStackView = UIStackView()
    
    let emailTextField = UITextField().then {
        $0.placeholder = " 이메일 주소"
    }
    
    let usernameTextField = UITextField().then {
        $0.placeholder = " 사용자명"
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = " 비밀번호"
    }
    
    let confirmPasswordTextField = UITextField().then {
        $0.placeholder = " 비밀번호 확인"
    }
    
    let registerButton = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        $0.backgroundColor = .systemGreen
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
 
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        
        [emailTextField, usernameTextField, passwordTextField, confirmPasswordTextField].forEach {
            $0.borderStyle = .none
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.systemGray5.cgColor
            $0.layer.cornerRadius = 5
            textFieldStackView.addArrangedSubview($0)
        }
        
        textFieldStackView.addArrangedSubview(registerButton)
        addSubview(textFieldStackView)
        
        registerButton.layer.cornerRadius = 5
        
        textFieldStackView.axis = .vertical
        textFieldStackView.distribution = .fillEqually
        textFieldStackView.spacing = 5

    }
    
    func setupConstraints() {
        
        textFieldStackView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(5)
            $0.trailing.equalTo(self).offset(-15)
            $0.leading.equalTo(self).offset(15)
        }
        
    }
}
