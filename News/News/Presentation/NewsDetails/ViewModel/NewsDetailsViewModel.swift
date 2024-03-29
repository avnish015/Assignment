//
//  NewsDetailsViewModel.swift
//  News
//
//  Created by Avnish Kumar on 03/01/24.
//

import Foundation

final class NewsDetailsViewModel: ObservableObject {

    let imageURL: URL?
    let title: String
    let description: String
    let author: String
    let publishedAt: String

    init(article: Article) {
        self.imageURL = article.imageURL
        self.title = article.title
        self.description = article.description ?? .empty
        self.author = article.author ?? DisplayStrings.Other.unknownSource
        self.publishedAt = article.publishedAt.formattedDate()?.string() ?? .empty
    }
}
