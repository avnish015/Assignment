//
//  ArticleListUseCase.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation
import PromiseKit

protocol ArticleListUseCaseProtocol {
    func fetchArticleList(resource: NetworkResource) -> Promise<[ArticleDomainModel]>
}

final class ArticleListUseCase {

   private let repository: ArticleListRepositoryProtocol

    init(repository: ArticleListRepositoryProtocol) {
        self.repository = repository
    }
}

extension ArticleListUseCase: ArticleListUseCaseProtocol {

    func fetchArticleList(resource: NetworkResource) -> Promise<[ArticleDomainModel]> {
        repository.fetchArticleList(resource: resource)
    }
}
