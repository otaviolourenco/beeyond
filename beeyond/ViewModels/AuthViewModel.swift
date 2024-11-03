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
    
    init() {
        self.user = Auth.auth().currentUser
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

    func signUp(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                self.user = result?.user
                completion(true, nil)
            }
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.user = nil
    }
}
