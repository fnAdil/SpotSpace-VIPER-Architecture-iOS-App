//
//  HomeRouter.swift
//  spotspace
//
//  Created by Adil Özdemir on 4.09.2023.
//

import Foundation
import UIKit

typealias EntryPoint = HomeViewProtocol & UIViewController
typealias SpotList = UIViewController & SpotCollectionViewDelegate

protocol HomeRouterProtocol: AnyObject {
    var entry: EntryPoint? { get }
    static func start() -> HomeRouterProtocol
    func navigate(with spot: Spot, rootviewController: SpotList)
}

class HomeRouter: HomeRouterProtocol {
    
    var entry: EntryPoint?
    
    static func start() -> HomeRouterProtocol {
        let router = HomeRouter()
        
        let view: HomeViewProtocol = HomeViewController()
        let interactor: HomeInteractorProtocol = HomeInteractor()
        let presenter: HomePresenterProtocol = HomePresenter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    func navigate(with spot: Spot, rootviewController: SpotList) {
        
    }
}

