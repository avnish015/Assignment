//
//  NewsListRouter.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation
import SwiftUI

final class NewsListRouter {

    public static func destinationForTappedArticle(article: Article) -> some View {
        let viewModel = NewsDetailsViewModelFactory.configureNewsDetailsViewModel(with: article)
        return NewsDetailsView(viewModel: viewModel)
    }
}
