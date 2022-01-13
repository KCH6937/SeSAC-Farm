import UIKit
import SnapKit

class CommentTableViewCell: UITableViewCell {
    
    static let identifier = "CommentTableViewCell"
    
    let authorLabel = UILabel()
    let contentLabel = UILabel()
    let moreButton = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setCellUI() {
        authorLabel.textColor = .black
        authorLabel.layer.cornerRadius = 10
        authorLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        contentLabel.textColor = .black
        contentLabel.numberOfLines = 6
        contentLabel.font = UIFont.systemFont(ofSize: 16)
        
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
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(self).offset(5)
            $0.trailing.equalTo(self).offset(-5)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
    }
    
}
