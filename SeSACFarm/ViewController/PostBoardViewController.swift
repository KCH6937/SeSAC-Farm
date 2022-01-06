import UIKit

class PostBoardViewController: UIViewController, ViewRepresentable {
    
    let postBoardViewModel = PostBoardViewModel()
    
    let boardTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        DispatchQueue.main.async {  // ?
            self.postBoardViewModel.boardInfo.bind { boardInfo in
                self.postBoardViewModel.fetchBoard()
                self.boardTableView.reloadData()
            }
        }
        
        
        boardTableView.delegate = self
        boardTableView.dataSource = self
        boardTableView.translatesAutoresizingMaskIntoConstraints = false
        boardTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        
        setupView()
        setupConstraints()
        setNavLayout()
        print(postBoardViewModel.boardInfo.value)
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
        
    }

    @objc func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupView() {
        view.addSubview(boardTableView)
        boardTableView.backgroundColor = .lightGray
    }
    
    func setupConstraints() {
        boardTableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension PostBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postBoardViewModel.boardInfo.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = boardTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        let row = postBoardViewModel.boardInfo.value[indexPath.row]
        print(row)
        
        cell.authorLabel.text = row.user?.username
        cell.contentLabel.text = row.text
        cell.postDateLabel.text = row.createdAt
        
        if row.comments!.count == 0 {
            cell.commentButton.setTitle("댓글 쓰기", for: .normal)
        } else {
            cell.commentButton.setTitle("댓글 \(row.comments!.count)", for: .normal)
        }
        
        return cell
    }
    
    
    
}
