//
//  Fact.swift
//  LegendsOfSwift
//
//  Created by Romain Francois on 25/07/2020.
//  Copyright © 2020 Romain Francois. All rights reserved.
//

import Foundation

class Fact: Codable {
//    private struct Result: Codable {
//        var value: String
//    }
    
    var value = ""
//    var quote: String = ""
    var url = "https://api.chucknorris.io/jokes/random?category=dev"
    
    func getData(completed: @escaping () -> ()) {
        // Create a URL
        let urlString = url
        guard let url = URL(string: urlString) else {
            print("ERROR: Couldn't create a URL from \(urlString)")
            completed()
            return
        }
        
        // Create session
        let session = URLSession.shared
        
        // get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            // deal with the data
            do {
                // Basics to get and print data from a json file
                //                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                //                print("json: \(json)")
                
                let result = try JSONDecoder().decode(Fact.self, from: data!)
                self.value = result.value
//                print("quote: \(self.quote)")
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        
        task.resume()
    }
}
