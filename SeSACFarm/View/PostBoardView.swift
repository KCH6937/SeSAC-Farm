import UIKit
import SnapKit
import Then

class PostBoardView: UIView, ViewRepresentable {

    let BoardTableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        BoardTableView.delegate = self
        BoardTableView.dataSource = self

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupView() {
        
    }

    func setupConstraints() {

    }

}

extension PostBoardView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "") else { return UITableViewCell() }
  

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 7
    }

}
