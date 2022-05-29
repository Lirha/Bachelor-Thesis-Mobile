//
//  AddDataView.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 27.05.2022.
//

import SwiftUI

struct AddDataView: View {
    
    @State var ageTextField: String = ""
    @State var selectedGender: String = "Male"
    @State var selectedCp: Int = 0
    @State var trestbps: String = ""
    @State var cholTextField: String = ""
    @State var fbsTextField: Int = 0
    @State var restecgTextField: Int = 0
    @State var thalachTextField: String = ""
    @State var exangTextField: Int = 0
    @State var oldpeakTextField: String = ""
    @State var slopeTextField: Int = 0
    
    var body: some View {
        VStack {
            
            ScrollView {
                
                HStack {

                // Age
                VStack(alignment: .leading) {
                    Text("Age")
                        .foregroundColor(.white)
                    TextField("age", text: $ageTextField)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding()
                
                // Gender
                HStack {
                    Text("Choose Gender")
                  
                    Picker(selection: $selectedGender) {
                        Text("Female").tag("Female")
                        Text("Male").tag("Male")
                    } label: {
                        Text("Gender").foregroundColor(.white)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                       // .frame(width: 100, height: 90, alignment: .center)
                        .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    Spacer()
                }.padding()
                
                // Cp
                HStack {
                    Text("Cp")
                  
                    Picker(selection: $selectedCp) {
                        Text("0").tag(0)
                        Text("1").tag(1)
                        Text("2").tag(2)
                        Text("3").tag(3)
                    } label: {
                        Text("Cp").foregroundColor(.white)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    Spacer()
                }.padding()
                
                // trestbps
                VStack(alignment: .leading) {
                    Text("Resting blood pressure")
                        .foregroundColor(.white)
    //                    .padding()
                    TextField("Resting blood pressure", text: $trestbps)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
    //                    .padding()
                }.padding()
                
                // serum cholestoral
                VStack(alignment: .leading) {
                    Text("Serum cholestoral")
                        .foregroundColor(.white)
                    TextField("serum cholestoral", text: $cholTextField)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding()
                
                // fbs
                HStack {
                    Text("Blood sugar")
                    Spacer()
                    Picker(selection: $fbsTextField) {
                        Text("0").tag(0)
                        Text("1").tag(1)

                    } label: {
                        Text("Fbs").foregroundColor(.white)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    Spacer()
                }.padding()
                
                //resting electrocardiographic
                HStack {
                    Text("Resting electrocardiographic")
                  
                    Picker(selection: $restecgTextField) {
                        Text("0").tag(0)
                        Text("1").tag(1)
                        Text("2").tag(2)
                    } label: {
                        Text("Resting electrocardiographic").foregroundColor(.white)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    Spacer()
                }.padding()
                
                // thalach
                VStack(alignment: .leading) {
                    Text("Thalach")
                        .foregroundColor(.white)
                    TextField("Thalach", text: $thalachTextField)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding()
                
                //exercise induced angina
                
                HStack {
                    Text("Exercise induced angina")
                    Spacer()
                    Picker(selection: $exangTextField) {
                        Text("0").tag(0)
                        Text("1").tag(1)

                    } label: {
                        Text("Exercise induced angina").foregroundColor(.white)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    Spacer()
                }.padding()
                
                // ST depression induced by exercise
                VStack(alignment: .leading) {
                    Text("ST depression induced by exercise (oldpeak)")
                        .foregroundColor(.white)
                    TextField("", text: $oldpeakTextField)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding()
                
                //Slope
//                HStack {
//                    Text("Slope")
//
//                    Picker(selection: $slopeTextField) {
//                        Text("0").tag(0)
//                        Text("1").tag(1)
//                        Text("2").tag(2)
//                    } label: {
//                        Text("Slope").foregroundColor(.white)
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
//                        .padding()
//                    .background(Color.gray.opacity(0.3).cornerRadius(10))
//                    Spacer()
//                }.padding()
                }
            }
        }
    }
}
// .pickerStyle(SegmentedPickerStyle())
struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView()
    }
}
