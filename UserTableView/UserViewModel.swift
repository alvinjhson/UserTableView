//
//  UserViewModel.swift
//  UserTableView
//
//  Created by Alvin Johansson on 2024-04-17.
//

import Foundation

class UserViewModel : ObservableObject {
 @Published var userEntries = [UserInformation]()
    
    init(){
        addMockData()
        
    }
    
    func addMockData() {
        userEntries.append(UserInformation(name: "Alvin Johnsson", email:  "Alda@gmail.com"))
        userEntries.append(UserInformation(name: "Eric Jöran", email:  "Jöran@gmail.com"))
        userEntries.append(UserInformation(name: "Sven Sten", email:  "StenSven@gmail.com"))
   
    }
    func update(entry : UserInformation, with name: String,with email: String) {
        if let index = userEntries.firstIndex(of: entry){
            userEntries[index].name = name
            userEntries[index].email = email
        }
        
    }
    
}
