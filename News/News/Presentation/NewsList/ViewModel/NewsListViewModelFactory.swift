//
//  NewsListConfigurator.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

final class NewsListViewModelFactory {

    static func createViewModel() -> NewsListViewModel {
        let useCase = ArticleListUseCaseFactory.createUseCase()
        return NewsListViewModel(useCase: useCase)
    }
}
