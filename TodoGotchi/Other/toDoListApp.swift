//
//  TodoGotchiApp.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI
import FirebaseCore

@main

struct toDoListApp: App {
    init()  {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup{
            MainView()
        }
    }
}


