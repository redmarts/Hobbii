import Foundation
import HobbiiService

class LoggedInState: ObservableObject {
	@Published var loggedIn = false

	let userService = ServiceProvider.user()

	init() {
		loggedIn = userService.isLoggedIn
	}

	func setLoginState(loggedIn: Bool) {
		userService.setLoginStatus(loggedIn: loggedIn)
		self.loggedIn = loggedIn
	}
}
