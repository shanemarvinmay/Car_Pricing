//
//  APIRequest.swift
//  VERSUS
//
//  Created by student on 4/21/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct APIRequest {
    let resourceURL: URL
    
    init(endpoint: String) {
        let resourceString = "https://vast-gorge-25891.herokuapp.com/car-value?make=u&model=u&year=2020&mpg=35&milage=1\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else { fatalError()}
        
        self.resourceURL = resourceURL
        
    }
    
    func save (_ messageToSave:Message, completion: @escaping(Result<Message, APIError>) -> Void){
        do{
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(messageToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {
                data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                do {
                    let messageData = try JSONDecoder().decode(Message.self, from: jsonData)
                    completion(.success(messageData))
                }catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
}
