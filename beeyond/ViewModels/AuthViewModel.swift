//
//  AuthViewModel.swift
//  beeyond
//
//  Created by Otavio Lourenço on 03/11/2024.
//

import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var isUserRegistered: Bool = false
    @Published var showSuccessAlert = false
    
    
    init() {
        self.user = Auth.auth().currentUser
    }

    var passwordsMatch: Bool {
           return !confirmPassword.isEmpty && password == confirmPassword
       }
    
    var isFormValid: Bool {
           return !email.isEmpty && !password.isEmpty && passwordsMatch
       }
    
    func signIn(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                self.user = result?.user
                completion(true, nil)
            }
        }
    }

    func signUp() {
            guard isFormValid else {
                errorMessage = "Verifique se todos os campos estão corretos."
                return
            }
            
            isLoading = true
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let error = error {
                        self?.errorMessage = error.localizedDescription
                    } else {
                        self?.isUserRegistered = true
                        self?.showSuccessAlert = true 
                    }
                }
            }
        }

    func signOut() {
        try? Auth.auth().signOut()
        self.user = nil
    }
}
