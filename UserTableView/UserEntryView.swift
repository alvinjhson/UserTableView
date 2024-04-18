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
    @State var image: UIImage = UIImage(named: "defaultImage")!
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    showingImagePicker = true
                }
//            Image(uiImage: image)
            HStack{
                Text("Name:")
                TextEditor(text: $name)
                    .frame(height: 35)
            }
            HStack{
                Text("Email:")
                TextEditor(text: $email)
                    .frame(height: 35)
            }
        }
        .onAppear(perform: setContent)
        .navigationBarItems(trailing: Button("save"){
            saveEntry()
            presentationMode.wrappedValue.dismiss()
            
        })
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = inputImage
    }
    
    private func setContent() {
        if let userEntry = userEntry {
            name = userEntry.name
            email = userEntry.email
            image = userEntry.image
        }
    }
//    private func setEmail() {
//        if let userEntry = userEntry {
//            email = userEntry.email
//        }
//    }
//    
    private func saveEntry() {
        if let userEntry = userEntry{
            
        
            user.update(entry: userEntry , with: name,with: email,with: image)
            
        }else
        {
            let newEntry = UserInformation(name:name, email: email,image: image)
            user.userEntries.append(newEntry)
        }
        
        
    }
    
    
    
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // Inga uppdateringar behövs här
    }
}
//#Preview {
//    UserEntryView()
//}

