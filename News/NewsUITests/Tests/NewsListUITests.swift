//
//  NewsUITests.swift
//  NewsUITests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest

final class NewsListUITests: XCTestCase {

    let newsListPage = NewsListPage()
    let newsCellViewPage = NewsCellViewPage()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testNewsListView() throws {
        App.launch(argument: AppLaunchArgument.newsListSuccess.rawValue)
        _ = waitForElementToAppear(newsListPage.firstCell)
        XCTAssert(newsListPage.cells.count == 3)
        newsCellViewPage.shouldSeeDetails()
        newsListPage.selectFirstCell()
        newsListPage.shouldSeeNewsDetailsPage()
    }

    func testNewsListViewForFailureResponse() throws {
        App.removeArgument(argument: AppLaunchArgument.newsListSuccess.rawValue)
        App.launch(argument: AppLaunchArgument.newsListFailure.rawValue)
        _ = waitForElementToAppear(newsListPage.errorViewTitle)
        XCTAssertFalse(newsListPage.tableView.exists)
        newsListPage.shouldSeeErrorView()
    }

    func waitForElementToAppear(_ element: XCUIElement, 
                                maxDuration: Double = 5,
                                failIfNotAppeared: Bool = true) -> Bool {

        if element.exists {
            return true
        }
        let predicate = NSPredicate { _, _ in
            element.exists && element.isHittable
        }
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [ expectation ], timeout: maxDuration)
        let isExists = result == .completed

        if !isExists && failIfNotAppeared {
            XCTFail("Timed out waiting for element: \(element) to appear.")
        }
        return isExists
    }
}
