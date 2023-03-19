//
//  ViewModel.swift
//  GiphyAssessment
//
//  Created by Chandra Sekhar on 11/02/23.
//

import SwiftUI



class ViewModel: ObservableObject {
     
    @Published var data: [Datum] = []
    @Published var searchData: [Datum] = []
    @Published var error: Error?
    private let urlSession: URLSession
    
    private var httpClient: HttpClientProtocol
    
    init(urlSession: URLSession = .shared, httpClient: HttpClientProtocol) {
        self.urlSession = urlSession
        self.httpClient = httpClient
    }
    
    let baseUrl = "https://api.giphy.com/v1/gifs/"
    
    // A function that makes a call to the API to get trending gifs
    func getTrendingGif(){
        guard let url = URL(string: "\(baseUrl)trending?api_key=S16Ilccn6JS1BwXTlJtCrqzSQrSosDH5&q=se&limit=25&offset=0&rating=g&lang=en") else {
            error = HttpError.badURL // Set the error if the URL is incorrect
            return
        }
        httpClient.fetch(url: url) { [weak self] (response: Result<TrendingGifModal, Error>) in
            switch response {
            case .success(let catModel):
                if let data = catModel.data {
                    self?.data = data // Set the data if the API call is successful
                }
            case .failure(let erro):
                self?.error = erro // Set the error if the API call fails
            }
        }
    }
    // A function that makes a call to the API to search for gifs based on a search term
    func searchByGif(searchName: String) {
        guard let url = URL(string: "\(baseUrl)search?api_key=S16Ilccn6JS1BwXTlJtCrqzSQrSosDH5&q=\(searchName)&limit=25&offset=0&rating=g&lang=en") else {
            error = HttpError.badURL // Set the error if the URL is incorrect
            return
        }
        httpClient.fetch(url: url) { [weak self] (response: Result<TrendingGifModal, Error>) in
            switch response {
            case .success(let catModel):
                if let data = catModel.data {
                    self?.searchData = data // Set the search data if the API call is successful
                }
            case .failure(let erro):
                self?.error = erro // Set the error if the API call fails
            }
        }
    }
}

