//
//  ProfileViewModel.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject{
    init() {
    }
    
    @Published var user: User? = nil
    //var user will be nil if DNE
    

    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        
        //get document
        db.collection("users").document(userId).getDocument {
            [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else { //let data equal the returned document from firestore and if error DNE then pass
                return
            }
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",// '??' means otherwise, so if no id 'id:' will be blank
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
                
            }
            
        }
    }
    
    func logOut() {
        
        do{
            try Auth.auth().signOut()
            
        }catch{
                print(error)
            }
        
    }
}

