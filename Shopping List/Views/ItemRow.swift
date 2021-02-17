//
//  ItemRow.swift
//  Shopping List
//
//  Created by Егор Никитин on 20.12.2020.
//

import SwiftUI

struct ItemRow: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var store: ProductStore
    
    @State var isMarked: Bool = false
    
    var item: Product
    
    var sectionId: Int {
        var index: Int = 0
        for i in self.store.products {
            if i.name == item.type {
                index = i.id
            }
        }
        return index
    }
    
    var itemId: Int {
        var index: Int = 0
        for i in self.store.products {
            if i.name == item.type {
                index = i.products.firstIndex(where: {$0.id == item.id})!
            }
        }
        return index
        //self.store.products.firstIndex(where: {$0.id == item.id} )!
    }
    
    var body: some View {
        HStack {
            if self.store.products[self.sectionId].products[self.itemId].isMarked == true || isMarked == true {
            Text(item.name)
                .font(.system(size: 20))
                .strikethrough()
            } else {
                Text(item.name)
                    .font(.system(size: 20))
            }
            Text(String(item.quantity) + " шт.")
                .foregroundColor(.gray)
                .font(.system(size: 17))
//            Button(action: {print("tap")}) {
//                Image(systemName: "square.and.pencil")
//            }
            Spacer()
            Circle()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(self.store.products[self.sectionId].products[self.itemId].isMarked == true ? .green: .red)
            Button(action: {
                print("tap checkButton")
                print("Section: \(sectionId), item: \(itemId)")
                self.store.products[self.sectionId].products[self.itemId].isMarked.toggle()
                isMarked.toggle()
                print(self.store.products[self.sectionId].products[self.itemId].isMarked)
            }, label: {
                Image(systemName: self.store.products[self.sectionId].products[self.itemId].isMarked == true ? "checkmark": "")
                    .frame(width: 20, height: 20, alignment: .center)
                    .overlay(Rectangle().stroke(colorScheme == .light ? Color.black: Color.white, lineWidth: 2))
            })
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ItemRow(item: food.products[0])
                .preferredColorScheme(.light)
            ItemRow(item: food.products[1])
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 400, height: 50))
        .environmentObject(ProductStore())
    }
    
}
