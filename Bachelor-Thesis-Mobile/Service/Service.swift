//
//  Service.swift
//  Bachelor-Thesis-Mobile
//
//  Created by Lisa Brinzila on 05.06.2022.
//

import Foundation

import SwiftUI

struct User: Codable {
    var username: String
}

class Service: ObservableObject {
    
    @Published var users: User?
    
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
}
