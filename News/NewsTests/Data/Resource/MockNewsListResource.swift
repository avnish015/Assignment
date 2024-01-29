//
//  MockResource.swift
//  NewsTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import Foundation
@testable import News

final class MockNewsListResource: NetworkResource, MockResource {

    let endPoint: Endpoint = Endpoint.topHeadlines
    let method: News.HTTPMethod = .GET
    let body: Data? = nil
    let queryParameters: [String: Any]? = nil
    let resourceName: BundleResource.ResourceName

    init(resourceName: BundleResource.ResourceName) {
        self.resourceName = resourceName
    }

    func validateResponse(data: Data?, response: URLResponse?) -> Result<Data, News.HTTPError> {
        if let data = data {
            return .success(data)
        } else {
            return .failure(.noResponse)
        }
    }

    func response<T>(type: T.Type, data: Data?, response: URLResponse?) -> Result<T, News.HTTPError> where T : Decodable {
        if let data = data {
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(T.self, from: data)
                return .success(response)
            } catch {
                return .failure(.decodingError)
            }
        }
        return .failure(.other)
    }
}
