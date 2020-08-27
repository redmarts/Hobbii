import Foundation
final class LoginViewModel: ObservableObject {
	@Published var loggedIn = false
	func loginTapped() {
		loggedIn = true
	}
}
