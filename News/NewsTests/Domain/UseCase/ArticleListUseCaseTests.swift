//
//  ArticleListUseCaseTests.swift
//  NewsTests
//
//  Created by Avnish Kumar on 17/01/24.
//

import XCTest
@testable import News

final class ArticleListUseCaseTests: XCTestCase {

    func testArticleListUseCaseSuccess() throws {
        let expectation = expectation(description: "ArticleListSuccess")
        let repostory = ArticleListRepository(service: ArticleListService(apiClient: MockApiClient()))
        let useCase = ArticleListUseCase(repository: repostory)
        var articleList: [ArticleDomainModel] = []
        var theError: Error?

        useCase.fetchArticleList(resource: MockNewsListResource(resourceName: .newsList))
            .done { list in
                articleList = list
                expectation.fulfill()
            }.catch { error in
                theError = error
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 10)
        XCTAssertNil(theError)
        XCTAssertFalse(articleList.isEmpty)
        let article = try XCTUnwrap(articleList.first)
        XCTAssertEqual(article.description, "Ved Cybertrucks lancering måtte Elon Musk vise forvirrede nye ejere, hvordan man kommer ind i bilen.")
        XCTAssertEqual(article.title, "Dørhåndtag på Teslas hypede Cybertruck vækker forundring")
        XCTAssertEqual(article.description,  "Ved Cybertrucks lancering måtte Elon Musk vise forvirrede nye ejere, hvordan man kommer ind i bilen.")
        XCTAssertEqual(article.urlToImage,  "https://politiken.dk/incoming/img9650183.1q0x7q/ALTERNATES/p16x9_960/FILE%20PHOTO%20Tesla%20store%20shows%20new%20Cybertruck%20in%20California")
        XCTAssertEqual(article.url,  "https://politiken.dk/indland/forbrug/biler/art9650166/D%C3%B8rh%C3%A5ndtag-p%C3%A5-Teslas-hypede-Cybertruck-v%C3%A6kker-forundring")
        XCTAssertEqual(article.publishedAt, "2023-12-05T05:30:16Z")
    }

    func testArticleListUseCaseFailure() throws {
        let expectation = expectation(description: "ArticleListFailure")
        let useCase = ArticleListUseCase(repository: ArticleListRepository(service: ArticleListService(apiClient: MockApiClient())))
        var theError: Error?

        useCase.fetchArticleList(resource: MockNewsListResource(resourceName: .newsListNoResponse))
            .done { _ in
                expectation.fulfill()
            }.catch { error in
                theError = error
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(theError)
    }
}
