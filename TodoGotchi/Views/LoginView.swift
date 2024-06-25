//
//  LoginView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI


struct LoginView: View{

    @StateObject var viewModel = LoginViewModel()
    
    var body: some View{
        
        
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "ToDo List" , subtitle: "Get things done", color: .pink, degree: 15,
                offset: -100)
                //Login Form
                Form{
                    TextField("Email Addresss", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TLButton(title: "Login", backround: .blue){
                        viewModel.login()
                    }
                    .padding()
                }
                //Create account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account.", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
            
            }
            
        }
        
    }
}

struct LoginView_Preview: PreviewProvider{
    static var previews: some View{
        LoginView()
    }
    
}


