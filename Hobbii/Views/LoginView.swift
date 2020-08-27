import SwiftUI

struct LoginView: View {

	//var viewModel = LoginViewModel()

	@EnvironmentObject var loggedInState: LoggedInState

	var body: some View {
		VStack {
			Image("hobbiilogo").resizable()
			.scaledToFit()
			SignInWithAppleView()
					.frame(width: 200, height: 50)

			Button(action: {
				self.loggedInState.loggedIn.toggle()
				//self.viewModel.loginTapped()
			}) {
				Text("Skip login")
			}

		}
	}
}

