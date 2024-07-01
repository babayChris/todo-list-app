//
//  RegisterViewModel.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import FirebaseCoreExtension
import FirebaseFirestore
import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register(){
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result, error in // closure, if there is an error, "error" will contain it
            // if there is a result aka user created, "result" will contain it
            guard let userID = result?.user.uid else{ // result? is optional used when result may = .nil
                return
            }
            self?.insertUserRecord(id: userID)
            
        }
        
    }
    
    
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: name,
                           email: email,
                           password: password,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    
    private func validate() -> Bool{
        //check if empty
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill out all fields"
            return false
        }
        //check valid email
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        // check password length
        guard password.count >= 6 else{
            return false
        }
        //note: argument in guard is what you want
        //1. if not empty the vars pass, 2. if they contain @, , they pass, 3.
        
        
        return true
    }
    
    
}
