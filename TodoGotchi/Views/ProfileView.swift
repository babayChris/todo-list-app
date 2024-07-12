//
//  ProfileView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI


struct ProfileView: View{
    @StateObject var viewModel = ProfileViewModel()

    var body: some View{
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    HStack{
                        Image(systemName: "person.crop.circle.fill")
                    }
                    HStack{
                        Text("Name: ")
                        Text(user.name)
                    }
                    HStack {
                        Text("Email: ")
                        Text(user.email)
                    }
                    HStack {
                        Text("ID: ")
                        Text(user.id)
                    }
                    HStack {
                        Text("Date Joined: ")
                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    }
                }
                else{
                    Text("Loading user...")
                }
                
                
            }
        }.onAppear {
            viewModel.fetchUser()
        }
        
    }
    
    
    
    struct ProfileView_Preview: PreviewProvider{
        static var previews: some View {
            ProfileView()
        }
    }
    
    
    
}
