//
//  LoginView.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 06.05.2022.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @State var showSignUp = false
    @State var showAlert = false
    
    init() {
        FirebaseApp.configure()
    }
    var body: some View {
        NavigationView {
            VStack {
                HeartAnimationView()
                Spacer()
                
                VStack {
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .kerning(1.9)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    
                    //Email
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text("Email")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        HStack {
                            TextField("username@gmail.com", text: $email)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.top, 5)
                        }
                        
                        Divider()
                    })
                    // .padding(.top, 50)
                    
                    //Password
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text("Password")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        HStack {
                            if self.visible {
                                TextField("password", text: self.$password)
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.black)
                                    .padding(.top, 5)
                            } else {
                                SecureField("password", text: $password)
                                    .font(.system(size: 20, weight: .semibold))
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
                    
                    // Login Button
                    Button {
                        verifyCredentials()
                    } label: {
                        Text("LOGIN")
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
                    
                    // Forget Password...
                    Button {
                        
                    } label: {
                        Text("Forget password")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }.frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 10)
                }
                .padding()
                .padding(.top, 10)
                
                // removing unwanted Space
                .padding(.top,10)
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .overlay(
                HStack {
                    Text("New Member")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    NavigationLink("Sign up", destination: SignUpView())
                    
                }, alignment: .bottom)
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func verifyCredentials() {
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
            showAlert.toggle()
        }
    }
}

struct HeartAnimationView: View {
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("realisticHeart")
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .foregroundColor(animate ? Color.black : Color.black.opacity(0.8))
                .frame(width: 190, height: 300)
            //    .frame(width: 150, height: 250)
            //  .frame(width: 50, height: 150)
                .frame(width: animate ? 230 : 170, height: animate ? 330 : 280)
                .shadow(color: animate ? Color.gray.opacity(0.7) : Color.black.opacity(0.1),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            
            // Daca decomentez Spacer() - ul asta, nu se mai plimba ecranul
            Spacer()
        }.onAppear(perform: addAnimation)
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.5)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

