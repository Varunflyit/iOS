//
//  GiphyAssessment_Task2Tests.swift
//  GiphyAssessment_Task2Tests
//
//  Created by Chandra Sekhar on 06/03/23.
//

import XCTest

final class GiphyAssessment_Task2Tests: XCTestCase {

    var viewModel: NewsFeedViewModel!
    let fetchCatImageExpectation = XCTestExpectation(description: "Fetched Cat Image")
    
    var urlSession: URLSession!
    var httpClient: HttpClientProtocol!
    let reqURL = URL(string: "https://api.thecatapi.com/v1/images/search")!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: config)
        httpClient = HttpClient(urlsession: urlSession)
        viewModel = NewsFeedViewModel(httpClient: HttpClient(urlsession: urlSession))
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        urlSession = nil
        httpClient = nil
    }


    // To test if the fetch function returns a successful result with a HTTP status code of 200 and correct data.
    func test_mock_response_success() throws {
        // Set up a successful HTTP response
        let response = HTTPURLResponse(url: reqURL,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: ["Content-Type": "application/json"])!
        // Set the request handler to return the successful response and mock data
        let mockData: Data = Data(mockString.utf8)
        MockURLProtocol.requestHandler = { request in
            return (response, mockData)
        }
        // Create an expectation for the response
        let expectation = XCTestExpectation(description: "response")
        httpClient.fetch(url: reqURL) { (response: Result<ItemRowModel, Error>) in
            switch response {
            case .success(let model):
                XCTAssertEqual(model.first?.title ?? "", "TD Bank customer out $480 after e-transfer cancelled — despite having autodeposit")
                XCTAssertEqual(model.count, 2)
                // Fulfill the expectation
                expectation.fulfill()
            case .failure(let failure):
                XCTAssertThrowsError(failure)
            }
        }
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 2)
    }
    // To test if the fetch function returns a failure result with a HTTP status code of 400.
    func test_mock_response_Bad_response() throws {
        // Set up a unsuccessful HTTP response
        let response = HTTPURLResponse(url: reqURL,
                                       statusCode: 400,
                                       httpVersion: nil,
                                       headerFields: ["Content-Type": "application/json"])!
        // Set the request handler to return the unsuccessful response and mock data
        let mockData: Data = Data(mockString.utf8)
        MockURLProtocol.requestHandler = { request in
            return (response, mockData)
        }
        // Create an expectation for the response
        let expectation = XCTestExpectation(description: "response")
        httpClient.fetch(url: reqURL) { (response: Result<ItemRowModel, Error>) in
            switch response {
            case .success:
                XCTAssertThrowsError("Fatal Error")
            case .failure(let error):
                XCTAssertEqual(HttpError.badResponse, error as? HttpError)
                // Fulfill the expectation
                expectation.fulfill()
            }
        }
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 2)
    }
    // To test if the fetch function returns a failure result when there is an error decoding the data.
    func test_mockReponse_encoding_error() {
        // Set up a unsuccessful HTTP response
        let response = HTTPURLResponse(url: reqURL,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: ["Content-Type": "application/json"])!
        // Set the request handler to return the unsuccessful response and mock data
        let mockData: Data = Data(mockString.utf8)
        
        MockURLProtocol.requestHandler = { request in
            return (response, mockData)
        }
        // Create an expectation for the response
        let expectation = XCTestExpectation(description: "response")
        httpClient.fetch(url: reqURL) { (response: Result<[ItemRowModel], Error>) in
            switch response {
            case .success:
                XCTAssertThrowsError("Fatal Error")
            case .failure(let error):
                XCTAssertEqual(HttpError.errorDecodingData, error as? HttpError)
                // Fulfill the expectation
                expectation.fulfill()
            }
        }
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 2)
    }
    // To test ViewModel is calling trendingImage function correctly or not
    func test_trendingImage_Success() {
        viewModel.getLatestnews()
        fetchCatImageExpectation.fulfill()
        wait(for: [fetchCatImageExpectation], timeout: 2)
    }
    // To test ViewModels filter function saving items or not
    func test_filterFunction(){
        let mockData: Data = Data(mockString.utf8)
        do {
            let encoder = try JSONDecoder().decode(ItemRowModel.self, from: mockData)
            XCTAssertEqual(encoder.first?.title ?? "", "TD Bank customer out $480 after e-transfer cancelled — despite having autodeposit")
            viewModel.items = encoder
            viewModel.filterTheresult(filtertype: "video")
            //viewModel.filterItems = encoder
            XCTAssertEqual(viewModel.filterItems.count, 1)
        }catch {
            XCTAssertThrowsError(error)
        }
    }
    
    func test_saveOfflineData() {
        // create a test model
        let mockData: Data = Data(mockString.utf8)
        
        let model = try? JSONDecoder().decode(ItemRowModel.self, from: mockData)
        
        // Get the URL for the file where we saved the data
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("mydata")
        
        // save the model to file
        //viewModel.saveOfflineData(model: model ?? [])
        try? mockData.write(to: fileURL)
        
        
        // check if the file exists
        XCTAssertTrue(FileManager.default.fileExists(atPath: fileURL.path))
        
        // read the data from the file
        let jsonData = try? Data(contentsOf: fileURL)
        XCTAssertNotNil(jsonData)
        
        // decode the data into a model
        let decodedModel = try? JSONDecoder().decode(ItemRowModel.self, from: jsonData!)
        XCTAssertNotNil(decodedModel)
        
        // check if the saved model is equal to the original model
        XCTAssertEqual(decodedModel, model)
    }
}
