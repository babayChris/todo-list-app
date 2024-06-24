//
//  HomePage.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI

struct MainView: View{
    var body: some View{
        //NavigationView { //use navigation view so we can move views
            LoginView() 
        }
    }
    



struct MainView_Preview: PreviewProvider {
    static var previews: some View{
        MainView()
    }
}
