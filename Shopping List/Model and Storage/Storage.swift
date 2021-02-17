//
//  Storage.swift
//  Shopping List
//
//  Created by Егор Никитин on 19.12.2020.
//

import Foundation
import SwiftUI
import Combine

public enum Type: String {
    case food = "Продукты питания"
    case clothes = "Одежда"
    case householdChemicals = "Бытовая химия"
    case cosmetics = "Косметика"
    case electronics = "Электроника"
    case stationery = "Канцелярские товары"
    case hygieneProducts = "Товары гигиены"
    var description: String {return self.rawValue}
}


public class ProductStore: ObservableObject {
    
    /// Синголтон
    public static let shared = ProductStore()
    
    @Published var products: [TypeSection] = [food, clothes]
    

}

// ДЛЯ ТЕСТА UI
var food = TypeSection(id: 0, name: Type.food.description, products: [milk, beer, cola])
var clothes = TypeSection(id: 1, name: Type.clothes.description, products: [sneakers])
var milk = Product(id: 0, name: "Молоко", quantity: 1, type: .food, isMarked: false)
var beer = Product(id: 1, name: "Пиво", quantity: 2, type: .food, isMarked: false)
var cola = Product(id: 2, name: "Кока-кола", quantity: 3, type: .food, isMarked: false)
var sneakers = Product(id: 0, name: "Кеды", quantity: 1, type: .clothes, isMarked: false)

