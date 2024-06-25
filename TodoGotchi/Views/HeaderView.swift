//
//  HeaderVIew.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/24/24.
//

import SwiftUI

struct HeaderView: View{
    
    var title: String
    var subtitle: String
    var color: Color
    var degree: Double
    var offset: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: degree))
            
            VStack{
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size:30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: offset)
        
    }
}
