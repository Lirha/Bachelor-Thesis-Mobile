//
//  CustomTabView.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 27.05.2022.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var currentTab: String
    @Binding var showMenu: Bool

    var body: some View {
        VStack {
            // Static Header View for all Pages
            
            HStack {
                // Menu Button
                
                Button {
                    // Toggling Menu Option
                    withAnimation(.spring()) {
                        showMenu = true
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
                
                // Hiding when menu is visible
                .opacity(showMenu ? 0 : 1)
                Spacer()
                
                Button {
                    
                } label: {
                    Image("person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
            }
            // Page title
            .overlay(
                Text(currentTab)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                // Hiding when menu is visible
                    .opacity(showMenu ? 0 : 1)
            )
            .padding([.horizontal, .top])
            .padding(.bottom, 8)
            .padding(.top, 8)
            .padding(.top, getSafeArea().top)
            
            TabView(selection: $currentTab) {
                Home()
                    .tag("Home")
                
                //Replace your custom views here..
                Text("Discover")
                    .tag("Discover")
                
                Text("Profile")
                    .tag("Profile")
                
                Text("Settings")
                    .tag("Settings")
            }
            
        }
        // Disabling actions when menu is visible...
        .disabled(showMenu)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            // Close Button
            Button {
                // Toggling Menu Option
                withAnimation(.spring()) {
                    showMenu = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.title.bold())
                    .foregroundColor(.white)
            }
            
            // Hiding when menu is visible
            .opacity(showMenu ? 1 : 0)
            .padding()
            .padding(.top)
            , alignment: .topLeading)
        .background(
         Color.black
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
