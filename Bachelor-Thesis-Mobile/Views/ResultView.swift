//
//  ResultView.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 08.06.2022.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var result: Int
    @State var isLoading = true
    
    var body: some View {
        ZStack {
            Circle().fill(result == 0 ? RadialGradient(gradient:
                                                        Gradient(colors: [Color.white, Color.green, Color.black]),
                                                       center: .center,
                                                       startRadius: 2,
                                                       endRadius: 180) :
                            RadialGradient(gradient:
                                            Gradient(colors: [Color.white, Color.red, Color.black]),
                                           center: .center,
                                           startRadius: 2,
                                           endRadius: 180))
            .padding(80)
            Text(result == 1 ? "Sick" : "Healthy" )
                .font(.headline)
                .foregroundColor(.black)
        }   .background(
            Image("realisticHeart")
                .renderingMode(.template)
                .frame(width: 300, height: 500, alignment: .center)
                .foregroundColor(result == 0 ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
            // Always dark mode
                .preferredColorScheme(.dark)
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }
}
 
