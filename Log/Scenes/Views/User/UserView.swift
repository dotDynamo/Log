//
//  UserView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI

struct UserView: View {
    let user: User
    var showUsername: Bool = true
    var size: Size = .medium
    var action: () -> Void = {print("test")}
    
    @State var scale: CGFloat = 1.5
    
    var body: some View {
        VStack{
            if user.profileImage != nil {
                user.profileImage!
                    .resizable()
                    .frame(width: 50 * scale, height: 50 * scale)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50 * scale, height: 50 * scale)
                    .clipShape(Circle())
            }
            if showUsername{
                Text(user.username)
            }
        }
        .onAppear(){ setSize()}
        .onTapGesture { action() }
    }
    
    func setSize(){
        switch(size){
        case .small:
            scale = 1
        case .medium:
            scale = 1.5
        case .large:
            scale = 2
        }
    }
}

#Preview {
    let user = User(username: "username", name: "Name", paternalSurname: "Paternal")
    UserView(user: user, size: .large)
    UserView(user: user)
    UserView(user: user, size: .small)
    UserView(user: user, showUsername: false, size: .large)
}
