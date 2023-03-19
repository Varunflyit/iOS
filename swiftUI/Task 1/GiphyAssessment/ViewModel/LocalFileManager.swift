//
//  LocalFileManager.swift
//  GiphyAssessment
//
//  Created by Chandra Sekhar on 12/02/23.
//

import Foundation


class LocalFileManager {
    static let instance = LocalFileManager()
    private init(){ }

    // Function to save image data to local storage.
    func saveImage(imageData: Data, imageName: String, folderName: String) {
        // Create folder in local storage if it doesn't already exist.
        createFolderIfNeeded(folderName: folderName)
        // Get URL for image.
        guard let url = getURLForImage(imageName: imageName, folderName: folderName) else { return }
        // Try writing image data to URL.
        do {
            try imageData.write(to: url)
            print("Image saved successfully")
        } catch {
            print("Error saving image: \(error.localizedDescription)")
        }
    }
    // Function to get details of a folder in local storage.
    func getFolderDetails(folderName: String) -> [URL]? {
        // Get URL for folder.
        guard let folerUrl = getURLFolder(folderName: folderName) else{ return nil}
        // Try getting contents of directory at folder URL.
        let fileURLs = try? FileManager.default.contentsOfDirectory(at: folerUrl, includingPropertiesForKeys: nil)
        return fileURLs
    }
    // Private function to create a folder in local storage if it doesn't already exist.
    private func createFolderIfNeeded(folderName: String){
        // Get URL for folder.
        guard let url = getURLFolder(folderName: folderName) else{ return}
        // Check if folder already exists.
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                // Try creating the folder.
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            }catch{
                print("Error creating direcotry at \(folderName). \(error)")
            }
        }
    }
    // Private function to get URL for a folder in local storage.
     func getURLFolder(folderName: String) -> URL? {
        // Get caches directory URL.
        guard let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first  else{
            return nil
        }
        // Return URL for folder by appending folder name to caches directory URL.
        return directory.appendingPathComponent(folderName)
    }
    // Private function to get URL for a folder in local storage.
     func getURLForImage(imageName: String, folderName: String) -> URL? {
        // Get caches directory URL.
        guard let folerUrl = getURLFolder(folderName: folderName) else{ return nil}
        // Return URL for folder by appending folder name to caches directory URL.
        return folerUrl.appendingPathComponent(imageName + ".gif")
    }
    // Function to load an image from local storage.
    func loadImage(imageName: String, folderfName: String) -> String? {
        // Get URL for folder.
        guard let url = getURLForImage(imageName: imageName, folderName: folderfName),
              FileManager.default.fileExists(atPath: url.path)
        else{
            return nil
        }
        // Return URL for image by appending image name to folder URL.
        return url.path
    }
    // Function to delete an image from local storage.
    func deleteImage(imageName: String, folderfName: String) {
        guard let url = getURLForImage(imageName: imageName, folderName: folderfName),
              FileManager.default.fileExists(atPath: url.path)
        else{
            return
        }
        do {
            try FileManager.default.removeItem(at: url)
            print("Image deleted successfully")
        } catch {
            print("Error deleting image: \(error.localizedDescription)")
        }
    }
}
