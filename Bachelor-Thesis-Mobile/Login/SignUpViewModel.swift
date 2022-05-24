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
    @Published var alertMessage: String = ""
    @Published var alertTitle: String = ""
    
    func verifyCredentials(email: String, password: String, confirmPassword: String){
        
        if !email.isEmpty && !password.isEmpty, password == confirmPassword {
            Auth.auth().createUser(withEmail: email , password: password) {result , error in
                
                if error != nil {
                     print("Failed to create user:")
                    self.alertMessage = error!.localizedDescription
                    self.showAlert.toggle()
                    return
                } else {
                    print("Successfully created user")
                    self.alertMessage = "Congratulation, your account has been successfully created "
                    self.alertTitle = "Succes"
                    self.showAlert = true
                }
            }
        } else if password != confirmPassword {
            self.alertMessage = "Password is mismatching"
            self.alertTitle = "Error"
            showAlert.toggle()
        } else {
            self.alertMessage = "Please fill all the contents properly"
            self.alertTitle = "Error"
            showAlert.toggle()
        }
    }
}
