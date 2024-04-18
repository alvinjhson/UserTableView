//
//  UserViewModel.swift
//  UserTableView
//
//  Created by Alvin Johansson on 2024-04-17.
//

import Foundation
import UIKit

class UserViewModel : ObservableObject {
 @Published var userEntries = [UserInformation]()
    
    init(){
        addMockData()
        
    }
    
    func addMockData() {
        let defaultImage = UIImage(named: "defaultImage")! // Ersätt "standardBild" med namnet på din bild i assets
        userEntries.append(UserInformation(name: "Alvin Johnsson", email: "Alvin@gmail.com", image: defaultImage))
        userEntries.append(UserInformation(name: "Eric Jöran", email: "Jöran@gmail.com", image: defaultImage))
        userEntries.append(UserInformation(name: "Sven Sten", email: "StenSven@gmail.com", image: defaultImage))
    }

    func update(entry : UserInformation, with name: String,with email: String,with image: UIImage) {
        if let index = userEntries.firstIndex(of: entry){
            userEntries[index].name = name
            userEntries[index].email = email
            userEntries[index].image = image
        }
        
    }
    
}
