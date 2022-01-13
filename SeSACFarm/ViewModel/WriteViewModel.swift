import Foundation

class WriteViewModel {
    var content: String = "no input"
    
    func writeBoard() {
        
        let defaults = UserDefaults.standard
        
        APIService.writeBoard(token: defaults.object(forKey: "token") as! String, text: content) { error in
            print(error)
            guard error != nil else {
                return
            }
        
        }
    }
}
