//
//  TrailerListResponse.swift
//  iMovies
//
//  Created by Mac on 03/04/2022.
//

import Foundation

struct TrailerListResponse: Decodable {
    let id: Int
    let results: [TrailerResult]
}

// MARK: - Result
struct TrailerResult: Decodable {
    let iso639_1: ISO639_1
    let iso3166_1: ISO3166_1
    let name, key: String
    let site: Site
    let size: Int
    let type: TypeEnum
    let official: Bool
    let publishedAt, id: String

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}

enum ISO3166_1: String, Decodable {
    case us = "US"
}

enum ISO639_1: String, Decodable {
    case en = "en"
}

enum Site: String, Decodable {
    case youTube = "YouTube"
}

enum TypeEnum: String, Decodable {
    case clip = "Clip"
    case teaser = "Teaser"
    case trailer = "Trailer"
}
