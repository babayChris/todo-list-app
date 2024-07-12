//
//  NewItemViewModel.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let userID: String //create user ID variable
    
    init(userID: String) {//declare initialzer and feed userID in as a string
        self.userID = userID //set userID in this class as userID fed into class
    }//end result now we can use userID as a mutable variable from outside of the class
    
    func delete(id:String) {
        let db = Firestore.firestore()
        

        db.collection("users").document(userID).collection("todos").document(id).delete()
    }
}
    
