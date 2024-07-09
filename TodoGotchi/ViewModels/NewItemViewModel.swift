//
//
//  NewItemViewModel.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 7/2/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    
    func save() {
        
        guard canSave else{
            return
        }
        //get user ID
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        } //let uId = user ID if UID doesn't exist the program doesn't explode
        
        // create model
        let newID = UUID().uuidString
        let newItem = ToDoListItem(//*
            id: newID,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // save model
        let db = Firestore.firestore()
        db.collection("users") //in "users" collection -> uId document -> todos collection -> ... document <- input data [user input todo data]
            .document(uId)
            .collection("todos")
            .document(newID) //placeholder
            .setData(newItem.asDictionary())//*
        
        
        
        
    }
    //error handling
    
    var canSave: Bool{//checks if can save returns true if yes and false if no
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{//if title is not empty
            //case if guard is false (is empty)
            return false
        }
        //case if guard is true (not empty)
        guard dueDate >= Date().addingTimeInterval(-86400) else{//num is num seconds in a day, since num is negative, it means the due date must be greater than or equal to yesterday
            return false
        }
        return true
        
    }
    

}
