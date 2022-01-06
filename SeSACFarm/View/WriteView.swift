import UIKit
import SnapKit
import Then

class WriteView: UIView, ViewRepresentable {

    let writeTextView = UITextView().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20)
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
        addSubview(writeTextView)
    }
    
    func setupConstraints() {
        
        writeTextView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalTo(self.safeAreaLayoutGuide)
            $0.trailing.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}




