//
//  Info.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 04.06.2022.
//

import Foundation

struct PacientData {
    var age: Int
    var gender: Int
    var cp: Int
    var trestbps: Int
    var chol: Int
    var fbs: Int
    var restecg: Int
    var thalach: Int
    var exang: Int
    var oldpeak: Int
    var slope: Int
    var numberOfMajorVessels: Int
    var thal: Int
    
    init(age: String, gender: String, cp: Int, trestbps: String, chol: String, fbs: Int, restecg: Int, thalach: String, exang: Int, oldpeak: String, slope: Int, numberOfMajorVessels: String, thal: Int) {
        self.age = Int(age) ?? 0
        self.gender = gender == "Male" ? 1 : 0
        self.cp = cp
        self.trestbps = Int(trestbps) ?? 0
        self.chol = Int(chol) ?? 0
        self.fbs = fbs
        self.restecg = restecg
        self.thalach = Int(thalach) ?? 0
        self.exang = exang
        self.oldpeak = Int(oldpeak) ?? 0
        self.slope = slope
        self.numberOfMajorVessels = Int(numberOfMajorVessels) ?? 0
        self.thal = thal
    }
}
