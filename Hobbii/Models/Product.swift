//
//  Model.swift
//  Hobbii
//
//  Created by Martin Dissing Söderlind on 25/08/2020.
//  Copyright © 2020 Martin Söderlind. All rights reserved.
//

import Foundation

struct VideoObject: Codable {
	var url: URL
	var sound: Bool
}

struct ImageObject: Codable {
	var url: URL
	var title: String
	var alt: String
	var video: VideoObject?
}

struct MultipleProducts: Codable {
	var data: [Product]
}

struct SingleProduct: Codable {
	var data: Product
}

struct Product: Codable, Identifiable {
	var id: Int
	var name: String
	var image: ImageObject
	var description: String//Not defined
	var shortDescription: String
	var price: PriceObject
	var available: Bool
	var slug: String
	var attributes: [Attribute]
	var categories: [Int]
	var rating: RatingObject? //Optional?
	var sortOrder: Int? //Optional?
	var discounts: [RuleObject]
	var reviews: ReviewObject?
}

struct RuleObject: Codable {
	var quantity: Int
	var regular: Double //price?
	var saving: Double? //Not defined
}

struct Attribute: Codable {
	var name: String
	var value: String
	var sortOrder: Int
}

struct PriceObject: Codable {
	var regular: Double
	var sale: Double
}

struct RatingObject: Codable {
	var rating: Double
	var quantity: Int
}

struct ReviewObject: Codable {
	var rating: Double
	var quantity: Int
}
