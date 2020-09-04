import Foundation

final class UserServiceImp: UserService {

	var database: Database
	var loggedIn = false

	init(database: Database = MockDataBase.shared) {
		self.database = database
	}

	var username: String {
		"Test"
	}

	var isLoggedIn: Bool {
		return database.loggedInState
	}

	func setLoginStatus(loggedIn: Bool) {
		database.loggedInState = loggedIn
	}
}
