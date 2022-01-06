import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"
    
    let authorLabel = UILabel()
    let contentLabel = UILabel()
    let postDateLabel = UILabel()
    let commentButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCellUI() {
        [authorLabel, contentLabel, postDateLabel, commentButton].forEach {
            addSubview($0)
        }
        
        authorLabel.backgroundColor = .lightGray
        authorLabel.textColor = .darkGray
        authorLabel.layer.cornerRadius = 10
        authorLabel.font = UIFont.systemFont(ofSize: 16)
        
        contentLabel.textColor = .black
        contentLabel.numberOfLines = 4
        contentLabel.font = UIFont.systemFont(ofSize: 18)
        
        postDateLabel.textColor = .gray
        postDateLabel.font = UIFont.systemFont(ofSize: 14)
        
        commentButton.backgroundColor = .systemGreen
        commentButton.setTitleColor(.white, for: .normal)
        commentButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }

    func setupConstraints() {
        
        authorLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(5)
            $0.leading.equalTo(self).offset(5)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(authorLabel.snp.bottom).offset(5)
            $0.leading.equalTo(self).offset(5)
            $0.trailing.equalTo(self).offset(-5)
        }
        
        postDateLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(5)
        }
        
        commentButton.snp.makeConstraints {
            $0.top.equalTo(postDateLabel.snp.bottom).offset(10)
            $0.bottom.equalTo(self).offset(-5)
            $0.leading.equalTo(self)
            $0.trailing.equalTo(self)
        }
        
        
        
        
    }
}
