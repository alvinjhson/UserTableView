//
//  UserEntryView.swift
//  UserTableView
//
//  Created by Alvin Johansson on 2024-04-17.
//

import Foundation
import SwiftUI

struct UserEntryView: View {
    
    var userEntry : UserInformation?
    @EnvironmentObject var user : UserViewModel
    
    @State var name : String = ""
    @State var email : String = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            TextEditor(text: $name)
            TextEditor(text: $email)
        }
        .onAppear(perform: setContent)
        .navigationBarItems(trailing: Button("save"){
            saveEntry()
            presentationMode.wrappedValue.dismiss()
            
        })
    }
    
    private func setContent() {
        if let userEntry = userEntry {
            name = userEntry.name
            email = userEntry.email
        }
    }
    private func setEmail() {
        if let userEntry = userEntry {
            email = userEntry.email
        }
    }
    
    private func saveEntry() {
        if let userEntry = userEntry{
            
            // uppdatera gammal anteckning
            user.update(entry: userEntry , with: name,with: email)
            //user.update(userEntry: userEntry, with: email)
            
        }else
        {
            let newEntry = UserInformation(name:name, email: email)
            user.userEntries.append(newEntry)
        }
        
        
    }
    
    
    
}

