//
//  SignInView.swift
//  beeyond
//
//  Created by Otavio Lourenço on 03/11/2024.
//

import SwiftUI

struct SignInView: View {

    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("E-mail", text: $authViewModel.email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $authViewModel.password)
                .textFieldStyle(.roundedBorder)
            Button("Sign In") {
                authViewModel.signIn(email: authViewModel.email, password: authViewModel.password) { success, error in
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
        .environmentObject(AuthViewModel())
}
