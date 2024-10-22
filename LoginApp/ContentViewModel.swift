//
//  ContentViewModel.swift
//  LoginApp
//
//  Created by Arvind  on 10/21/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var showAlert: Bool = false

    func login() {
        if username.lowercased() == "Arvind".lowercased() && password == "111" {
            isAuthenticated = true
            showAlert = false
        } else {
            showAlert = true
            isAuthenticated = false
        }
    }
}
