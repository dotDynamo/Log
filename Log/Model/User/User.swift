//
//  User.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class User{
    @Attribute(.unique) var id: UUID
    var username: String
    var name: String
    var paternalSurname: String
    var maternalSurname: String?
    var profileImageData: Data?
    @Relationship var logs: [Log] = []
    
    init(id: UUID = UUID(), username: String, name: String, paternalSurname: String, maternalSurname: String? = nil, profilePic: UIImage? = nil) {
        self.id = id
        self.username = username
        self.name = name
        self.paternalSurname = paternalSurname
        self.maternalSurname = maternalSurname
        self.profileImageData = profilePic?.jpegData(compressionQuality: 0.8)
    }
    
    var profileImage: Image? {
        guard let data = profileImageData, let image = UIImage(data: data) else{
            return nil
        }
        return Image(uiImage: image)
    }
    
    func setProfileImage(_ image: UIImage){
        self.profileImageData = image.jpegData(compressionQuality: 0.8)
    }
}


