//
//  ContentView.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            LoginView()
                .tabItem{
                    Image(systemName: "house.fill")
                }
            BoardingPageView()
                .tabItem{
                    Image(systemName: "house.fill")
                }
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                }
            Text("List View ...")
                .font(.title)
                .foregroundColor(.secondary)
                .tabItem{
                    Image(systemName: "bag.fill")
                }
            Text("Profile View...")
                .font(.title)
                .foregroundColor(.secondary)
                .tabItem{
                    Image(systemName: "person.fill")
                }
        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.preferredColorScheme($0)
            .previewDevice("iPhone 12")
        ContentView()//.preferredColorScheme($0)
            .previewDevice("iPhone 8")
    }
}
