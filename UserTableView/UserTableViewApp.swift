//
//  UserTableViewApp.swift
//  UserTableView
//
//  Created by Alvin Johansson on 2024-04-17.
//

import SwiftUI

@main
struct UserTableViewApp: App{
@StateObject var user = UserViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(user)
        }
    }
}
