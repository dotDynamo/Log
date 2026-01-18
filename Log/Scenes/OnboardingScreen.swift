//
//  OnboardingScreen.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI
import SwiftData

struct OnboardingScreen: View {
    
    let userService: UserService
    
    @State var userSheetPresented: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            Text("Welcome to Log!").font(.title)
            Text("To continue please create a new user").font(.subheadline)
            Spacer()
            Button("Create New User"){ userSheetPresented.toggle() }
        }.sheet(isPresented: $userSheetPresented){
            CreateUserSheet(userService: userService)
        }
    }
}
