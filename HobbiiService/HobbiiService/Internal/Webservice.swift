import Foundation
import Combine

enum CountryCode: String {
	case DK
	case DE
}

class Webservice {

	private struct DataEncapsulator<T: Codable>: Codable {
		var data: T
	}

	private var session: URLSession!
	private var cancellable: AnyCancellable?

	func loadProducts(countryCode: CountryCode, completion: @escaping ([Product]) -> ()) {
		let url = URL(string: "https://api.sokind.com/api/v1/products")!

		load(url:url, countryCode: countryCode, completion: completion)
	}

	func loadProduct(withId id: Int, countryCode: CountryCode, completion: @escaping (Product) -> ()) {
		let url = URL(string: "https://api.sokind.com/api/v1/products/\(id)")!

		load(url:url, countryCode: countryCode, completion: completion)
	}

	private func load<T: Codable>(url: URL, countryCode: CountryCode, completion: @escaping (T) -> ()) {
		session = URLSession.shared

		var request = URLRequest(url: url)
		request.httpMethod = "GET"

		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.setValue(countryCode.rawValue, forHTTPHeaderField: "Tap-Country-Code")

		let publisher = session.dataTaskPublisher(for: request)
			.map(\.data).decode(type: DataEncapsulator<T>.self, decoder: JSONDecoder()).receive(on: DispatchQueue.main)

		self.cancellable = publisher.sink(
			receiveCompletion: { completion in
				switch completion {
				case .failure(let error):
					print(error)
				case .finished:
					print("Success")
				}
			},
			receiveValue: { repo in
				completion(repo.data)
			}
		)
	}
}
