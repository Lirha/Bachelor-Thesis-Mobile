//
//  Info.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 04.06.2022.
//

import Foundation

struct PacientData {
    var age: Int
    var sex: Int
    var cp: Int
    var trestbps: Int
    var chol: Int
    var fbs: Int
    var restecg: Int
    var thalach: Int
    var exang: Int
    var oldpeak: Int
    var slope: Int
    var ca: Int
    var thal: Int
    var target: Int
    
    init(age: String, sex: String, cp: Int, trestbps: String, chol: String, fbs: Int, restecg: Int, thalach: String, exang: Int, oldpeak: String, slope: Int, ca: String, thal: Int) {
        self.age = Int(age) ?? 0
        self.sex = sex == "Male" ? 1 : 0
        self.cp = cp
        self.trestbps = Int(trestbps) ?? 0
        self.chol = Int(chol) ?? 0
        self.fbs = fbs
        self.restecg = restecg
        self.thalach = Int(thalach) ?? 0
        self.exang = exang
        self.oldpeak = Int(oldpeak) ?? 0
        self.slope = slope
        self.ca = Int(ca) ?? 0
        self.thal = thal
        self.target = 1
    }

    var dictionary: [String: Any] {
            return ["age": age,
                    "sex": sex,
                    "cp": cp,
                    "trestbps": trestbps,
                    "chol": chol,
                    "fbs": fbs,
                    "restecg": restecg,
                    "thalach": thalach,
                    "exang": exang,
                    "oldpeak": oldpeak,
                    "slope": slope,
                    "ca": ca,
                    "thal": thal,
                    "target": target
            ]
        }
        var nsDictionary: NSDictionary {
            return dictionary as NSDictionary
        }
}
