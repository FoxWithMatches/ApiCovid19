//
//  NetworkManager.swift
//  ApiCovid19
//
//  Created by Alisa Ts on 06.12.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchRawData(from url: String?, with completion: @escaping(Covid) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let covid = try JSONDecoder().decode(Covid.self, from: data)
                DispatchQueue.main.async {
                   completion(covid)
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
