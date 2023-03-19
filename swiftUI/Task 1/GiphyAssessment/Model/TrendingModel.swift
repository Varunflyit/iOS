//
//  TrendingModal.swift
//  GiphyAssessment
//
//  Created by Chandra Sekhar on 11/02/23.
//

import Foundation


// MARK: - TrendingModal
struct TrendingGifModal: Codable, Hashable {
    let data: [Datum]?
    let meta: Meta?
}

// MARK: - Datum
struct Datum: Codable, Hashable {
    let type, id: String?
    let url: String?
    let username, title: String?
    let images: Images?
}

// MARK: - Images
struct Images: Codable, Hashable {
    let original: Original?
}

// MARK: - Original
struct Original: Codable, Hashable {
    let url: String?
}

// MARK: - Meta
struct Meta: Codable, Hashable {
    let status: Int?
    let msg, responseID: String?
    
    enum CodingKeys: String, CodingKey {
        case status, msg
        case responseID = "response_id"
    }
}


