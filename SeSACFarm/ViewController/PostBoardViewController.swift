import UIKit

class PostBoardViewController: UIViewController, ViewRepresentable {
    
    let postBoardViewModel = PostBoardViewModel()
    let boardTableView = UITableView()
    let formatter = DateFormatter()
    let writeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        boardTableView.delegate = self
        boardTableView.dataSource = self
        boardTableView.translatesAutoresizingMaskIntoConstraints = false
        boardTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        
        postBoardViewModel.fetchBoard()
        self.postBoardViewModel.boardInfo.bind { boardInfo in
            DispatchQueue.main.async{
                self.boardTableView.reloadData()
            }
            
        }
        
        setupView()
        setupConstraints()
        setNavLayout()
//        print(self.postBoardViewModel.boardInfo.value)
        
    }
    
    func setNavLayout() {
        self.navigationItem.title = "새싹농장"
        
        let appearance = UINavigationBarAppearance()
        guard let navBar = self.navigationController?.navigationBar else { return }
        
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
        navBar.tintColor = .black
        
        writeButton.setTitle("", for: .normal)
        writeButton.setImage(UIImage(systemName: "plus"), for: .normal)
        writeButton.layer.cornerRadius = 12
        writeButton.layer.borderWidth = 2
        writeButton.layer.borderColor = UIColor.systemBlue.cgColor
        
    }
    
    func setupView() {
        [boardTableView, writeButton].forEach {
            view.addSubview($0)
        }
        writeButton.addTarget(self, action: #selector(writeButtonClicked), for: .touchUpInside)
        
        boardTableView.backgroundColor = .lightGray
    }
    
    func setupConstraints() {
        boardTableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        writeButton.snp.makeConstraints {
            $0.bottom.equalTo(boardTableView.snp.bottom).inset(30)
            $0.trailing.equalTo(boardTableView.snp.trailing).inset(30)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
    }
    
    func getDate(dateStr: String) -> String {
        if dateStr == "noData" {
            return dateStr
        }
        
        let newStr = dateStr.replacingOccurrences(of: "-", with: "/").replacingOccurrences(of: "T", with: " ").dropLast(5)

        let date = formatter.date(from:String(newStr))!
        
        let strValue = formatter.string(from: date)
        
        return strValue
       
    }
    
    @objc func writeButtonClicked() {
        self.navigationController?.pushViewController(WriteViewController(), animated: true)
    }
    
}

extension PostBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postBoardViewModel.boardInfo.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = boardTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        let row = postBoardViewModel.boardInfo.value[indexPath.row]
//        print(row)
        
        cell.authorLabel.text = row.user?.username
        cell.contentLabel.text = row.text
        
        cell.postDateLabel.text = getDate(dateStr: row.createdAt ?? "noData")
        
        if row.comments!.count == 0 {
            cell.commentButton.setTitle("댓글 쓰기", for: .normal)
        } else {
            cell.commentButton.setTitle("댓글 \(row.comments!.count)", for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
