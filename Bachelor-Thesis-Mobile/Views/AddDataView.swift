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
    @State var ca: String = ""
    @State var thalTextField: String = ""
    
    @StateObject var service = Service()
    @State var firstInfo: PacientData?
    
    var body: some View {
        VStack {
            
            ScrollView {
                VStack {
                    Group {
                        
                        //1.Age
                        VStack(alignment: .leading) {
                            Text("Age")
                                .foregroundColor(.white)
                            TextField("age", text: $ageTextField)
                                .padding()
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                        }.padding()
                        
                        //2. Gender
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
                        
                        //3. Cp
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
                        
                        //4. Trestbps
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
                        
                        //5. Serum cholestoral
                        VStack(alignment: .leading) {
                            Text("Serum cholestoral")
                                .foregroundColor(.white)
                            TextField("serum cholestoral", text: $cholTextField)
                                .padding()
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                        }.padding()
                        
                        //6. fbs
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
                        
                        //7. resting electrocardiographic
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
                        
                    }
                    
                    Group {
                        
                        //8. thalach
                        VStack(alignment: .leading) {
                            Text("Thalach")
                                .foregroundColor(.white)
                            TextField("Thalach", text: $thalachTextField)
                                .padding()
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                        }.padding()
                        
                        //9. exercise induced angina
                        
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
                        
                        //10. ST depression induced by exercise
                        VStack(alignment: .leading) {
                            Text("ST depression induced by exercise (oldpeak)")
                                .foregroundColor(.white)
                            TextField("", text: $oldpeakTextField)
                                .padding()
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                        }.padding()
                        
                        //11. Slope
                        HStack {
                            Text("Slope")
                            
                            Picker(selection: $slopeTextField) {
                                Text("0").tag(0)
                                Text("1").tag(1)
                                Text("2").tag(2)
                            } label: {
                                Text("Slope").foregroundColor(.white)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                            .background(Color.gray.opacity(0.3).cornerRadius(10))
                            Spacer()
                        }.padding()
                        
                        //12. ca - number of major vessels
                        VStack(alignment: .leading) {
                            Text("Number of major vessels")
                                .foregroundColor(.white)
                            TextField("", text: $ca)
                                .padding()
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                        }.padding()
                        
                        //13. thal - thalium stress result
                        HStack {
                            Text("Thalium stress resul")
                            
//                            Picker(selection: $thalTextField) {
//                                Text("0").tag(0)
//                                Text("1").tag(1)
//                            } label: {
//                                Text("Thalium stress resul").foregroundColor(.white)
//                            }
//                            .pickerStyle(SegmentedPickerStyle())
//                            .padding()
//                            .background(Color.gray.opacity(0.3).cornerRadius(10))
//                            Spacer()
                            TextField("", text: $thalTextField)
                                .padding()
                                .background(Color.gray.opacity(0.3).cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                        }.padding()
                    }
                    
                    Button {
                        save()
                       // let body: [String: Any] = ["name":1,"age":2]
                        guard let body = firstInfo?.nsDictionary else {
                            return
                        }
                        service.loadData(body: body)
                    } label: {
                        Text("Submit".uppercased())
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal, 20)
                            .background(Color.gray.opacity(0.3).cornerRadius(10))
                            .padding(.bottom)
                    }
                }
            }
        }.navigationBarHidden(true)
            .navigationTitle("")
    }
    
    func save() {
        self.firstInfo =  PacientData(age: ageTextField, sex: selectedGender, cp: selectedCp, trestbps: trestbps, chol: cholTextField, fbs: fbsTextField, restecg: restecgTextField, thalach: thalachTextField, exang: exangTextField, oldpeak: oldpeakTextField, slope: slopeTextField, ca: ca, thal: thalTextField)
    }
}

//struct AddDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddDataView()
//    }
//}
