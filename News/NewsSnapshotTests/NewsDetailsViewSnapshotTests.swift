//
//  NewsDetailsViewSnapshotTests.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import SnapshotTesting
import XCTest
@testable import News

final class NewsDetailsViewSnapshotTests: XCTestCase {

    private var newsDetailsView: NewsDetailsView!

    override func setUp() {

        let article = Article(id: UUID().uuidString,
                              author: "David Henderson",
                              title: "An EV Canary in the Coal Mine?",
                              description: "I’ve written before about why I think California is the canary in the coal mine.", url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                              urlToImage: "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg",
                              publishedAt: "2023-12-04T18:46:48Z")
        let viewModel = NewsDetailsViewModel(article: article)
        newsDetailsView = NewsDetailsView(viewModel: viewModel)
    }

    func testNewsDetailsView() {

        assertSnapshot(of: newsDetailsView.frame(width: UIScreen.main.bounds.width,
                                                 height: UIScreen.main.bounds.height),
                                                 as: .image)
    }
}
