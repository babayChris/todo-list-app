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
                    viewModel.save()
                    newItemPresented = false
                }
                .padding(.bottom)
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
