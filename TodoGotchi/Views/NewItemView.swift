//
//  NewItemView.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 7/2/24.
//

import SwiftUI

struct NewItemView: View{
    
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View{
        VStack{
            Text("Create New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top, 50)
            Form {
                //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // submit button
                TLButton(title: "Save", backround: .pink){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    } else{
                        viewModel.showAlert = true
                    }
                        
                        
                }
                .padding(.bottom)
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),
                      message:Text("Please input a date that is today or newer."))
            }
        }
    }
}


struct NewItemView_Preview: PreviewProvider {
    static var previews: some View{
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: {_ in
        }))
    }
}
