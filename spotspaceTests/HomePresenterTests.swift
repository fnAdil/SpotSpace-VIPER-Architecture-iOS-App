//
//  HomePresenterTests.swift
//  spotspaceTests
//
//  Created by Adil Özdemir on 9.09.2023.
//

import XCTest
@testable import spotspace

final class HomePresenterTests: XCTestCase {
    var view = HomeViewControllerMock()
    var interactor = HomeInteractorMock()
    var presenter: HomePresenterProtocol!
    
    override func setUp() {
        presenter = HomePresenter()
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
    
    func testFetchAllSpotsSuccessfully() {
        interactor.returnSuccess()
        XCTAssertTrue(self.view.isFetchedSuccessfully)
    }
    
    func testFetchAllSpotsWithError() {
        interactor.returnError()
        XCTAssertTrue(self.view.isFetchedWithError)
    }


}

class HomeViewControllerMock: HomeViewProtocol {
    var presenter: spotspace.HomePresenterProtocol?
    var isFetchedWithError = false
    var isFetchedSuccessfully = false
    
    func update(with spot: [spotspace.Spot]) {
        isFetchedSuccessfully = true
    }
    
    func update(with error: String) {
        isFetchedWithError = true
    }
}

class HomeInteractorMock: HomeInteractorProtocol {
    var presenter: spotspace.HomePresenterProtocol?
    var result: Result<[Spot], Error>!
    func getSpots() {
        presenter?.interactorDidFetchSpots(with: result)
    }
    
    func returnError() {
        result = .failure(FetchError.failed)
        getSpots()
    }
    func returnSuccess() {
        result = .success([])
        getSpots()
    }
}
