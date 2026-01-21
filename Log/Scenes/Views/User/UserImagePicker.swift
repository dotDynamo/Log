//
//  UserImagePicker.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/20.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct UserImagePicker: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @Binding var selectedImage: UIImage?
    
    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()) {
            HStack{
                Label("Profile Picture", systemImage: "photo")
                if selectedImage != nil{
                    Spacer()
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
            }
        }
        .onChange(of: selectedItem){
            Task{
                if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                }
            }
        }
    }
}
