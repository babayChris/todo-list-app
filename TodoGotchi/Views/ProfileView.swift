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
            VStack  {
                if let user = viewModel.user {
                    profile(user: user, viewModel: viewModel)
                } else {
                    Text("Loading user...")
                }
            }
        }.onAppear {
            viewModel.fetchUser()
        }
    }
}
    @ViewBuilder
func profile(user: User, viewModel: ProfileViewModel) -> some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)//resizes so content is in all of the avalible space
                .foregroundColor(Color.blue)
                .frame(width: 125, height: 125)
                .padding()
            
        }
        VStack (alignment: .leading) {
            HStack{
                Text("Name: ")
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Date Joined: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
            
        }
    ZStack {
        HStack {
            Button ("Log Out") {
                viewModel.logOut()
            }.padding()
                .foregroundColor(Color.red)
            
        }
        
    }
    }
            
            
            struct ProfileView_Preview: PreviewProvider{
                static var previews: some View {
                    ProfileView()
                }
            }
            
            
