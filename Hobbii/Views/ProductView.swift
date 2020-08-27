//
//  ProductView.swift
//  Hobbii
//
//  Created by Martin Dissing Söderlind on 27/08/2020.
//  Copyright © 2020 Martin Söderlind. All rights reserved.
//

import SwiftUI

struct ProductView: View {
	@State private var showDetails = false
	@State private var image = UIImage()
	@ObservedObject  var imageLoader: ImageLoader
	var product: Product

	var rating: Double {
		return product.reviews?.rating ?? 0
	}

	var price: Double {
		return product.price.regular
	}

	init(product: Product) {
		self.product = product
		self.imageLoader = ImageLoader(url: product.image.url)
	}

	var body: some View {
		VStack {
			if showDetails {
				Image(uiImage: image).resizable().aspectRatio(contentMode: .fill).onReceive(imageLoader.didChange) { data in
					self.image = UIImage(data: data) ?? UIImage()
				}

				Text(product.name)
				Text(product.description)
				HStack {
					ForEach(0..<5) { i in
						Star(corners: 5, smoothness: 0.5).fill(Int(self.rating)>i ? Color.yellow : Color.gray)
					}
				}.aspectRatio(contentMode: .fill)
			} else {
				HStack {
					Image(uiImage: image).resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80, alignment: .center).clipShape(Circle()).onReceive(imageLoader.didChange) { data in
						self.image = UIImage(data: data) ?? UIImage()
					}
					Text(product.name).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))

					Text(String(price)).frame(width: 100, height: 20, alignment: .trailing)
				}
			}
		}.onTapGesture {
			self.showDetails.toggle()
		}
	}
}
