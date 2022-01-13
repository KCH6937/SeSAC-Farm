import UIKit

class CommentViewController: UIViewController {

    let commentTableView = UITableView()
    let commentViewModel = CommentViewModel()
    let moreButton = UIButton()
    
    var postId: Int = 0
    var postInfo: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
        commentTableView.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.identifier)
        print(postId) // log
        setEvent()
        setNavLayout()
        setNavButton()
    }
    
    func setEvent() {
        commentViewModel.fetchComment(postId: self.postId)
        self.commentViewModel.commentInfo.bind { commentInfo in
            DispatchQueue.main.async {
                self.commentTableView.reloadData()
            }
        }
    }
    
    func setNavLayout() {
        self.navigationItem.title = ""
        
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
    
    func setNavButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonClicked))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(moreButtonClicked))
    }
    
    func setupView() {
        view.addSubview(commentTableView)
        
        commentTableView.backgroundColor = .white
    }
    
    func setupConstraints() {
        
        
        
//        commentTableView.snp.makeConstraints {
//
//        }
    }

    @objc func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func moreButtonClicked() {
        
    }
}

extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = commentTableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
        
        
        
        return cell
    }


}
