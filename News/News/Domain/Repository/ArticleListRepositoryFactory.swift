//
//  ArticleListRepositoryFactory.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

enum ArticleListRepositoryFactory {

    static func createRepository() -> ArticleListRepositoryProtocol {
        let service = ArticleListServiceFactory.createService()
        return ArticleListRepository(service: service)
    }
}
