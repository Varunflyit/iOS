//
//  HttpClient.swift
//  GiphyAssessment
//
//  Created by Chandra Sekhar on 12/02/23.
//

import Foundation


enum HttpError: Error {
    case badURL, badResponse, errorDecodingData, invalidURL
}
// Protocol defining the behavior of a HTTP client
protocol HttpClientProtocol {
    func fetch<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

class HttpClient: HttpClientProtocol {
    
    // MARK: Properties
    // URLSession to be used for making the network requests
    private var urlSession: URLSession
    
    // MARK: Init
    // Initializes the HttpClient with the given URL session
    init(urlsession: URLSession) {
        self.urlSession = urlsession
    }
    
    // MARK: Public Func
    // Makes a network request to fetch the Codable object of type Generics, to handle all models
    func fetch<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        
        self.urlSession.dataTask(with: url, completionHandler: { data, response, error in
            // Checking if the response is successful (status code 200)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                completion(.failure(HttpError.badResponse))
                return
            }
            // Checking if the data was received and can be decoded to the given type T
            guard let data = data,
                  let object = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(HttpError.errorDecodingData))
                return
            }
            // If everything is successful, return the decoded object of type T
            completion(.success(object))
        })
        .resume()
    }
}
