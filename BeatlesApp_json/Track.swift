//
//  Song.swift
//  BeatlesApp_json
//
//  Created by User on 27.02.2022.
//

struct SearchResponse: Decodable {
    let resultCount: Int?
    let results: [Track]
}

struct Track: Decodable {
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let artworkUrl60: String?
    let primaryGenreName: String?
}


