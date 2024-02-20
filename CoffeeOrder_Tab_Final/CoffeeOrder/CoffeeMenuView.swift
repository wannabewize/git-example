//
//  CoffeeMenuView.swift
//  CoffeeOrder
//
//  Created by wannabewize on 2/8/24.
//

import SwiftUI

struct CoffeeMenuView: View {
    var cart: Cart
    
    var body: some View {
        NavigationStack {
            List(coffees) { menu in
                NavigationLink {
                    CoffeeDetailView(coffee: menu, cart: cart)
                } label: {
                    HStack {
                        Image(menu.image)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(menu.name)
                                .font(.headline)
                            Text(menu.engName)
                                .font(.caption)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    CoffeeMenuView(cart: Cart())
}
