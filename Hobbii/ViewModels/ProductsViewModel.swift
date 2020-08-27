import Foundation
import SwiftUI

final class ProductsViewModel: ObservableObject {
	let webservice = Webservice()

	init() {
		fetchProducts()
	}

	@Published var products: [Product] = []

	private func fetchProducts() {
		webservice.loadProducts(countryCode: .DK) { products in
			self.products = products
		}
	}

	private func fetchProduct(withId id: Int) {

	}
}
