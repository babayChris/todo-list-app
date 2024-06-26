//
//  LoginViewModel.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init() {}
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill out all fields"
            return false //return is used to exit guard
            
        }
        
        guard email.contains("@") && email.contains(".") else
        {
            errorMessage = "Please enter valid email"
            return false
        }
        return true
    }
}
