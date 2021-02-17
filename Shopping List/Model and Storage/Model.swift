//
//  Model.swift
//  Shopping List
//
//  Created by Егор Никитин on 19.12.2020.
//

import Foundation

public class TypeSection: Identifiable {
    public let id: Int
    public let name: String
    public var products = [Product]()
    
    public init(id: Int, name: String, products: [Product]) {
        self.id = id
        self.name = name
        self.products = products
    }
}

public class Product: Identifiable {
    public let id: Int
    public var name: String
    public var quantity: Int
    public var type: String
    public var isMarked: Bool
    
    public init(id: Int, name: String, quantity: Int, type: Type, isMarked: Bool) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.type = type.description
        self.isMarked = isMarked
    }
}
