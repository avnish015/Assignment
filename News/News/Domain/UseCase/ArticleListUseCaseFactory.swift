//
//  ArticleListUseCaseFactory.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

class ArticleListUseCaseFactory {

    static func createUseCase() -> ArticleListUseCaseProtocol {
        let repository = ArticleListRepositoryFactory.createRepository()
        return ArticleListUseCase(repository: repository)
    }
}
