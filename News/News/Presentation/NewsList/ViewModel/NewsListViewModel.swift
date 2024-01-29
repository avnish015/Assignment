//
//  NewsListViewModel.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation
import PromiseKit

internal enum NewsListState: Equatable {
    case loading
    case loaded
    case failed(String)
}

final class NewsListViewModel: ObservableObject {

    private let useCase: ArticleListUseCaseProtocol

    @Published var articleList: [Article] = []
    @Published var newsState: NewsListState = .loading

    var isEmpty: Bool {
        return articleList.isEmpty
    }

    init(useCase: ArticleListUseCaseProtocol) {
        self.useCase = useCase
    }

    func refreshArticleList(showLoading: Bool) {
        if showLoading {
            newsState = .loading
        }
        let resource = ArticleResource(endPoint: .topHeadlines)
        useCase.fetchArticleList(resource: resource)
            .map({PresentationArticleListMapper.toModel($0)})
            .done(on: .main) { articles in
                self.newsState = .loaded
                self.articleList = articles
            }
            .catch { error in
                self.newsState = .failed(self.errorMessage(error: error))
                self.articleList = []
            }
    }

    func createNewsDetailsViewModel(for article: Article) -> NewsDetailsViewModel {
        NewsDetailsViewModel(article: article)
    }

    func createArticleCellViewModel(for article: Article) -> ArticleCellViewModel {
        ArticleCellViewModel(article: article)
    }

    private func errorMessage(error: Error) -> String {
        if let error = error as? HTTPError {
            return error.description
        } else {
            return error.localizedDescription
        }
    }
}
