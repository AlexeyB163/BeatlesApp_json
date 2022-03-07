//
//  NetworkManager.swift
//  BeatlesApp_json
//
//  Created by User on 27.02.2022.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    static var shared = NetworkManager()
    
    mutating func fetchTrack(urlString: String, completion: @escaping (Result<[SearchResponse], Error> ) -> Void) {
        var tracks:[SearchResponse] = []
        
        AF.request(Link.urlTrack.rawValue)
            .responseJSON { dataResponse in
                guard let statuscode = dataResponse.response?.statusCode else { return }
                
                if (200...300).contains(statuscode) {
                    guard let value = dataResponse.value else { return }
                    //print(value)
                    tracks = Track.getTracks(from: value)
                    //print(tracks)
                    
                } else {
                    completion(.failure(dataResponse.error?.localizedDescription as! Error))
                }
            
            }
    }
    private init() {}
}

enum Link: String {
    case urlTrack = "https://itunes.apple.com/search?term=the+beatles&media=music&limit=3"
}
