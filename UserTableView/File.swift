//
//  File.swift
//  UserTableView
//
//  Created by Alvin Johansson on 2024-04-17.
//

import Foundation
import UIKit

struct UserInformation : Identifiable, Equatable {
    var id = UUID()
    
    var name: String
    var email: String
    var image : UIImage
    
    init( name: String, email: String, image : UIImage ) {
        self.name = name
        self.email = email
        self.image = image
    }
    
    
    
    
}
