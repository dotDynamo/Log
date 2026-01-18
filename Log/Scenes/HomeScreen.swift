//
//  HomeScreen.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var userSession: UserSession
    @State var newLogSheetVisibility: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Text(userSession.currentUser != nil ? "Welcome \(userSession.currentUser!.name)" : "No user")
                AddLogButton(action: {newLogSheetVisibility.toggle()})
            }
            .toolbar{
                
            }
            .sheet(isPresented: $newLogSheetVisibility){
                AddLogSheet()
            }
        }
    }
}
