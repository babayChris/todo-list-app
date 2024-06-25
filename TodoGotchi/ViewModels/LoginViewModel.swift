//
//  LoginViewModel.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init() {}
    
    func login(){
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
            
        }
        
    }
    
    func validate(){
        
    }
}
