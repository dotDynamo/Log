//
//  UserEditView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/20.
//

import SwiftUI

struct UserEditView: View {
    @Binding var user: User
    
    @State private var maternalSurname: String = ""
    @State private var selectedImage: UIImage?
    var body: some View {
        UserView(user: $user, showUsername: false, size: .large)
        Form{
            Section("Edit User"){
                TextField("\(user.name)", text: $user.name)
                TextField("\(user.paternalSurname)", text: $user.paternalSurname)
                if user.maternalSurname != nil {
                    TextField("\(maternalSurname)", text: $maternalSurname)
                }
                TextField("\(user.username)", text: $user.username)
                UserImagePicker(selectedImage: $selectedImage)
            }
        }.onAppear(){
            if user.maternalSurname != nil { maternalSurname = user.maternalSurname!}
        }.onChange(of: maternalSurname) {
            user.maternalSurname = maternalSurname
        }
        .onChange(of: selectedImage) {
            if selectedImage != nil {
                user.setProfileImage(selectedImage!)
            }
        }
    }
}
