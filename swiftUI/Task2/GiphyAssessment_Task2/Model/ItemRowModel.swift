//
//  ItemRowModel.swift
//  GiphyAssessment_Task2
//
//  Created by Chandra Sekhar on 06/03/23.
//

import Foundation

// MARK: - ItemRowModelElement
struct ItemRowModelElement: Codable, Hashable {
    let id: Int?
    let title, description, source, sourceID: String?
    let version: String?
    let publishedAt: Int?
    let readablePublishedAt: String?
    let updatedAt: Int?
    let readableUpdatedAt, type: String?
    let active, draft: Bool?
    let images: Images?
    let language: String?
    let typeAttributes:typeAttributes?
    enum CodingKeys: String, CodingKey {
        case id, title, description, source
        case sourceID = "sourceId"
        case version, publishedAt, readablePublishedAt, updatedAt, readableUpdatedAt, type, active, draft, images, language, typeAttributes
    }
    
    var readableTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy, hh:mm:ss a zzz"
        
        let date = formatter.date(from: readablePublishedAt ?? "") ?? Date()
        return date.timeAgoDisplay()
    }
}
struct typeAttributes: Codable, Hashable {
    let imageLarge: String?
    let imageSmall: String?
}
extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}

// MARK: - Images
struct Images: Codable, Hashable {
    let square140: String?

    enum CodingKeys: String, CodingKey {
        case square140 = "square_140"
    }
}

typealias ItemRowModel = [ItemRowModelElement]
