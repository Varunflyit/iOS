//
//  ItemRow.swift
//  GiphyAssessment_Task2
//
//  Created by Chandra Sekhar on 06/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemRow: View {
    var item: ItemRowModelElement
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            WebImage(url: URL(string: item.typeAttributes?.imageLarge ?? ""))
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .clipShape(Rectangle())
            Text(item.title ?? "")
                .font(.title3)
            Text("\(item.readableTime)")
                .foregroundColor(.secondary)
                .font(.caption)
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: ItemRowModelElement(id: 0, title: "1", description: "1", source: "1", sourceID: "1", version: "1", publishedAt: 1, readablePublishedAt: "2", updatedAt: 1, readableUpdatedAt: "2", type: "2", active: false, draft: false, images: Images(square140: "sd"), language: "2", typeAttributes: typeAttributes(imageLarge: "", imageSmall: "")))
    }
}
