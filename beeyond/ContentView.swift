//
//  ContentView.swift
//  beeyond
//
//  Created by Otavio Lourenço on 03/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack {
                if let user = authViewModel.user {
                    Text("Hello, \(user.email ?? "User")!")
                    Button(action: {
                        authViewModel.signOut()
                    }, label: {
                        Text("Logout")
                    })
                } else {
                    Text("Please, login in your account.")
                        SignInView()
                            .environmentObject(authViewModel)
                    Text("Don't have an account yet?" )
                    NavigationLink("Sign Up!", destination: SingUpView().environmentObject(authViewModel) )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
