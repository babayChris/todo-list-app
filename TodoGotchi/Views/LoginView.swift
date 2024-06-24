//
//  LoginView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI


struct LoginView: View{
    var body: some View{
        @State var email = "" // mutable variable set to string
        @State var password = ""
        
        NavigationView {
            VStack {
                //Header
                HeaderView()
                //Login Form
                Form{
                    TextField("Email Addresss", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(){
                        //attempt login
                        
                    } label: {
                        ZStack { RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            Text("Log In")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    
                }
                //Create account
                VStack {
                    Text("New around here?")
                    Button("Create an account."){
                        //show registration page
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            
        }
    }
}

struct LoginView_Preview: PreviewProvider{
    static var previews: some View{
        LoginView()
    }
    
}

struct HeaderView:View{
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.pink)
                .rotationEffect(Angle(degrees: 15))
            
            VStack{
                Text("ToDo - List")
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text("Get things done")
                    .font(.system(size:30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
        
    }
}
