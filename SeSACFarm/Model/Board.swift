import Foundation

struct Board: Codable {
    let id: Int?
    let text: String?
    let user: UserElement?
    let createdAt, updatedAt: String?
    let comments: [Comment]?
    
    enum CodingKeys: String, CodingKey {
        case id, text, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case comments
    }
}

struct Comment: Codable {
    let id: Int?
    let comment: String?
    let user, post: Int?
    let createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case comment
        case user, post
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct UserElement: Codable {
    let id: Int?
    let username, email: String?
    let confirmed: Bool?
    let blocked: Bool?
    let role: Int?
}

typealias BoardInfo = [Board]
