//
//  RegisterView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI

struct RegisterView: View {
@StateObject var viewModel = RegisterViewModel()
    var body: some View {
        
        
        NavigationView{
            VStack{
                
                HeaderView(title: "Register",subtitle: "Welcome to the Club", color: .orange, degree: -15, offset: -132)
                
                Form{
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TextField ("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TLButton(title: "Create Account", backround: .green){
                        viewModel.register()
                    }
                    .padding()
                    
                }
                .offset(y: -50)
            }
        }
    }
}

struct RegisterView_Preview: PreviewProvider{
    static var previews: some View{
        RegisterView()
    }
}
