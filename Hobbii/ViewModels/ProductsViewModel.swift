import Foundation
import SwiftUI
import HobbiiService

final class ProductsViewModel: ObservableObject {
	let productService = ServiceProvider.product()

	init() {
		fetchProducts()
	}

	@Published var products: [ProductItem] = []

	private func fetchProducts() {
		productService.loadProducts { products in
			self.products = products
		}
	}

	private func fetchProduct(withId id: Int) {

	}
}
