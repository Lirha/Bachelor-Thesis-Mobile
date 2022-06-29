//
//  Service.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 05.06.2022.
//

import Foundation

import SwiftUI
import Combine

struct User: Codable {
    var username: String
}

struct ResponseData: Codable {
    let target: Int
}

class Service: ObservableObject {
    
    @Published var users: User?
    @Published var result: Int?
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:5000/users?username=Marcel") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    self?.users = user
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

//    func loadData(body: Dictionary<String,Any>) {
//       guard let url = URL(string: "http://127.0.0.1:8889/userData") else {
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print(error)
//                return
//            }
//            if let data = data {
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                        print("JSOON")
//                        print(json)
//                        DispatchQueue.main.async { [weak self] in
//                            self?.result = json["target"] as? Int
//                          }
//                    }
//                }catch let error {
//                    print("WE couldn't parse the data into JSON", error)
//                }
//
//                print("Response\(String(describing: response))")
//            }
//        }.resume()
//    }
}
