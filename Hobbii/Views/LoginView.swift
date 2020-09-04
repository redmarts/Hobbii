import SwiftUI
import HobbiiService

struct LoginView: View {


	@State var loogedIn = false

	@EnvironmentObject var loggedInState: LoggedInState

	var body: some View {
		VStack {
			Image("hobbiilogo").resizable()
			.scaledToFit()
			SignInWithAppleView()
					.frame(width: 200, height: 50)

			Button(action: {

				self.loggedInState.loggedIn.toggle()
			}) {
				Text("Skip login")
			}

		}
	}
}

