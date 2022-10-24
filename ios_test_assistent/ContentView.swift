//
//  ContentView.swift
//  ios_test_assistent
//
//  Created by Mattias Spångberg on 2022-10-19.
//

import SwiftUI

struct TodoItem{
    var name: String
    var checked: Bool
    
    init(name: String, checked: Bool) {
        self.name = name
        self.checked = checked
    }
    
    func getName() -> String{
        return self.name
    }
    
    func getChecked() -> Bool {
        return self.checked
    }
    
    mutating func toggleChecked(){
        self.checked.toggle()
    }
}

struct ContentView: View {
    var menuName: String = "Menu"
    @State  var todoArray: [TodoItem] = []
    @State var todoText: String = ""
    
    var body: some View {
        VStack {
            List(){
                ForEach(0..<todoArray.count, id: \.self){ i in
                    HStack{
                        Text(String(todoArray[i].getName()))
                        Spacer()
                        if(todoArray[i].checked){
                            Button{
                                todoArray[i].toggleChecked()
                            }label: {
                                Image(systemName: "checkmark.circle")
                            }
                            .buttonStyle(PlainButtonStyle())
                        }else{
                            Button{
                                todoArray[i].toggleChecked()
                            }label: {
                                Image(systemName: "circle")
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .foregroundColor(Color.pink)
            .foregroundColor(Color.pink)
            Spacer()
            TextField("Enter Todo item: ", text: $todoText)
                .onSubmit {
                    var todoitem = TodoItem(name: todoText, checked: false)
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
