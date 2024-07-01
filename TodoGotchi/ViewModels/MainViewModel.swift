//
//  MainViewModel.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in // the dash
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }

    
    public var isSignedIn: Bool{
        
        return Auth.auth().currentUser != nil
        
    }
}
