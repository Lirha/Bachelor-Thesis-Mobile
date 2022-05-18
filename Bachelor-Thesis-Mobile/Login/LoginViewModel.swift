//
//  LoginViewModel.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 15.05.2022.
//

import Foundation
import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showAlert: Bool = false
    @Published var error = "Dar acum"
    
    func verify() {
        if !self.email.isEmpty && !self.password.isEmpty {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let err = error {
                    print("Failed to login:", err)
                    return
                }
                else {
                    print("Success \(result)")
                    NavigationLink("MainScreen", destination: MainScreenView())
                }
            }
        } else {
            self.error = "Please fill all the contents properly"
            showAlert.toggle()
        }
    }
    
    func reset() {
        if !self.email.isEmpty {
            Auth.auth().sendPasswordReset(withEmail: self.email) { (error) in
                
                if error != nil {
                    self.error = error!.localizedDescription
                    self.showAlert.toggle()
                    return
                }
                
                self.error = "RESET"
                self.showAlert.toggle()
            }
        } else {
            self.error = "Email ID is empty"
            self.showAlert.toggle()
        }
    }
}
