import Foundation

class PostBoardViewModel {
    
    var boardInfo: Observable<BoardInfo> = Observable([])
    
    let customAlert = CustomAlert()
    
    func fetchBoard() {
        
        let defaults = UserDefaults.standard
        
        APIService.inquireBoard(token: defaults.object(forKey: "token") as! String) { boardData, error in
            guard let boardData = boardData else {
                self.customAlert.oneOptionActionAlert(title: "알림", message: "토큰이 만료되었습니다.\n다시 로그인 해주세요", buttonTitle: "확인") {
                    print("토큰 만료") // 처리 필요
                }
                return
            }
            
            self.boardInfo.value = boardData

        }
    }
}
