import Foundation

class CommentViewModel {
    
    var commentInfo: Observable<CommentInfo> = Observable([])
    
    func fetchComment(postId: Int) {
        
        let defaults = UserDefaults.standard
        
        APIService.inquireComment(token: defaults.object(forKey: "token") as! String, postId: postId) { commentData, error in
            
            guard let commentData = commentData else {
                return
            }

            self.commentInfo.value = commentData
            
        }
    }

}
