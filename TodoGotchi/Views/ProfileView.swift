//
//  ProfileView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI



struct ProfileView: View{
    @StateObject var viewModel = ProfileViewModel()
    init () {
        
    }
    var body: some View{
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Profile")
        }
    }
    
}



struct ProfileView_Preview: PreviewProvider{
    static var previews: some View {
        ProfileView()
    }
}



