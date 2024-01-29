//
//  NewsDetailsConfigurator.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

final class NewsDetailsViewModelFactory {

    static func configureNewsDetailsViewModel(with article: Article) -> NewsDetailsViewModel {
        return  NewsDetailsViewModel(article: article)
    }
}
