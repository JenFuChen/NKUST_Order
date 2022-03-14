//
//  MerchantView.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/21.
//

import SwiftUI

struct MerchantView: View {
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    @Namespace var animatiopn
    //var merchant: Merchant
    var body: some View {
        VStack{
            HStack(){
                Text("Hello")
                    .font(.system(size: 30).bold())
                    .frame(maxWidth: .infinity)
                    
            }
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 18){
                    ForEach(FoodType.allCases, id: \.self){ type in
                        FoodTypeView(type: type)
                    }
                }
                .padding(.horizontal,25)
            }
            .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false){
                ForEach(0..<6){num in
                    Button{
                        
                    }label:{
                        ItemCell()
                    }
                    
                }
            }
        }.ignoresSafeArea()
    }
    
    @ViewBuilder
    func FoodTypeView(type: FoodType) -> some View{
            
            Button{
                withAnimation{
                    homeData.foodType = type
                }
            } label:{
                Text(type.rawValue)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(homeData.foodType == type ? Color(titleColor1) : Color.gray)
                    .padding(.vertical, 5)
                    .overlay(
                        ZStack{
                            if homeData.foodType == type{
                                Capsule()
                                    .fill(Color(titleColor1))
                                    .matchedGeometryEffect(id: "PRODUCTTAB", in: animatiopn)
                                    .frame(height:2)
                            }else{
                                Capsule()
                                    .fill(Color.clear)
                                    .frame(height:2)
                            }
                        }//.padding(.vertical)
                        ,alignment: .bottom
                    )
            }
    }
}


struct MerchantView_Previews: PreviewProvider {
    static var previews: some View {
        MerchantView()
        //merchant: MerchantList.all.first!
    }
}

struct ItemCell: View{
    var body: some View{
        
        HStack(alignment: .center){
            Image("DefaultImg")
                .resizable()
                .scaledToFit()
                .frame(height:70)
                .cornerRadius(6)
                .padding(.vertical,4)
            
            VStack(alignment: .leading, spacing: 5){
                Text("Testing")
                    .fontWeight(.semibold)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .minimumScaleFactor(0.5)
                    
                
                Text("Testing")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }.padding(.horizontal,20)
        
    }
}

