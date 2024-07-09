//
//  TLButton.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/23/24.
//

import SwiftUI

struct TLButton: View{
    
    let title: String
    let backround: Color
    let action: () -> Void // let action function return nothing
    
    var body: some View{
        Button(){
            //Action
            
            
        } label: {
            ZStack { RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backround)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    
    }
    
    
    
    struct TLButton_Preview: PreviewProvider {
        static var previews: some View {
            TLButton(title: "value", backround: .pink){
                //action
            }
        }
    }
    
}
