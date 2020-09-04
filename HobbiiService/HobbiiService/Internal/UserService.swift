import Foundation

public protocol UserService {
	var username: String { get }

	var isLoggedIn: Bool { get }

	func setLoginStatus(loggedIn: Bool)
}
