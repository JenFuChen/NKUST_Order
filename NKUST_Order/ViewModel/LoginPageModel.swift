//
//  LoginPage.swift
//  NKUST_Order
//
//  Created by 陳人輔 on 2022/2/24.
//

import SwiftUI


class LoginPageModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    @Published var registerUser: Bool = false
    @Published var reEnterPassword: String = ""
    @Published var showReEnterPassword: Bool = false
    
    func Login(){
        
    }
    
    func Register(){
        
    }
    
    func ForgetPassword(){
        
    }
    
}

