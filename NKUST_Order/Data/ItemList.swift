//
//  MerchantList.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/17.
//
import Foundation
import SwiftUI

struct Items: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let price: Int
    let discount: String
}

struct 炭烤三明治{
    static let all = [
        Items(
            imageName: "test1",
            name:"招牌燒肉蛋",
            price: 45,
            discount: "20%"
        ),
       Items(
            imageName: "test1",
            name:"嫩雞煎蛋",
            price: 50,
            discount: ""
        )
    ]
}

struct 義式廚房{
    static let all = [
        Items(
            imageName: "test1",
            name:"招牌燒肉蛋",
            price: 45,
            discount: "20%"
        ),
       Items(
            imageName: "test1",
            name:"嫩雞煎蛋",
            price: 50,
            discount: ""
        )
    ]
}
