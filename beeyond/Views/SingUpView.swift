//
//  SingUpView.swift
//  beeyond
//
//  Created by Otavio Lourenço on 04/11/2024.
//

import SwiftUI

struct SingUpView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack{
            TextField("E-mail", text: $authViewModel.email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $authViewModel.password)
                .textFieldStyle(.roundedBorder)
            SecureField("Repeat your password", text: $authViewModel.confirmPassword)
                .textFieldStyle(.roundedBorder)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            authViewModel.confirmPassword.isEmpty ? Color.clear : (authViewModel.passwordsMatch ? Color.green : Color.red), lineWidth: 2
                        )
                )
            if let errorMessage = authViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(Color.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Button("Sing Up"){
                authViewModel.signUp()
            }
            NavigationLink(destination: ContentView(), isActive: $authViewModel.isUserRegistered) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Sign Up")
        .alert(isPresented: $authViewModel.showSuccessAlert) {
            Alert(
                title: Text("Great!! 🥳"),
                message: Text("You're successfull registed!"),
                dismissButton: .default(Text("Let's go!")) {
                    authViewModel.isUserRegistered = true
                }
            )
        }
    }
}

#Preview {
    SingUpView()
        .environmentObject(AuthViewModel())
}
