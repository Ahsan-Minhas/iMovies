//
//  RequestFailed.swift
//  iMovies
//
//  Created by Mac on 02/04/2022.
//

import Foundation
struct RequestFailed: Decodable {
    let statusCode: Int
    let statusMessage: String
    let success: Bool

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
