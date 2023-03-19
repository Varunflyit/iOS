//
//  ImageRow.swift
//  GiphyAssessment
//
//  Created by Chandra Sekhar on 10/02/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageRow: View {
    let imageName: String
    @Binding var favorites: [String]
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: imageName))
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .clipShape(Rectangle())
            
            Button(action: {
                if self.favorites.contains(imageName) {
                    self.favorites.removeAll { $0 == imageName }
                }else{
                    self.favorites.append(imageName)
                }
                UserDefaults.standard.set(self.favorites, forKey: "FavGif's")
            }) {
                if self.favorites.contains(imageName) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "heart")
                        .resizable()
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 25, height: 25, alignment: .topTrailing)
            .offset(x: 160, y: -65)
        }.listRowSeparator(.hidden)
            .frame(height: 200)
    }
}

struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        ImageRow(imageName: "sampl", favorites: .constant(["sampl"]))
            .previewLayout(.sizeThatFits)
    }
}
