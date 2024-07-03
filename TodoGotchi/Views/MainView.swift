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
            //use navigation view so we can move views
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {//checks for signin
            accountView
            } else {
                LoginView(offset: -110)
                //not signed in
            }
    }
    
@ViewBuilder
    var accountView: some View{
        TabView{//creates tabs on the bottom of the screen
            
            ToDoListView(userID: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("profile", systemImage: "person.circle")
                }
            
        }
    }
    
    
    
    struct MainView_Preview: PreviewProvider {
        static var previews: some View{
            MainView()
        }
    }
}
