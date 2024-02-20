//
//  OrderedListView.swift
//  CoffeeOrder
//
//  Created by Jaehoon Lee on 2/2/24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart
    
    var body: some View {
        VStack {
            if cart.orders.count > 0 {
                List(cart.orders) { order in
                    Text(order.coffee.name)
                }
                .listStyle(.plain)
            }
            else {
                VStack {
                    Spacer()
                    Text("주문 내역이 없습니다.")
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    let cart = Cart()
    cart.addOrder(coffees[0])
    cart.addOrder(coffees[1])
    cart.addOrder(coffees[0])
    return
        CartView(cart: cart)            
}
