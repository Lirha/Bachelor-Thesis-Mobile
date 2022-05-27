//
//  Home.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 27.05.2022.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some View {
        NavigationView {
            VStack  {
                if self.status {
                    HomeScreenView()
                } else {
                    ZStack {
                        NavigationLink( "", destination: LoginView()).hidden()
                        LoginView()
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear() {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                    
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
