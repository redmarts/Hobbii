import SwiftUI
import AuthenticationServices

class UserSettings: ObservableObject {
// 1 = Authorized, -1 = Revoked
	@Published var authorization: Int = 0
}

struct SignInWithAppleView: UIViewRepresentable {

	func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}

	func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
		let button = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)

		button.addTarget(context.coordinator, action:  #selector(Coordinator.didTapButton), for: .touchUpInside)
		return button
	}

	func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
	}
}
