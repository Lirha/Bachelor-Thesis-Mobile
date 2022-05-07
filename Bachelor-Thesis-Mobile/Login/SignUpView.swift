//
//  SignUpView.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 06.05.2022.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var maxCircleHeight: CGFloat = 0
    @State var visible = false
    @State var revisible = false
    @State var showAlert = false
    
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Spacer()
            VStack {
                Spacer()
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(.black)
                    .kerning(1.9)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // User
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("User Name")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black.opacity(0.8))
                    TextField("username@gmail.com", text: $email)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top, 5)
                    Divider()
                })
                .padding(.top, 25)
                
                // Password
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Password")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black.opacity(0.8))
                    HStack {
                        if self.visible {
                            TextField("Password", text: self.$password)
                                .font(.system(size: 18, weight: .semibold))
                        } else {
                            SecureField("password", text: $password)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.top, 5)
                        }
                        Button {
                            self.visible.toggle()
                        } label: {
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    Divider()
                })
                .padding(.top, 20)
                
                // Confirm Password
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Confirm Password")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black.opacity(0.8))
                    HStack {
                        if self.revisible {
                            TextField("Confirm Password", text: self.$confirmPassword)
                                .font(.system(size: 18, weight: .semibold))
                        } else {
                            SecureField("Confirm password", text: $confirmPassword)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.top, 5)
                        }
                        Button {
                            self.revisible.toggle()
                        } label: {
                            Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    Divider()
                })
                .padding(.top, 20)
                
                //Register
                Button {
                    verifyCredentials()
                } label: {
                    Text("Register")
                        .frame(height: 50)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 10, x: 0.0, y: 10)
                }.padding(.top, 20)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Please fill all the contents properly"))
                    }
                Spacer()
            }
            .padding()
            
            // removing unwanted Space
            .padding(.top, -maxCircleHeight / 1.6)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .background(
            Image("realisticHeart")
                .renderingMode(.template)
                .frame(width: 300, height: 500, alignment: .center)
                .foregroundColor(Color.gray.opacity(0.2))
        )
    }
    
    func verifyCredentials() {
//        if !self.email.isEmpty && !self.password.isEmpty, self.password == self.confirmPassword {
//            Auth.auth().createUser(withEmail: email , password: password) {result , error in
//                if let err = error {
//                    print("Failed to create user:", err)
//                    return
//                }
//                print("Successfully created user \(result)")
//            }
//        } else {
//            showAlert.toggle()
//        }
        viewModel.verifyCredentials(email: self.email, password: self.password, confirmPassword: self.confirmPassword)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
