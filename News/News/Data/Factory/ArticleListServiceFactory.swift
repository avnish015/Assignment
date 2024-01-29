//
//  ArticleListServiceFactory.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

enum ArticleListServiceFactory {

    static func createService() -> ArticleListServiceProtocol {
        let authenticator = URLSessionTrustEvaluator()
        let urlSession = URLSession(configuration: .default, delegate: authenticator, delegateQueue: nil)
        let apiClient = URLSessionApiClient(session: urlSession)
        return ArticleListService(apiClient: apiClient)
    }
}
