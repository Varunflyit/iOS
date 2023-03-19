//
//  ContentView.swift
//  GiphyAssessment
//
//  Created by Chandra Sekhar on 10/02/23.
//

import SwiftUI

struct ContentView: View {
    // Added Bottom Tab Bar background color as white
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    // Properties
    @ObservedObject var data = DataModel()
    
    var body: some View {
        TabView {
            HomeView(dataModel: data)
                .tabItem {
                    Image(systemName: "photo.on.rectangle")
                }
            FavView(dataModel: data)
                .tabItem {
                    Image(systemName: "heart.fill")
                }
        }.background(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
