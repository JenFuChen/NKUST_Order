//
//  StoreType.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/3/7.
//


import SwiftUI

struct Merchant: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let type: String
    let discount: String
    let star: String
    let url: URL
}

enum FoodType: String,CaseIterable{
    case 建工 = "建工"
    case 燕巢 = "燕巢"
    case 第一 = "第一"
    case 楠梓 = "楠梓"
    case 旗津 = "旗津"
}
