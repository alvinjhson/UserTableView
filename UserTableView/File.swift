//
//  File.swift
//  UserTableView
//
//  Created by Alvin Johansson on 2024-04-17.
//

import Foundation

struct UserInformation : Identifiable, Equatable {
    var id = UUID()
    
    var name: String
    var email: String
    
    init( name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    
    
    
}
