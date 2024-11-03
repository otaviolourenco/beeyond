//
//  SignInView.swift
//  beeyond
//
//  Created by Otavio Lourenço on 03/11/2024.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Button("Sign In") {
                authViewModel.signIn(email: email, password: password) { success, error in
                    if let error = error {
                        print("Error: \(error)")
                    }
                }
            }
        }
        .padding()
    }
    
}

#Preview {
    SignInView()
}
