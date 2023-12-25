//
//  Service.swift
//  ChuckNorrisJokes
//
//  Created by Cecilia Andrea Pesce on 23/12/23.
//

import Foundation

enum ServiceError: Error {
    case noData
}

class Service {
    
    static let shared = Service()
    
    private init(){}
    
    func getRandomJoke(by handle: @escaping (Result<ChukNorrisJokeModel, Error>) -> Void){
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else { 
                    handle(.failure(error ?? ServiceError.noData))
                    return }
                do {
                    let result = try JSONDecoder().decode(ChukNorrisJokeModel.self, from: data)
                    handle(.success(result))
                } catch {
                    handle(.failure(error))
                }
            }
        } .resume()
    }

}
    
