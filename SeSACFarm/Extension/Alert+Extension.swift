import UIKit

extension UIViewController {
    
    func oneOptionAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
       
        let button = UIAlertAction(title: buttonTitle, style: .cancel)
        
        alert.addAction(button)
        
        self.present(alert, animated: true)
        
    }
    
    func oneOptionActionAlert(title: String, message: String, buttonTitle: String, action: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let button = UIAlertAction(title: buttonTitle, style: .default) { _ in
            action()
        }
        
        alert.addAction(button)
        
        self.present(alert, animated: true)
    }
    
}
