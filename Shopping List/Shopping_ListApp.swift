//
//  Shopping_ListApp.swift
//  Shopping List
//
//  Created by Егор Никитин on 17.12.2020.
//

import SwiftUI

@main
struct Shopping_ListApp: App {
    var store = ProductStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ProductStore())
        }
    }
}
