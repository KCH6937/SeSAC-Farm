import UIKit

class WriteViewController: UIViewController {

    let writeView = WriteView()
    let writeViewModel = WriteViewModel()
    
    override func loadView() {
        self.view = writeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "게시글 작성"
        self.writeView.writeTextView.delegate = self
        setNavButton()
    }
    
    func setNavButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: self, action: #selector(writeCompleteButtonClicked))
    }
    
    @objc func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func writeCompleteButtonClicked() {
        writeViewModel.writeBoard()
        
        oneOptionActionAlert(title: "알림", message: "작성완료!!", buttonTitle: "확인") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

extension WriteViewController: UITextViewDelegate {

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        writeViewModel.content = textView.text
        return true
    }
    
}
