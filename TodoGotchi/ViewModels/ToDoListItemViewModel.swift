//
//  ToDoListItemViewModel.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListItemViewModel: ObservableObject{
    
    
    
    init () {}
    
    func toggleCheck(item: ToDoListItem) {
        //make copy of item
        var newItem = item
        
        //flips is done bool
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        // makes uid the user ID of the current user logged in to access their stuff, if user DNE then case doesn't pass guard
        let db = Firestore.firestore()
        //set item's new state newItem
        //sets replace original Item data with newItem data mimicing flipping the bool to activate button
        db.collection("users").document(uid).collection("todos").document(newItem.id).setData(newItem.asDictionary())
        
    }
    
    
}
