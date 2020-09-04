import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
	@Published var image: UIImage?
	private let url: URL

	private var cache: ImageCache?

	private var cancellable: AnyCancellable?

	private(set) var isloading = false

	private static let imageProcessingQueue = DispatchQueue(label: "image-processing")

	init(url: URL, cache: ImageCache? = nil) {
		self.url = url
		self.cache = cache
	}

	deinit {
		cancellable?.cancel()
	}

	func load() {
		guard !isloading else { return }
		if let image = cache?[url] {
			self.image = image
			return
		}

		cancellable = URLSession.shared.dataTaskPublisher(for: url)
			.subscribe(on: Self.imageProcessingQueue)
			.map { UIImage(data: $0.data) }
			.replaceError(with: nil)
			.handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
						  receiveOutput: { [weak self] in self?.cache($0) },
						  receiveCompletion: { [weak self] _ in self?.onFinish() },
						  receiveCancel: { [weak self] in self?.onFinish() })
			.receive(on: DispatchQueue.main)
			.assign(to: \.image, on: self)
	}

	private func onStart() {
		isloading = true
	}

	private func onFinish() {
		isloading = false
	}

	private func cache(_ image: UIImage?) {
		image.map { cache?[url] = $0 }
	}

	func cancel() {
		cancellable?.cancel()
	}
}
