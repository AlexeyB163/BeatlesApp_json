//
//  Song.swift
//  BeatlesApp_json
//
//  Created by User on 27.02.2022.
//

struct SearchResponse: Codable {
    let results: [Track]
}

struct Track: Codable {
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let artworkUrl60: String?
    let primaryGenreName: String?
    
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case collectionName
        case trackName
        case artworkUrl60
        case primaryGenreName
    }

    init(trackData: [String:Any]) {
        artistName = trackData["artistName"] as? String
        collectionName = trackData["collectionName"] as? String
        trackName = trackData["trackName"] as? String
        artworkUrl60 = trackData["artworkUrl60"] as? String ?? "plug"
        primaryGenreName = trackData["primaryGenreName"] as? String
    }
    
    static func getTracks(from value: Any) -> [SearchResponse] {
        
        guard let tracksData = value as? [String : Any] else {
            print("trackData error")
            return [] }
        var tracks:[SearchResponse] = []
        
        for track in tracksData {
            let track = Track(trackData: track)
            tracks.append(track)
        }

        
        return tracks
    }
}


