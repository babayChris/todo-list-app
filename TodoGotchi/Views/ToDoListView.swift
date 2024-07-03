//
//  ToDoListItemView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import SwiftUI

struct ToDoListView: View{
    
    @StateObject var viewModel = ToDoListViewModel()
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    var body: some View{
        NavigationView{
            VStack{
                
            }
            .navigationTitle("ToDoList")
            .toolbar{
                Button(action: {
                    //action
                    viewModel.showingNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
    
}


struct ToDoListView_Preview: PreviewProvider{
    static var previews: some View{
        ToDoListView(userID: "")
    }
}


