import UIKit
import SnapKit
import Then

class LoginView: UIView, ViewRepresentable {
    
    let textFieldStackView = UIStackView()
    
    let idTextField = UITextField().then {
        $0.placeholder = " 아이디(이메일)"
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = " 비밀번호"
    }
    
    let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
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
        
        [idTextField, passwordTextField].forEach {
            textFieldStackView.addArrangedSubview($0)
            $0.borderStyle = .none
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.systemGray5.cgColor
            $0.layer.cornerRadius = 5
        }
        
        textFieldStackView.addArrangedSubview(loginButton)
        addSubview(textFieldStackView)
        
        loginButton.layer.cornerRadius = 5
        
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
