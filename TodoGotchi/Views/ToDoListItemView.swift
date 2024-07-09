//
//  ToDoListItemView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI

struct ToDoListItemView: View{
    var item: ToDoListItem
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                HStack{
                Text(item.title)
                    .font(.title)
                    
                    //scrape item.title to check for emoji
            }
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.subheadline)

                
            }
            Spacer()
            Button {
               //toggle done
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle" )// if item.isDone returns true then ":" is the else
            }
        }
    }
    
}



struct ToDoListItemView_Preview: PreviewProvider {
    static var previews: some View{
        ToDoListItemView(item: .init(id: "123", title: "get eggs", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
    }
}
