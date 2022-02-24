//
//  BoardingPageView.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/24.
//

import SwiftUI

let color = UIColor(displayP3Red: 230/255.0, green: 233/255.0, blue: 245/255.0,alpha: 1)
let titleColor1 = UIColor(displayP3Red: 79/255.0, green: 84/255.0, blue:209/255.0, alpha: 1)
let titleColor2 = UIColor(displayP3Red: 60/255.0, green: 67/255.0, blue:150/255.0, alpha: 1)

struct BoardingPageView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("NKUST")
                .font(.system(size:55))
                .font(.largeTitle.bold())
                .foregroundColor(Color(titleColor1))
                .fontWeight(.bold)
            
            Text("Order App")
                .font(.title.bold())
                .foregroundColor(Color(titleColor2))
                .fontWeight(.bold)
                //.padding(.top,5)
            
            Spacer()
            Button{
                
            }label :{
                Text("Start to Order!")
                    .font(.title3.bold())
                    .foregroundColor(Color(titleColor1))
                    .padding(.vertical,18)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: Color(titleColor1).opacity(0.1), radius: 5, x: 5, y: 5)
                    
            }.padding()
            
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(color))
        
    }
}

struct BoardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        BoardingPageView()
            .previewDevice("iPhone 12")
        BoardingPageView()
            .previewDevice("iPhone 8")
    }
}

extension View{
    func getRec()->CGRect{
        return UIScreen.main.bounds
    }
}
