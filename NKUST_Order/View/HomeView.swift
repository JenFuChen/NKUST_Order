//
//  Order.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/17.
//

import SwiftUI

struct HomeView: View {
    
    let columnLayout = Array(repeating: GridItem(), count: 1)
    
    var merchants:[Merchant] = MerchantList.all
    var category = ["Category","Testing","Nothing"]
    var cateColor = [200,150,200]
    
    @State var selectItemIndex = 0
    @State var showSheet: Bool  = false
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical,showsIndicators: false){
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing:15){
                            ForEach(0..<3){num in
                                Button(action: {
                                    selectItemIndex = num
                                }, label: {
                                    ZStack{
                                        Text(category[num])
                                            .padding(8)
                                            .foregroundColor(.white)
                                            .background(Color(titleColor1))
                                            .cornerRadius(5)
                                            .font(.headline)
                                    }
                                })
                            }
                        }
                        .padding(.horizontal,20)
                        .padding(.vertical,5)
                    }
                    
                    Spacer()
                    
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: columnLayout){
                            ForEach(merchants, id: \.id){merchant in
                                NavigationLink(
                                    destination: MerchantView(merchant:merchant),label:{
                                            ShopCell(merchant: merchant)
                                            .padding(.bottom,10)
                                        }
                                    )
                            }
                        }
                    }
                    // .statusBar(hidden: true)//移除頂部標題上方空白處
                    // .navigationBarTitleDisplayMode(.inline)
                    // .font(.largeTitle.bold())
                    .navigationTitle(category[selectItemIndex])
                    .navigationBarBackButtonHidden(false)
                    
                    .toolbar{
                        ToolbarItemGroup(placement: .navigationBarLeading){
                            
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
                    .accentColor(.black)
                }
            }
        }
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
                .padding(.horizontal,20)
            
            HStack(alignment: .center){
                LazyVGrid(columns: columnTitle){
                    Text(merchant.type)
                        .font(.body.bold())
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                    
                    Text(merchant.name)
                        .font(.title2)
                    
                    Text(merchant.star)
                        .font(.body)
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                }
            }
            //.padding(.horizontal,10)
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 12")
        HomeView()
            .previewDevice("iPhone 8")
    }
}


// Half Sheet
extension View{
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder
                                    sheetView: @escaping ()->SheetView) ->some View{
        
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
