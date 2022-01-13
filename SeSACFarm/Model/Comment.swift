import Foundation

struct CommentElement: Codable {
    let id: Int?
    let comment: String?
    let user: CommentUser?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, comment, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct CommentUser: Codable {
    let id: Int?
    let username: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, username
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

typealias CommentInfo = [CommentElement]
