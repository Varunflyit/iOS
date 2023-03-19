//
//  NewsFeedViewModel.swift
//  GiphyAssessment_Task2
//
//  Created by Chandra Sekhar on 06/03/23.
//

import Foundation
import Network

class NewsFeedViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var items: ItemRowModel = []
    @Published var offlineItems: ItemRowModel = []
    @Published var filterItems: ItemRowModel = []
    @Published var filterValues: [String] = []
    @Published var error: Error?
    @Published var isOnline: String = "Online"
    
    private let urlSession: URLSession
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    
    private var httpClient: HttpClientProtocol
    
    init(urlSession: URLSession = .shared, httpClient: HttpClientProtocol) {
        self.urlSession = urlSession
        self.httpClient = httpClient
        
        monitor.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                print("Online")
                DispatchQueue.main.async {
                    self?.isOnline = "Online"
                }
                self?.getLatestnews()
            } else {
                print("Offline")
                DispatchQueue.main.async {
                    self?.isOnline = "Offline"
                }
                self?.getOfflineData()
            }
        }
        monitor.start(queue: queue)
    }
    
    let baseUrl = "https://www.cbc.ca/aggregate_api/v1/items"
    
    // A function that makes a call to the API to get latest feeds
    func getLatestnews(){
        guard let url = URL(string: "\(baseUrl)?lineupSlug=news&categorySet=cbc-news-apps&typeSet=cbc-news-apps-feed-v2&excludedCategorySet=cbc-news-apps-exclude&page=1&pageSize=20") else {
            error = HttpError.badURL // Set the error if the URL is incorrect
            return
        }
        httpClient.fetch(url: url) { [weak self] (response: Result<[ItemRowModelElement], Error>) in
            DispatchQueue.main.async {
                switch response {
                case .success(let catModel):
                    self?.items = catModel // Set the data if the API call is successful
                    self?.filterValues = catModel.map{$0.type ?? ""}.removingDuplicates()
                    self?.filterValues.append("All")
                    self?.saveOfflineData(model: catModel)
                case .failure(let erro):
                    self?.error = erro // Set the error if the API call fails
                }
            }
        }
    }
    // this function will filter of the type
    func filterTheresult(filtertype: String){
        if filtertype == "All" {
            filterItems = items
        }else {
            let data = items.filter{$0.type == filtertype }
            filterItems = data
        }
    }
    // Saving the response into offline mode
    func saveOfflineData(model: ItemRowModel){
        // Get the URL for the file where you want to save the data
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("mydata")
        
        // Encode the models to JSON data
        let jsonData = try? JSONEncoder().encode(model)
        
        // Write the data to the file
        try? jsonData?.write(to: fileURL)
    }
    //fetching the offline records when user is in offline
    func getOfflineData(){
        // Get the URL for the file where the data is saved
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("mydata")
        
        // Read the data from the file
        guard let jsonData = try? Data(contentsOf: fileURL) else { return}
        
        // Decode the data to an array of models
        let models = try? JSONDecoder().decode(ItemRowModel.self, from: jsonData)
        DispatchQueue.main.async {
            guard let model = models else {return}
            self.items = model
            self.filterValues = model.map{$0.type ?? ""}.removingDuplicates()
            self.filterValues.append("All")
        }
    }
}
