//
//  ContentView.swift
//  LoginApp
//
//  Created by Arvind  on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .accessibilityIdentifier("usernameTextField")
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .accessibilityIdentifier("passwordSecureField")
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login")
                        .padding()
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Invalid"), message: Text("Re-enter the credentials"), dismissButton: .default(Text("Ok")))
                }
                
                NavigationLink(destination: SecondView(), isActive: $viewModel.isAuthenticated) {
                    EmptyView()
                }
                
            }
            .navigationTitle("Login Page")
        }
    }
}

#Preview {
    ContentView()
}
