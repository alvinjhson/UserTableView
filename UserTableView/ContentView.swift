//
//  ContentView.swift
//  UserTableView
//
//  Created by Alvin Johansson on 2024-04-17.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user : UserViewModel
    var body: some View {
        NavigationStack{
            VStack {
                List() {
                    ForEach(user.userEntries) { entry in
                        NavigationLink( destination:UserEntryView(userEntry: entry)){
                            rowView(entry: entry)
                        }
                        
                    }
                }
            }
            .navigationTitle("Users")
            .navigationBarItems( trailing: NavigationLink(destination: UserEntryView()) {
               Image(systemName: "plus.circle")
            })
        }
    }
}
struct rowView: View {
    
    let entry: UserInformation
    
    var body: some View {
        HStack {
                        Text(entry.name)
                        Spacer()
                        Text(entry.email)

        }
    }
}

#Preview {
    ContentView()
}

