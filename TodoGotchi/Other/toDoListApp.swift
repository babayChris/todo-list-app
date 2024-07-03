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
    
    init() {
        print("initializing firebase")
        FirebaseApp.configure()
        print("firebase configured")
    }
    
    var body: some Scene {
        WindowGroup{
            MainView(viewModel: MainViewModel())
        }
    }
}


