//
//  ContentView.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/17.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentTab :Tab = .Home
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 10){
            TabView(selection: $currentTab){
                
                BoardingPageView()
                    .tag(Tab.Home)
                
                HomeView()
                    .tag(Tab.Liked)
                
                Text("List View ...")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .tag(Tab.Cart)
                
                Text("Profile View...")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .tag(Tab.Profile)
            }
            
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.self){tab in
                    Button{
                        currentTab = tab
                    }label:{
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ?
                                             Color(buttonColor):
                                                Color.black.opacity(0.3)
                            )
                    }
                }
            }
            .padding([.horizontal,.top])
            .padding(.bottom, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.preferredColorScheme($0)
            .previewDevice("iPhone 12")
        /*ContentView()//.preferredColorScheme($0)
            .previewDevice("iPhone 8")*/
    }
}


//Tab cases
enum Tab: String, CaseIterable{
    // Raw Value
    case Home = "house.fill"
    case Liked = "heart.fill"
    case Cart = "cart.fill"
    case Profile = "person.fill"
}
