//
//  CreateUserSheet.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI
import PhotosUI

struct CreateUserSheet: View {
    @Environment(\.dismiss) var dismiss
    
    let userService: UserService
    
    @State var username: String = ""
    @State var name: String = ""
    @State var paternalSurname: String = ""
    @State var maternalSurname: String = ""
    @State var profilePic: Data? = nil
    @State var selectedImage: UIImage? = nil
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Register New User").font(.title)
                Form{
                    TextField("", text: $username, prompt:Text("Username"))
                    TextField("", text: $name, prompt:Text("Name"))
                    TextField("", text: $paternalSurname, prompt:Text("Paternal Surname"))
                    TextField("", text: $maternalSurname, prompt:Text("Maternal Surname"))
                    UserImagePicker(selectedImage: $selectedImage)
                }
                Button("Create new user"){
                    let user = User(username: username, name: name, paternalSurname: paternalSurname,
                                    maternalSurname: maternalSurname != "" ? maternalSurname : nil,)
                    if selectedImage != nil {
                        user.setProfileImage(selectedImage!)
                    }
                    userService.createUser(user)
                    dismiss()
                }
            }
            .scrollDisabled(true)
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button(role: .cancel){ dismiss()}
                }
            }
        }
    }
}
