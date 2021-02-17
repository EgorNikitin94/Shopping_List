//
//  ContentView.swift
//  Shopping List
//
//  Created by Егор Никитин on 17.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var store: ProductStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.products) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.products) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            .navigationBarTitle("Мои покупки")
            .navigationBarItems(leading: Button(action: {
                                    print("tap")}) {
                Image(systemName: "trash")
                    .accentColor(colorScheme == .dark ? .white : .black)
            }, trailing: Button(action: {
                                    print("tap")}) {
                Image(systemName: "plus")
                    .accentColor(colorScheme == .dark ? .white : .black)
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 mini")
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 12 mini")
        }
        .environmentObject(ProductStore())
    }
}

