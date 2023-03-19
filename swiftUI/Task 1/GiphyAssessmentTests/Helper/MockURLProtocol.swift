//
//  MockURLProtocol.swift
//  GiphyAssessmentTests
//
//  Created by Chandra Sekhar on 12/02/23.
//

import Foundation
import XCTest

class MockURLProtocol: URLProtocol {
    // static variable to store the request handler
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    // function to check if the URLProtocol can handle the request
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    // function to return a canonical form of the URLRequest
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    // function to start loading the request
    override func startLoading() {
        // check if a request handler is set
        guard let handler = MockURLProtocol.requestHandler else {
            XCTFail("Received unexpected request with no handler set")
            return
        }
        
        do {
            // call the request handler to get the response and data
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            // in case of an error, pass the error to the client
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    // function to stop loading the request
    override func stopLoading() {
    }
}



