//
//  LoginView.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/24.
//

import SwiftUI
//.frame(maxWidth: .infinity, alignment: .leading)
struct LoginView: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        VStack(alignment: .center){
            Text ( "Welcome")
                .font(.system(size: 55).bold())
                .foregroundColor(Color(titleColor1))
                //.frame(maxWidth: .infinity, alignment: .leading)
                .frame (height: getRec().height / 3.5)
                .padding()
                .background(
                    ZStack{
                        Circle()
                            .strokeBorder(Color(titleColor1).opacity(0.3), lineWidth: 3)
                            .frame (width: 30, height: 30)
                            .blur(radius: 2)
                            .frame (maxWidth: .infinity,maxHeight: .infinity,alignment:.bottomTrailing)
                            .padding(30)
                        Circle()
                            .strokeBorder(Color(titleColor1).opacity(0.3), lineWidth: 3)
                            .frame (width: 23, height: 23)
                            .blur(radius: 2)
                            .frame (maxWidth: .infinity,maxHeight: .infinity, alignment:
                                            .topLeading)
                            .padding (.leading, 30)
                    }
                    
                )
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15){
                    Rectangle()
                        .frame(width: getRec().width / 10,height: 5)
                        .cornerRadius(10)
                        .foregroundColor(.secondary)
                    
                    Text("Login")
                        .font(.system(size : 18).bold())
                        //.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom,10)
                    
                    CustomTextField(icon: "envelope", title: "School Number", hint: "C110152319",
                                    value: $loginData.email, showPassword: .constant(false))
                        .padding(.top,30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "123456",
                                    value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top,10)
                    
                    if loginData.registerUser{
                        CustomTextField(icon: "envelope", title: "Re Enter Password", hint: "123456",
                                        value: $loginData.reEnterPassword, showPassword: $loginData.showPassword)
                            .padding(.top,10)
                    }
                    
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners:[.topLeft,.topRight],radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(color))
    }
    
    @ViewBuilder
    func CustomTextField(icon: String,title: String, hint: String, value: Binding<String>,showPassword: Binding<Bool>) -> some View{
        VStack(alignment: .leading, spacing: 12){
            Label{
                Text(title)
                    .font(.system(size: 14).bold())
                    .opacity(0.8)
            } icon: {
                Image(systemName: icon)
                    .opacity(0.8)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password"){
                SecureField(hint, text: value)
                    .padding(.top,2)
            }else{
                TextField(hint, text: value)
                    .padding(.top,2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        .overlay(
            Group{
                if title.contains("Password"){
                    Button(action:{
                        
                    },label: {
                        Image(systemName: "eye")
                            .foregroundColor(Color(titleColor2))
                    })
                        .offset(y:8)
                }
            }, alignment: .trailing
        
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
