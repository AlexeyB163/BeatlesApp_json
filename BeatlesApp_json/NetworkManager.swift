//
//  NetworkManager.swift
//  BeatlesApp_json
//
//  Created by User on 27.02.2022.
//

import Foundation

struct NetworkManager {
    
     static func getDataTrack(
        urlString: String,
        completion: @escaping (Result<SearchResponse, Error> ) -> Void) {
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { data, _, error in
                
                    guard let data = data else {
                        print(error?.localizedDescription ?? "No description")
                        completion(.failure(error!))
                        return
                    }
                    do {
                        let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                        DispatchQueue.main.async {
                        completion(.success(tracks))
                        }
                    } catch let error {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                
            }.resume()
        }
    private init() {}
}

enum Link: String {
    case urlTrack = "https://itunes.apple.com/search?term=the+beatles&media=music&limit=15"
}
