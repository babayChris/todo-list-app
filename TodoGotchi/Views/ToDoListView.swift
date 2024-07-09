//
//  ToDoListItemView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/22/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View{
    
    @StateObject var viewModel = ToDoListViewModel()
    @FirestoreQuery var items: [ToDoListItem] //items of type [ToDoListItem]
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
    }
    var body: some View{
        NavigationView{
            VStack{
                List(items) {
                    items in //saying to display "item in" a text format
                    ToDoListItemView(item: items)
                        .swipeActions{
                            Button{
                                //delete

                            } label: {
                                Text("Delete")
                                    
                            }.tint(Color.red)
                        }
                }.listStyle(PlainListStyle())
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
        ToDoListView(userID: "Ju52ZGT6O1T9hU4NTVVL0QsFuny1")
    }
}


