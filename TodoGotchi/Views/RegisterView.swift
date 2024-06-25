//
//  RegisterView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    var body: some View {
        
        
        NavigationView{
            VStack{
                
                HeaderView(title: "Register",subtitle: "Welcome to the Club", color: .orange, degree: -15, offset: -132)
                
                Form{
                    TextField("Full Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TextField ("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TLButton(title: "Create Account", backround: .green){
                        //register
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
