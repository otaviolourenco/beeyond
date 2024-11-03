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
        
        VStack {
                    if let user = authViewModel.user {
                        Text("Olá, \(user.email ?? "Usuário")!")
                    } else {
                        Text("Por favor, faça login.")
                            SignInView()
                                .environmentObject(authViewModel)
                    }
                }
        

    }
}

#Preview {
    ContentView()
}
