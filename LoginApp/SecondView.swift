//
//  SecondView.swift
//  LoginApp
//
//  Created by Arvind  on 10/21/24.
//

import Foundation
import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
            Text("Welcome")
                .padding()
                .font(.largeTitle)
        }
        .navigationTitle("Home Page")
    }
}

#Preview {
    SecondView()
}
