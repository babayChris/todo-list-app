//
//  NewItemViewModel.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 7/2/24.
//

import Foundation

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    
    init() {}
    
    
    func save() {
        
    }
    //error handling
    
    var canSave: Bool{//checks if can save returns true if yes and false if no
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{//if title is not empty
            //case if guard is false (is empty)
            return false
        }
        //case if guard is true (not empty)
        return true
    }

}
