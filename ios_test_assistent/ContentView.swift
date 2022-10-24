//
//  ContentView.swift
//  ios_test_assistent
//
//  Created by Mattias Spångberg on 2022-10-19.
//

import SwiftUI

/*struct TodoItem{
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
}*/

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

struct ContentView: View {
    var menuName: String = "Menu"
    @AppStorage("todoArray") var todoArray: [String] = []
    @State var todoText: String = ""
    @AppStorage("checkedArray") var checkedArray: [Bool] = []
    
    var body: some View {
        VStack {
            List(){
                ForEach(0..<todoArray.count, id: \.self ){ i in
                    HStack{
                        Text(String(todoArray[i]))
                        Spacer()
                        if(checkedArray[i]){
                            Button{
                                checkedArray[i].toggle()
                            }label: {
                                Image(systemName: "checkmark.circle")
                            }
                            .buttonStyle(PlainButtonStyle())
                        }else{
                            Button{
                                checkedArray[i].toggle()
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
                    //var todoitem = TodoItem(name: todoText, checked: false)
                    todoArray.append(todoText)
                    checkedArray.append(false)
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
