//
//  ContentView.swift
//  CoffeeOrder
//

import SwiftUI

struct CoffeeDetailView: View {
    var coffee: Coffee
    @State var showNutrient = false
    @ObservedObject var cart: Cart
        
    var body: some View {
        ScrollView {
            Image(coffee.image)
            
            VStack(spacing: 10) {
                
                Text(coffee.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(coffee.engName)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(coffee.desc)
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(coffee.price) 원")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.horizontal, 16)
            
            Divider()
                .padding(.vertical, 10)
            
            Button(action: {
                showNutrient = true
            }, label: {
                Text("제품 영양 정보")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            })
            .padding(.horizontal, 20)
            .sheet(isPresented: $showNutrient, content: {
                NutrientView(nutritions: coffee.sizes)
            })
            
            VStack {
                Text("비슷한 다른 메뉴")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(coffee.similars, id: \.name) { item in
                            VStack(spacing: 10) {
                                Image(item.image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                Text(item.name)
                                    .frame(width: 80)
                                    .font(.caption)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                    }
                }
                .contentMargins(20)
            }
            .padding(.vertical, 20)
            .background(Color("bg-light-gray", bundle: nil))

            Button(action: {
                cart.addOrder(coffee)                
            }, label: {
                Text("주문하기")
            })
            .frame(maxWidth: .infinity)
            .frame(height: 30)
            .background(Color("action-green", bundle: nil))
            .font(.footnote)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
        }
        .navigationTitle(coffee.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CoffeeDetailView(coffee: coffees[0], cart: Cart())
}
