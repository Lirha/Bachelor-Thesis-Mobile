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
    @Published var errorMessage: String = ""
    
    func verifyCredentials(email: String, password: String, confirmPassword: String) {
        
        if !email.isEmpty && !password.isEmpty, password == confirmPassword {
            Auth.auth().createUser(withEmail: email , password: password) {result , error in
                
                if error != nil {
                     print("Failed to create user:")
                    self.errorMessage = error!.localizedDescription
                    self.showAlert.toggle()
                    return
                }
                print("Successfully created user")
            }
        } else if password != confirmPassword {
            self.errorMessage = "Password is mismatching"
            showAlert.toggle()
        } else {
            self.errorMessage = "Please fill all the contents properly"
            showAlert.toggle()
        }
    }
}
