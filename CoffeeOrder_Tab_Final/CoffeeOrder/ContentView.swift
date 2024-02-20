//
//  ContentView.swift
//  CoffeeOrder
//
//  Created by Jaehoon Lee on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cart = Cart()

    var body: some View {
        TabView {
            CoffeeMenuView(cart: cart)
                .tabItem {
                    Image(systemName: "cup.and.saucer")
                    Text("Coffee")
                }
            
            CartView(cart: cart)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
        }        
    }
}

#Preview {
    ContentView()
}
