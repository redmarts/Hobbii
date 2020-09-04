import Foundation

final class MockDataBase: Database {
	static var shared: Database = MockDataBase()

	var products: [Product] = []

	var loggedInState: Bool = false
}
