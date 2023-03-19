//
//  GiphyAssessmentTests.swift
//  GiphyAssessmentTests
//
//  Created by Chandra Sekhar on 12/02/23.
//

import XCTest
//@testable import GiphyAssessment


final class GiphyAssessmentTests: XCTestCase {
    
    let localFileManager = LocalFileManager.instance
    let folderName = "TestFolder"
    let imageName = "TestImage"
    let imageData = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=")!
    
    var catViewModel: ViewModel!
    let fetchCatImageExpectation = XCTestExpectation(description: "Fetched Cat Image")
    
    var urlSession: URLSession!
    var httpClient: HttpClientProtocol!
    let reqURL = URL(string: "https://api.thecatapi.com/v1/images/search")!
    
    
    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: config)
        
        httpClient = HttpClient(urlsession: urlSession)
        catViewModel = ViewModel(httpClient: HttpClient(urlsession: urlSession))
    }
    
    override func tearDown() {
        urlSession = nil
        httpClient = nil
        // Delete the image and folder after each test
        localFileManager.deleteImage(imageName: imageName, folderfName: folderName)
        try? FileManager.default.removeItem(at: localFileManager.getURLFolder(folderName: folderName)!)
        super.tearDown()
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
        httpClient.fetch(url: reqURL) { (response: Result<TrendingGifModal, Error>) in
            switch response {
            case .success(let catModel):
                XCTAssertEqual(catModel.data?.first?.url, "https://giphy.com/gifs/phoenixmercury-phoenix-mercury-diana-taurasi-dianataurasi-bSCxU4HkeT7uqQeRjf")
                XCTAssertEqual(catModel.data?.count, 1)
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
        httpClient.fetch(url: reqURL) { (response: Result<TrendingGifModal, Error>) in
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
        httpClient.fetch(url: reqURL) { (response: Result<[TrendingGifModal], Error>) in
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
        catViewModel.getTrendingGif()
        fetchCatImageExpectation.fulfill()
        wait(for: [fetchCatImageExpectation], timeout: 2)
    }
    // To test viewModel is calling search function correctly or not
    func test_searchImage_Success() {
        catViewModel.searchByGif(searchName: "sample")
        fetchCatImageExpectation.fulfill()
        wait(for: [fetchCatImageExpectation], timeout: 2)
    }
    // To test image is saving into filemanager or not
    func testSaveImage() {
        // Test saving an image
        localFileManager.saveImage(imageData: imageData, imageName: imageName, folderName: folderName)
        XCTAssertTrue(FileManager.default.fileExists(atPath: localFileManager.getURLForImage(imageName: imageName, folderName: folderName)!.path))
    }
    // To test image is loading from fileManager or not
    func testLoadImage() {
        // Test loading an image
        localFileManager.saveImage(imageData: imageData, imageName: imageName, folderName: folderName)
        let loadedImagePath = localFileManager.loadImage(imageName: imageName, folderfName: folderName)
        XCTAssertNotNil(loadedImagePath)
        XCTAssertEqual(loadedImagePath, localFileManager.getURLForImage(imageName: imageName, folderName: folderName)!.path)
    }
        //Test image is deleting from fileManager or not
    func testDeleteImage() {
        // Test deleting an image
        localFileManager.saveImage(imageData: imageData, imageName: imageName, folderName: folderName)
        localFileManager.deleteImage(imageName: imageName, folderfName: folderName)
        XCTAssertFalse(FileManager.default.fileExists(atPath: localFileManager.getURLForImage(imageName: imageName, folderName: folderName)!.path))
    }
    //Test getting all files from the folder or not
    func testGetFolderDetails() {
        // Test getting folder details
        localFileManager.saveImage(imageData: imageData, imageName: imageName, folderName: folderName)
        let folderDetails = localFileManager.getFolderDetails(folderName: folderName)
        XCTAssertNotNil(folderDetails)
        XCTAssertEqual(folderDetails?.count, 1)
        XCTAssertEqual(folderDetails?.first, localFileManager.getURLForImage(imageName: imageName, folderName: folderName))
    }
}

 
