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
                .frame (height: getRec().height / 6)
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
                VStack(spacing: 15){/*
                    Rectangle()
                        .frame(width: getRec().width / 10,height: 5)
                        .cornerRadius(10)
                        .foregroundColor(.secondary)*/
                    
                    // Top Title
                    Text(loginData.registerUser ? "Register" : "Login")
                        .font(.system(size : 18).bold())
                        //.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom,10)
                    
                    // Email
                    CustomTextField(icon: "envelope", title: "School Number", hint: "C110152319",
                                    value: $loginData.email, showPassword: .constant(false))
                        .padding(.top,30)
                    // Password
                    CustomTextField(icon: "lock", title: "Password", hint: "123456",
                                    value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top,10)
                    
                    //RE-Enter Password
                    if loginData.registerUser{
                        CustomTextField(icon: "lock", title: "Re-Enter Password", hint: "123456",
                                        value: $loginData.reEnterPassword, showPassword: $loginData.showPassword)
                            .padding(.top,10)
                    }
                    
                    // Forgot Password
                    Button{
                        loginData.ForgetPassword()
                    } label:{
                        Text("Forgot Prassword?")
                            .font(.system(size:14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(titleColor1))
                    }
                    .padding(.top,8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    //Login
                    Button{
                        if loginData.registerUser{
                            loginData.Register()
                        }else{
                            loginData.Login()
                        }
                    } label:{
                        Text("Login")
                            .font(.system(size:20))
                            .fontWeight(.semibold)
                            .padding(.vertical,20)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color(titleColor1))
                            .cornerRadius(10)
                    }
                    .padding(.top,8)
                    
                    //Register User
                    Button{
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                    } label:{
                        Text(loginData.registerUser ? "Back to Login":"Create account" )
                            .font(.system(size:14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(titleColor1))
                            
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
        .background(Color(BGcolor))
        
        // Clean the data when change value
        .onChange(of: loginData.registerUser){ newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.reEnterPassword = ""
            loginData.showPassword  = false
            loginData.showReEnterPassword = false
        }
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
            
            if title.contains("Password") && !showPassword.wrappedValue{
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
                        showPassword.wrappedValue.toggle()
                    },label: {
                        Image(systemName: showPassword.wrappedValue ? "eye" : "eye.slash")
                            .foregroundColor(Color(buttonColor))
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
