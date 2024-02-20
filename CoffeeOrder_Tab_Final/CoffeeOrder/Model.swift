//
//  Model.swift
//  CoffeeOrder
//

import Foundation

enum Size: Int {
    case tall = 1
    case grande
    case venti
    
    var title: String {
        switch self {
        case .tall: "Tall"
        case .grande: "Grande"
        case .venti: "Venti"
        }
    }
}

struct Nutrition: Equatable {
    let size: Size
    let amount: Int
    let calories: Int
    let carbohydrates: Int // 탄수화물
    let sugars: Int // 당류
    let sodium: Int // 나트륨
    let protein: Int // 단백질
    let fat: Int // 지방
    let cholesterol: Int // 콜레스테롤
    let caffein: Int // 카페인
}

struct SimilarMenu {
    let name: String
    let image: String
}

struct Coffee: Identifiable {
    let id = UUID()
    let name: String
    let engName: String
    let price: Int
    let image: String
    let desc: String
    let alergy: String?
    
    let sizes: [Nutrition]
    let similars: [SimilarMenu]
}

let iceAmericano = Coffee(
    name: "아이스 카페 아메리카노", engName: "Iced Caffe Americano",
    price: 4500,
    image: "iced-caffe-americano",
    desc: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
    alergy: nil,
    sizes: [
        Nutrition(size: .tall, amount: 355, calories: 10, carbohydrates: 2, sugars: 0, sodium: 5, protein: 1, fat: 0, cholesterol: 0, caffein: 150),
        Nutrition(size: .grande, amount: 473, calories: 15, carbohydrates: 3, sugars: 0, sodium: 10, protein: 2, fat: 0, cholesterol: 0, caffein: 225),
        Nutrition(size: .venti, amount: 591, calories: 25, carbohydrates: 4, sugars: 0, sodium: 10, protein: 1, fat: 0, cholesterol: 0, caffein: 300)
    ],
    similars: [
        SimilarMenu(name: "아이스 디카페인 카페 아메리카", image: "iced-decaf-caffe-americano"),
        SimilarMenu(name: "피치 딸기 피지오", image: "peach-strawberry-starbucks-fizzio"),
        SimilarMenu(name: "아이스 자몽 허니 블랙 티", image: "iced-grapefruit-honey-black-tea"),
        SimilarMenu(name: "아이스 스타벅스 돌체 라떼", image: "iced-starbucks-dolce-latte"),
        SimilarMenu(name: "에스프레소 콘 파나", image: "espresso-con-panna")
    ]
)

let honeyBlackTea = Coffee(
    name: "아이스 자몽 허니 블랙 티", engName: "Iced Grapefruit Honey Black Tea",
    price: 5700,
    image: "iced-grapefruit-honey-black-tea",
    desc: "새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의 스타벅스 티바나 블랙 티의 조화",
    alergy: nil,
    sizes: [
        Nutrition(size: .tall, amount: 355, calories: 125, carbohydrates: 31, sugars: 30, sodium: 5, protein: 0, fat: 0, cholesterol: 0, caffein: 30),
        Nutrition(size: .grande, amount: 473, calories: 175, carbohydrates: 43, sugars: 41, sodium: 5, protein: 0, fat: 0, cholesterol: 0, caffein: 45),
        Nutrition(size: .venti, amount: 591, calories: 220, carbohydrates: 54, sugars: 52, sodium: 7, protein: 0, fat: 0, cholesterol: 0, caffein: 55)
    ],
    similars: [
        SimilarMenu(name: "아이스 디카페인 카페 아메리카", image: "iced-decaf-caffe-americano"),
        SimilarMenu(name: "피치 딸기 피지오", image: "peach-strawberry-starbucks-fizzio"),
        SimilarMenu(name: "아이스 스타벅스 돌체 라떼", image: "iced-starbucks-dolce-latte"),
        SimilarMenu(name: "에스프레소 콘 파나", image: "espresso-con-panna")
    ]
)

let icedCaffeeLatte = Coffee(
    name: "아이스 카페 라떼", engName: "Iced Caffe Latte",
    price: 5000,
    image: "iced-caffe-latte",
    desc: "풍부하고 진한 농도의 에스프레소가 시원한 우유와 얼름을 만나 고소함과 시원함을 즐길 수 있는 대표적인 커피 라떼",
    alergy: "우유",
    sizes: [
        Nutrition(size: .tall, amount: 355, calories: 110, carbohydrates: 9, sugars: 8, sodium: 75, protein: 6, fat: 6, cholesterol: 20, caffein: 75),
        Nutrition(size: .grande, amount: 473, calories: 150, carbohydrates: 12, sugars: 10, sodium: 95, protein: 8, fat: 7, cholesterol: 25, caffein: 150),
        Nutrition(size: .venti, amount: 591, calories: 210, carbohydrates: 17, sugars: 15, sodium: 135, protein: 11, fat: 10, cholesterol: 30, caffein: 150)
    ],
    similars: []
)


let coffees = [
    iceAmericano,
    honeyBlackTea,
    icedCaffeeLatte
]


struct CoffeeOrder: Identifiable {
    // 목록에서 사용할 ID
    let id = UUID()
    let coffee: Coffee
}

class Cart: ObservableObject {
    @Published var orders: [CoffeeOrder] = []
    
    func addOrder(_ coffee: Coffee) {
        orders.append(CoffeeOrder(coffee: coffee))
    }
}
