//
//  MerchantView.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/21.
//

import SwiftUI
m
struct MerchantView: View {
    var merchant: Merchant
    var body: some View {
        Text(merchant.name)
            .font(.title)
            .foregroundColor(.secondary)
    }
}

struct MerchantView_Previews: PreviewProvider {
    static var previews: some View {
        MerchantView(merchant: MerchantList.all.first!)
    }
}
