//
//  MerchantList.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/17.
//
import Foundation
import SwiftUI
m
struct Merchant: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let type: String
    let discount: String
    let star: String
    let url: URL
}

struct MerchantList{
    static let all = [
        Merchant(
            imageName: "DefaultImg",
            name:"Testing 1",
            type: "Food",
            discount: "",
            star:"4.5",
            url:URL(string: "https://google.com")!
        ),
        Merchant(
            imageName: "DefaultImg",
            name:"Testing 2",
            type: "Food",
            discount: "",
            star:"4.5",
            url:URL(string: "https://google.com")!
        ),
        Merchant(
            imageName: "DefaultImg",
            name:"Testing 3",
            type: "Food",
            discount: "",
            star:"4.5",
            url:URL(string: "https://google.com")!
        ),
        Merchant(
            imageName: "DefaultImg",
            name:"Testing 4",
            type: "Food",
            discount: "",
            star:"4.5",
            url:URL(string: "https://google.com")!
        )
    ]
}
