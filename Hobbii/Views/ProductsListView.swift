import SwiftUI

struct ProductsListView: View {
	@ObservedObject var viewModel = ProductsViewModel()

	var body: some View {
		List {
			if viewModel.products.count == 0 {
				VStack {
					Text("Henter data")
				}
			} else {
				ForEach(viewModel.products) { product in
					VStack {
						ProductView(product: product)
					}
				}
			}
		}
	}
}
