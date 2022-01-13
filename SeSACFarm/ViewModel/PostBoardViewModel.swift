import Foundation

class PostBoardViewModel {
    
    var boardInfo: Observable<BoardInfo> = Observable([])
    
    func fetchBoard() {
        
        let defaults = UserDefaults.standard
        
        APIService.inquireBoard(token: defaults.object(forKey: "token") as! String) { boardData, error in
            guard let boardData = boardData else {
                print("토큰 만료") // 처리 필요
                return
            }
            
            self.boardInfo.value = boardData

        }
    }
    
}
