//
//  ProductView.swift
//  Hobbii
//
//  Created by Martin Dissing Söderlind on 27/08/2020.
//  Copyright © 2020 Martin Söderlind. All rights reserved.
//

import SwiftUI
import HobbiiService


struct ProductView: View {
	@State private var showDetails = false

	@Environment(\.imageCache) var cache: ImageCache

	var product: ProductItem

	var rating: Double {
		return product.rating ?? 0
	}

	var price: Double {
		return product.price
	}

	init(product: ProductItem) {
		self.product = product
	}

	var body: some View {
		VStack {
			if showDetails {
				AsyncImage(url: product.imageUrl, placeholder: Text("Loading.."), cache: cache, configuration: { $0.resizable() }).aspectRatio(contentMode: .fill)

				Text(product.name)
				Text(product.description)
				HStack {
					ForEach(0..<5) { i in
						Star(corners: 5, smoothness: 0.5).fill(Int(self.rating)>i ? Color.yellow : Color.gray)
					}
				}.aspectRatio(contentMode: .fill)
			} else {
				HStack {
					AsyncImage(url: product.imageUrl, placeholder: Text("Loading.."), cache: cache, configuration: { $0.resizable() }).aspectRatio(contentMode: .fill).frame(width: 80, height: 80, alignment: .center).clipShape(Circle())
					Spacer(minLength: 10)
					Text(product.name).frame(width: 160, height: 20, alignment: .leading)

					Text(String(price)).frame(width: 100, height: 20, alignment: .leading)
				}
			}
		}.onTapGesture {
			self.showDetails.toggle()
		}
	}
}
