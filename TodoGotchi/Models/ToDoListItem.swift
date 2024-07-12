//
//  ToDoListItem.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{ //Identifiable - think of it as a labeled data box that contains data / Codable - lets you add and change data in the data box
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool ) { //underscore means to ignore meaning the state can be empty and the code will still run
        isDone = state // when setDone() is called a bool can be passed into it to set var isDone
        
    }
}



