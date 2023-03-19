//
//  FavView.swift
//  GiphyAssessment
//
//  Created by Chandra Sekhar on 10/02/23.
//

import SwiftUI
import SDWebImageSwiftUI


struct FavView: View {
    //Properties
    @State private var selectedSegment = 0 //: A state variable to keep track of the selected segment in the picker. Default value is 0.
    @ObservedObject var dataModel: DataModel
    private let fileManager = LocalFileManager.instance
    private let imageFolder = "fav_images"
    
    private var column: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: selectedSegment == 0 ? 3 : 1)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Picker("", selection: $selectedSegment) {
                Text("Grid").tag(0)
                Text("List").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            // if selectedSegment == 0: An if statement that checks if the first segment (Grid) is selected.
            //            if selectedSegment == 0 {
            //                FavGridView(dataModel: dataModel)
            //            } else {
            //                FavListView(dataModel: dataModel)
            //            }
            //            Spacer()
            ScrollView {
                LazyVGrid(columns: column, alignment: .center, spacing: 8) {
                    ForEach(dataModel.fileURLs, id: \.self) { item in
                        ZStack(alignment: .topTrailing) {
                            ZStack(alignment: .bottom){
                                Rectangle()
                                    .aspectRatio(1, contentMode: .fill)
                                    .frame(height: selectedSegment == 0 ? 100 : 200)
                                    .overlay {
                                        WebImage(url: item)
                                            .resizable()
                                            .scaledToFill()
                                    }.clipped()
                            }
                            Button(action: {
                                print("button tapped")
                                let url = item.deletingPathExtension().lastPathComponent
                                fileManager.deleteImage(imageName: url, folderfName: imageFolder)
                                dataModel.fileURLs = fileManager.getFolderDetails(folderName: imageFolder)!
                            }) {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .foregroundColor(.yellow)
                                
                            }
                            .frame(width: 20, height: 20)
                            .padding()
                        }
                    }
                }
            }.padding()
        }.onAppear{
            if let folder =  fileManager.getFolderDetails(folderName: imageFolder) {
                dataModel.fileURLs = folder
            }
        }
    }
}

struct FavView_Previews: PreviewProvider {
    static var previews: some View {
        FavView(dataModel: .init())
    }
}
