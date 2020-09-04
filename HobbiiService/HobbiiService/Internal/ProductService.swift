import Foundation
public protocol ProductService {
	func loadProducts(completion: @escaping ([ProductItem]) -> ())
}
