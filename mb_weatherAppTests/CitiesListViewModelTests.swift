//
//  CitiesListViewModelTests.swift
//  mb_weatherAppTests
//
//  Created by Michał Bagrowski on 13/07/2023.
//

import XCTest
import RxSwift
import RxCocoa
@testable import mb_weatherApp

// TODO: add more tests
final class CitiesListViewModelTests: XCTestCase {
    var viewModel: DefaultCitiesListViewModel!
    var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()
        viewModel = DefaultCitiesListViewModel(apiKey: "YOUR_API_KEY")
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        viewModel = nil
        disposeBag = nil
        super.tearDown()
    }

    func testCityNameForValidIndexAndNotLast() {
        // Given
        let index = 0
        let forLast = false
        let expectedCityName = "New York"
        viewModel.allCitiesNames.accept(["New York", "Los Angeles", "Chicago"])

        let cityName = viewModel.cityName(for: index, forLast: forLast)

        XCTAssertEqual(cityName, expectedCityName)
    }

    func testDataCountForNotLast() {
        let forLast = false
        viewModel.isSearching = true
        viewModel.filteredCitiesNames.accept(["New York", "Los Angeles", "Chicago"])

        let dataCount = viewModel.dataCount(forLast: forLast)

        XCTAssertEqual(dataCount, 3)
    }
    
    func testHandleSelectedCityIndex() {
        let index = 1
        let forLast = false
        let cities = ["New York", "Los Angeles", "Chicago"]
        let expectedCityName = "Los Angeles"
        var startDetailsScreenCalled = false
        let coordinatorOutput = DefaultCitiesListViewModel.CoordinatorOutput(startDetailsScreen: Action { model in
            startDetailsScreenCalled = true
            XCTAssertEqual(model.cityName, expectedCityName)
        })
        let viewModel = DefaultCitiesListViewModel(apiKey: "your_api_key", actions: coordinatorOutput)
        viewModel.allCitiesNames.accept(cities)
        viewModel.selectCityIndex(index, forLast: forLast)

        XCTAssertTrue(startDetailsScreenCalled)
        XCTAssertTrue(AppData.lastSelectedCitiesNames.contains(expectedCityName))
    }
}
