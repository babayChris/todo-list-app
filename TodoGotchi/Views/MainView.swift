//
//  HomePage.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI

struct MainView: View{
    @StateObject var viewModel = MainViewModel()
    
    var body: some View{
        NavigationView{
            //use navigation view so we can move views
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{//checks for signin
                ToDoListView()
            } else {
                LoginView()
                //not signed in
            }
        }
    }
    
    
    
    
    struct MainView_Preview: PreviewProvider {
        static var previews: some View{
            MainView()
        }
    }
}
