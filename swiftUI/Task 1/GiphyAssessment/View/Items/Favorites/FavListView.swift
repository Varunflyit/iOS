//
//  FavListView.swift
//  GiphyAssessment
//
//  Created by Chandra Sekhar on 10/02/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavListView: View {
    @ObservedObject var dataModel: DataModel
    
    @State var gridLayout: [GridItem] = [ GridItem() ]
    private let fileManager = LocalFileManager.instance
    private let imageFolder = "fav_images"
    
    var body: some View {
        // Your list view content here
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(dataModel.fileURLs, id: \.self) { imageName in
                    ZStack {
                        WebImage(url: imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipShape(Rectangle())
                        Button(action: {
                            print("button tapped")
                            let url = imageName.deletingPathExtension().lastPathComponent
                            fileManager.deleteImage(imageName: url, folderfName: imageFolder)
                            dataModel.fileURLs = fileManager.getFolderDetails(folderName: imageFolder)!
                        }) {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(.yellow)
                        }
                        .frame(width: 20, height: 20, alignment: .topTrailing)
                        .offset(x: 160, y: -65)
                    }.frame(height: 200)
                }
            }
            .padding([.leading,.trailing], 16)
        }.onAppear{
            if let folder =  fileManager.getFolderDetails(folderName: imageFolder) {
                dataModel.fileURLs = folder
            }
        }
    }
}

struct FavListView_Previews: PreviewProvider {
    static var previews: some View {
        FavListView(dataModel: .init())
    }
}
