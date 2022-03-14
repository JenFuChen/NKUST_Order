//
//  Order.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/17.
//

import SwiftUI

struct HomeView: View {
    
    let columnLayout = Array(repeating: GridItem(), count: 1)
    
    //var merchants:[Merchant] = Merchant.all
    var category = ["Category","Testing","Nothing"]
    var cateColor = [200,150,200]
    
    @State var selectItemIndex = 0
    @State var showSheet: Bool  = false
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    @Namespace var animatiopn
    var body: some View {
        NavigationView{
                //entire home view to scroll
            ScrollView(.vertical ,showsIndicators: false){
                    // Search Bar
                    VStack{
                        HStack(spacing: 15){
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.gray)
                            
                            TextField("Search",text: .constant(""))
                                .disabled(true)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .strokeBorder(Color.gray,lineWidth: 0.8)
                        )
                    }.padding()
                    
                    // select type button
                    ScrollView(.horizontal,showsIndicators: false){
                        
                        HStack(spacing: 18){
                            ForEach(FoodType.allCases, id: \.self){ type in
                                FoodTypeView(type: type)
                            }
                        }
                        .padding(.horizontal,25)
                        
                        
//                        HStack(spacing:15){
//                            // category, id: \.self
//                            ForEach(0..<3){num in
//                                Button(action: {
//                                    selectItemIndex = num
//                                }, label: {
//                                    ZStack{
//                                        Text(category[num])
//                                            .padding(8)
//                                            .foregroundColor(.white)
//                                            .background(Color(buttonColor))
//                                            .cornerRadius(5)
//                                            .font(.headline)
//                                    }
//                                })
//                            }
//                        }
//                        .padding(.horizontal,20)
//                        .padding(.vertical,5)
                    }
                    
                   
                    // Shop cell Scroll View
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing : 18){
                            ForEach(homeData.merchants, id: \.id){merchant in
                                NavigationLink(
                                    destination: MerchantView(),label:{
                                            ShopCell(merchant: merchant)
                                                .padding(.bottom,5)
                                        }
                                    )
                            }
                        }
                    }
                    
                    // .statusBar(hidden: true)//移除頂部標題上方空白處
                    // .navigationBarTitleDisplayMode(.inline)
                    
                    .navigationTitle(category[selectItemIndex])
                    .navigationBarBackButtonHidden(true)
                    
                    .toolbar{
                        ToolbarItemGroup(placement: .navigationBarTrailing){
                            
                            Button{
                            action:do {
                                showSheet.toggle()
                            }
                            }label:{
                                Image(systemName: "slider.horizontal.3")
                            }.halfSheet(showSheet: $showSheet){
                                ZStack{
                                    Color(color2)
                                    SheetContent()
                                }
                                .ignoresSafeArea()
                            }
                        }
                    }
                    
                }
            }
            .accentColor(Color(buttonColor))
            //.background(Color(color))
        
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            //.previewDevice("iPhone 13 Pro Max")
    }
}

struct ShopCell: View{
    
    let columnTitle = Array(repeating: GridItem(), count:3)
    
    var merchant: Merchant
    var body: some View{
        VStack(alignment: .center){
            Image(merchant.imageName)
                .resizable()
                .scaledToFit()
                //.clipShape(CustomCorners(corners:[.topLeft,.topRight],radius: 8))
                .cornerRadius(8)
                .frame(maxWidth: .infinity)
                //.padding(.horizontal,10)
            
            HStack(){
                LazyVGrid(columns: columnTitle){
                    
                    Text(merchant.name)
                        .font(.title2)
                    
                    Text(merchant.type)
                        .font(.body.bold())
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                    
                    
                    Text(merchant.star)
                        .font(.body)
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                }
            }
            //.padding(.horizontal,10)
        }
        .padding(.horizontal,20)
        .padding(.vertical,5)
    }
}

// Half Sheet
extension View{
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()->SheetView) ->some View{
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet )
            )
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable{
    var sheetView: SheetView
    
    let controller = UIViewController()
    
    @Binding var showSheet: Bool
    
    func makeUIViewController(context: Context) -> UIViewController{
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context:
                                Context){
        if showSheet{
            let sheetController =  CustomHostingController(rootView: sheetView)
            
            uiViewController.present(sheetController, animated:true){
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}

class CustomHostingController<Content: View> : UIHostingController<Content>{
    override func viewDidLoad(){
        if let presentationController = presentationController as?
            UISheetPresentationController{
            presentationController.detents = [
                .medium(),
                .large()
            ]
            presentationController.prefersGrabberVisible = true
        }
    }
}

struct SheetContent: View{
    //                  0         1         2              3        4
    let typeList = ["Baverage","Food","Midnight Food","Noodles","Others"]
    
    @State var chosenType = 5
    @State var chosen:Bool = false
    
    var body: some View{
        VStack{
            
            Text("Setting")
                .font(.title.bold())
                .foregroundColor(.white)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<5){num in
                        Button(action: {
                            chosenType = num
                        }, label: {
                            ZStack{
                                Text(typeList[num])
                                    .padding(.vertical,5)
                                    .padding(.horizontal,10)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .background(chosenType == num ? Color(titleColor1) : Color(titleColor2))
                                    .cornerRadius(5)
                                    
                            }
                        })
                    }
                }
                .padding(.vertical,10)
                .padding(.horizontal,10)
            }
            Spacer()
        }.padding(.top,20)
    }
}
