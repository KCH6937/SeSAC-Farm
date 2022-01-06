import UIKit
import SnapKit
import Then

class FirstView: UIView, ViewRepresentable {
    
    let posterImageView = UIImageView().then {
        $0.image = UIImage(named: "logo_ssac_white")
    }
    
    let commentHeaderLabel = UILabel().then {
        $0.text = "당신 근처의 새싹 농장"
        $0.textColor = .black
    }
    
    let commentContentLabel = UILabel().then {
        $0.text = "iOS 지식부터 나라의 바람까지\nSeSAC에서 함께해보세요!"
        $0.textColor = .darkGray
    }
    
    let startButton = UIButton().then {
        $0.setTitle("지금 시작하기", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        $0.backgroundColor = .green
    }
    
    let accountStackView = UIStackView()
    
    let haveAccountLabel = UILabel().then {
        $0.text = "이미 계정이 있나요?"
        $0.textColor = .gray
    }
    
    let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(.systemGreen, for: .normal)
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
        [posterImageView, commentHeaderLabel, commentContentLabel, startButton, accountStackView, startButton, accountStackView, haveAccountLabel, loginButton].forEach {
            self.addSubview($0)
        }
        
        [haveAccountLabel, loginButton].forEach {
            accountStackView.addArrangedSubview($0)
        }
        
        accountStackView.spacing = 5
        accountStackView.axis = .horizontal
        accountStackView.distribution = .fillProportionally
        
        commentContentLabel.textAlignment = .center
        commentContentLabel.numberOfLines = 2
        
        startButton.layer.cornerRadius = 5
    }

    func setupConstraints() {
 
        posterImageView.snp.makeConstraints {
            $0.centerY.equalTo(self).offset(-100)
            $0.centerX.equalTo(self)
        }
        
        commentHeaderLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(5)
            $0.centerX.equalTo(self)
        }
        
        commentContentLabel.snp.makeConstraints {
            $0.top.equalTo(commentHeaderLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(self)
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.equalTo(accountStackView.snp.top).offset(-10)
            $0.centerX.equalTo(self)
            $0.trailing.equalTo(self).offset(-15)
        }
        
        accountStackView.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-10)
            $0.centerX.equalTo(self)
        }
        
        
    }
    

    
}
