//
//  UserSession.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import Foundation
internal import Combine

class UserSession: ObservableObject{
    @Published var currentUser: User?
}
