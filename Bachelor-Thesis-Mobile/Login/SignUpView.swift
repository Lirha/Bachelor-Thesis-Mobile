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
    
    @Environment(\.presentationMode) var presentationMode
    
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
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("User Name")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black.opacity(0.8))
                    HStack {
                        TextField("username@gmail.com", text: $email)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(.top, 5)
                    }
                  
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
                            HStack {
                                TextField("password", text: $email)
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.black)
                                    .padding(.top, 5)
                            }
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
                                HStack {
                                    TextField("confirm password", text: $email)
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(.black)
                                        .padding(.top, 5)
                                        
                                }
                        } else {
                            HStack {
                                SecureField("Confirm password", text: $confirmPassword)
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.black)
                                    .padding(.top, 5)
                            }
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
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertMessage), dismissButton: viewModel.alertTitle == "Succes" ? .default(Text("OK"), action: {presentationMode.wrappedValue.dismiss()}) : .default(Text("OK")))
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
        viewModel.verifyCredentials(email: self.email, password: self.password, confirmPassword: self.confirmPassword)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
