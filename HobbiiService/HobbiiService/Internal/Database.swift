import Foundation

protocol Database {
	static var shared: Database { get }
	var products: [Product] { get set }

	var loggedInState: Bool { get set }
}

extension Database {
	mutating func setImageData(_ data: Data, on product: Product) -> Bool {

		if let index = products.firstIndex(where: { $0.id == product.id }) {
			var productToUpdate = products[index]
			productToUpdate.imageData = data
			products[index] = productToUpdate

			return true
		}

		return false
	}

	func productWith(id: Int) -> Product? {
		return products.first(where: {$0.id == id})
	}
}
