//
//  NutrientView.swift
//  CoffeeOrder
//

import SwiftUI

struct NutrientItemView: View {
    var name: String
    var amount: String
    var unit: String

    var body: some View {
        HStack(spacing: 0) {
            Text(name)
                .font(.system(size: 13))
                .frame(alignment: .leading)
            Spacer()
            Text(amount)
                .font(.system(size: 13))
            Text(unit)
                .font(.system(size: 13))
        }
    }
}

struct NutrientView: View {
    let nutritions: [Nutrition]
    @State var selectedNutrition: Nutrition?

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 0) {
                HStack {
                    ForEach(nutritions, id: \.size) { nutrition in
                        Button(action: {
                            selectedNutrition = nutrition
                        }, label: {
                            VStack {
                                Text(nutrition.size.title)
                                    .font(Font.system(size: 14))
                                    .bold(selectedNutrition == nutrition)
                                    .foregroundStyle(selectedNutrition == nutrition ? .black : .gray)
                                Spacer()
                                if selectedNutrition == nutrition {
                                    Rectangle()
                                        .foregroundStyle(.green)
                                        .frame(height: 2)
                                }
                            }
                            .frame(width: 60, height: 30)
                        })
                    }
                    Spacer()
                }
                Divider()
            }

            
            if let nutrition = selectedNutrition {
                VStack(spacing: 16) {
                    NutrientItemView(name: "용량", amount: "\(nutrition.amount)", unit: "ml")
                    
                    NutrientItemView(name: "칼로리", amount: "\(nutrition.calories)", unit: "kcal")
                    
                    NutrientItemView(name: "탄수화물", amount: "\(nutrition.calories)", unit: "g")
                    
                    NutrientItemView(name: "당류", amount: "\(nutrition.sugars)", unit: "g")
                    
                    NutrientItemView(name: "나트륨", amount: "\(nutrition.sodium)", unit: "mg")
                    
                    NutrientItemView(name: "단백질", amount: "\(nutrition.protein)", unit: "g")
                    
                    NutrientItemView(name: "지방", amount: "\(nutrition.fat)", unit: "g")
                    
                    NutrientItemView(name: "콜레스테롤", amount: "\(nutrition.cholesterol)", unit: "mg")
                    
                    NutrientItemView(name: "카페인", amount: "\(nutrition.caffein)", unit: "mg")
                }
                .padding(.horizontal, 10)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            if nutritions.count > 0 {
                self.selectedNutrition = nutritions[0]
            }
        }
    }
}

#Preview {    
    NutrientView(nutritions: iceAmericano.sizes)
}
