import Foundation

struct User: Codable {
    let jwt: String
    let user: UserClass
}

struct UserClass: Codable {
    let id: Int
    let username, email: String
}
