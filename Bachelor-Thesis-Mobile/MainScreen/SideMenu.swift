//
//  SideMenu.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 27.05.2022.
//

import SwiftUI
import Firebase

struct SideMenu: View {
    
    @Binding var currentTab: String
    
    // Adding smooth transition between tabs with the help of
    //Matched Geometry Effect...
    
    @Namespace var animation
    
    var body: some View {
        VStack {
            
            HStack(spacing: 15) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    
                
                Text("User")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }
            .padding(.top, 50)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //Tab Buttons
            VStack(alignment: .leading, spacing: 25) {
                CustomTabButton(icon: "theatermasks.fill", title: "Home")
                CustomTabButton(icon: "stethoscope", title: "Test")
                CustomTabButton(icon: "person.fill", title: "Profile")
                CustomTabButton(icon: "gearshape.fill", title: "Setting")

                Spacer()
                CustomTabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
            }
            .padding()
            .padding(.top, 45)
            
            // Max width of screen width
            .frame(width: getRect().width / 2, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color.gray.opacity(0.1)
          )
        
        // Not sure about this one
     //  .ignoresSafeArea()
        
    }
    
    //Custom Button
    //LOGOUT
    @ViewBuilder
    func CustomTabButton(icon: String, title: String) -> some View {
        Button {
            if title == "Logout" {
                withAnimation {
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            } else {
                withAnimation {
                    currentTab = title
                }
            }
        } label: {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: 48, height: 48)
                    .foregroundColor(currentTab == title ? Color.purple : (title == "Logout" ? Color.orange : Color.white))
                    .background(
                        ZStack {
                            if currentTab == title {
                                Color.white.clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                            }
                        }
                    )
                
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(title == "Logout" ? Color.orange : .white)
            }
            .padding(.trailing, 18)
            .background(
                ZStack {
                    if currentTab == title {
                        Color.purple
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                }
            )
        }
        .offset(x: currentTab == title ? 15 : 0)
        
    }
    
}

// Extending View to get Screen Bounds

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
