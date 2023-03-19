//
//  DataModel.swift
//  GiphyAssessment
//
//  Created by Chandra Sekhar on 12/02/23.
//

import Foundation


class DataModel: ObservableObject {
    @Published var fileURLs = [URL]()
    private let fileManager = LocalFileManager.instance
    private let imageFolder = "fav_images"
    
    init() {
        if let folder =  fileManager.getFolderDetails(folderName: imageFolder) {
            fileURLs = folder
        }
    }
}
