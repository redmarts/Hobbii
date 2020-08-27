import Foundation
import Combine


protocol DataCarrier {
	associatedtype T
	var data: T { get }
}

extension MultipleProducts: DataCarrier {}
extension SingleProduct: DataCarrier {}

enum CountryCode: String {
	case DK
	case DE
}

class Webservice {

	var session: URLSession!
	private var cancellable: AnyCancellable?
	//<T: DataCarrier&Codable>
	func loadProducts(countryCode: CountryCode, completion: @escaping ([Product]) -> ()) {

		session = URLSession.shared
		let url = URL(string: "https://api.sokind.com/api/v1/products")!

		var request = URLRequest(url: url)
		request.httpMethod = "GET"

		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.setValue(countryCode.rawValue, forHTTPHeaderField: "Tap-Country-Code")

		let publisher = session.dataTaskPublisher(for: request)
			.map(\.data).decode(type: MultipleProducts.self, decoder: JSONDecoder()).receive(on: DispatchQueue.main)

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
