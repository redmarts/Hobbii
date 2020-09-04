import Foundation

public struct ServiceProvider {
	public static func product() -> ProductService {
		ProductServiceImp()
	}

	public static func user() -> UserService {
		UserServiceImp()
	}
}
