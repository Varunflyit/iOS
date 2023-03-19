//
//  ContentView.swift
//  GiphyAssessment_Task2
//
//  Created by Chandra Sekhar on 05/03/23.
//


import SwiftUI

struct ContentView: View {
    //MARK: - properties
    @StateObject var viewModel = NewsFeedViewModel(httpClient: HttpClient(urlsession: URLSession.shared))
    @State private var showingOptions = false
    @State private var filterSelected = false
    @State private var isTwoColumns = false
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body: some View {
        NavigationStack {
            // The main content of the news feed
            content
                .confirmationDialog("Choose a filter", isPresented: $showingOptions) {
                    filterOptions // The filter options dialog
                }
                .navigationTitle("CBC News Feed")
                .toolbar {
                    filterButton  // The filter button in the toolbar
                }
        }
    }
    // The main content of the news feed
    var content: some View {
        VStack{
            // The colored divider at the top of the screen
            Divider()
                .background(
                    LinearGradient(colors: [.red, .blue],
                                   startPoint: .leading,
                                   endPoint: .trailing)
                    .opacity(0.5)
                    .shadow(.drop(radius: 2,y: 2)),
                    ignoresSafeAreaEdges: .top)
            Spacer()
            HStack{
                Spacer()
                // The status of the view model (online/offline)
                Text("status: ")
                Text(viewModel.isOnline)
            }.padding()
                .foregroundColor(.secondary)
            if viewModel.items.isEmpty {
                // Show a progress view while items are loading
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                if isIpad {
                    // Show the two column toggle and the list
                    toggleView
                    if shouldShowTwoColumns {
                        twoColumnList
                    }else{
                        // Show the single list view
                        singleColumnList
                    }
                } else {
                    // Show the single list view
                    singleColumnList
                }
            }
        }
    }
    // Whether the device is an iPad in landscape mode
    var isIpad: Bool {
        horizontalSizeClass == .regular
    }
    // Whether to show the news items in two columns on iPad
    var shouldShowTwoColumns: Bool {
        isIpad && isTwoColumns
    }
    // A list of the news items in a single column
    var singleColumnList: some View {
        List {
            filteredItems
        }
    }
    // The two column toggle
    var toggleView: some View {
        HStack{
            Spacer()
            Toggle(isOn: $isTwoColumns) {
                Text("Two Columns")
            }
        }.padding()
    }
    // A list of the news items in two columns
    var twoColumnList: some View {
        List{
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                filteredItems
            }
            .padding(.horizontal, 20)
        }
    }
    // The filtered news items
    var filteredItems: some View {
        ForEach(filterSelected ? viewModel.filterItems : viewModel.items, id: \.self) { item in
            ItemRow(item: item)
        }
    }
    // The filter options
    var filterOptions: some View {
        ForEach(viewModel.filterValues, id: \.self) { value in
            Button(value) {
                viewModel.filterTheresult(filtertype: value)
                filterSelected = true
            }
        }
    }
    // The filter button
    var filterButton: some View {
        Button("Filter") {
            showingOptions = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
