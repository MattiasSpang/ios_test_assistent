//
//  ContentView.swift
//  ios_test_assistent
//
//  Created by Mattias Spångberg on 2022-10-19.
//

import SwiftUI

class TodoItem: Identifiable{
    
    @State var name: String
    @State var checked: Bool
    
    init(name: String, checked: Bool) {
        self.name = name
        self.checked = checked
    }
    
    func getName() -> String{
        return self.name
    }
    
    func getChecked() -> Bool{
        return self.checked
    }
    
    func toggleChecked(){
        self.checked.toggle()
    }
    
}

struct ContentView: View {
    var menuName: String = "Menu"
    @State var todoArray: [TodoItem] = []
    @State var iconTapped: Bool = false
    @State var todoText: String = ""
    
    var body: some View {
        VStack {
            List(){
                ForEach(todoArray){ item in
                    HStack{
                        Text(item.name)
                        Spacer()
                        if(iconTapped){
                            Image(systemName: "checkmark.circle")
                        }else{
                            Image(systemName: "circle")
                        }
                    }
                }
            }
            .foregroundColor(Color.pink)
            .onTapGesture {
                iconTapped.toggle()
            }
            .foregroundColor(Color.pink)
            Spacer()
            TextField("Enter Todo item: ", text: $todoText)
                .onSubmit {
                    let todoitem = TodoItem(name: todoText, checked: false)
                    todoArray.append(todoitem)
                    todoText = ""
                }
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
