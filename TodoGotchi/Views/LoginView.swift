//
//  LoginView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI


struct LoginView: View{

    @StateObject var viewModel = LoginViewModel()
    var offset: Double
    
    var body: some View{
        
        
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "ToDo List" , subtitle: "Get things done", color: .pink, degree: 15,
                offset: offset)
                //Login Form
                
                Form{
                    
                    if !viewModel.errorMessage.isEmpty {// if the viewModel error message variable is empty then we don't display a message
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Addresss", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(TextInputAutocapitalization.never)
                    
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
        LoginView(offset: -100)
    }
    
}


