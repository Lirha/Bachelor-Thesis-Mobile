//
//  MainScreenView.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 07.05.2022.
//

import SwiftUI

struct MainScreenView: View {
    
    // Curent Tab
    @State var currentTab: String = "Test"
    
    // Menu option...
    @State var showMenu: Bool = false
    
    // Hiding Native Tab Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            // Custom Side Menu...
            SideMenu(currentTab: $currentTab)
               
            //Main tab View
            CustomTabView(currentTab: $currentTab, showMenu: $showMenu)
            
            //Applining Corner Radius
                .cornerRadius(showMenu ? 25 : 0)
            
            //Making 3D rotation...
            
                .rotation3DEffect(.init(degrees: showMenu ? -15 : 0), axis: (x: 0,y: 1, z: 0))
            
            //Moving View apart
                .offset(x: showMenu ? getRect().width / 2 : 0, y: 0)
            
        }
        .navigationBarHidden(true)
        // Always dark mode
        .preferredColorScheme(.dark)
    }
}

extension View {
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen =
                UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
