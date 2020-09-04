import Combine
import Foundation
import SwiftUI

class ProductServiceImp: ProductService {

	var database: Database

	let webservice = Webservice()

	init(database: Database = MockDataBase.shared) {
		self.database = database
	}

	func loadProducts(completion: @escaping ([ProductItem]) -> ()) {
		webservice.loadProducts(countryCode: .DK) { products in
			self.database.products = products
			completion(products.asProductItems)
		}
	}
}

extension Product {
	var asProductItem: ProductItem {
		ProductItem(id: id, name: name, price: price.regular, rating: reviews?.rating, imageUrl: image.url, description: description)
	}
}

extension Array where Element == Product {
	var asProductItems: [ProductItem] {
		self.map { $0.asProductItem }
	}
}
