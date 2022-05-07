//
//  SignUpViewModel.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 06.05.2022.
//

import Foundation
import Firebase

class SignUpViewModel: ObservableObject {
    
    @Published var showAlert: Bool = false
    
    func verifyCredentials(email: String, password: String, confirmPassword: String) {
        
        if !email.isEmpty && !password.isEmpty, password == confirmPassword {
            Auth.auth().createUser(withEmail: email , password: password) {result , error in
                if let err = error {
                    print("Failed to create user:", err)
                    return
                }
                print("Successfully created user \(result)")
            }
        } else {
            showAlert.toggle()
        }
    }
}
