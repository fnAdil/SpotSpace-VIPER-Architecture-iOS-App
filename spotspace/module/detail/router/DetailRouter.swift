//
//  DetailRouter.swift
//  spotspace
//
//  Created by Adil Özdemir on 5.09.2023.
//

import Foundation
import UIKit

typealias DetailEntry = DetailViewProtocol & UIViewController

protocol DetailRouterProtocol: AnyObject {
    var entryPoint: DetailEntry? { get }
    static func prepare(with spot: Spot, delegate: SpotTableDelegate) -> DetailRouterProtocol
}

class DetailRouter: DetailRouterProtocol {
    var entryPoint: DetailEntry?
    
    static func prepare(with spot: Spot, delegate: SpotTableDelegate) -> DetailRouterProtocol {
        let router = DetailRouter()
        
        let view: DetailViewProtocol = DetailViewController()
        let interactor: DetailInteractorProtocol = DetailInteractor()
        let presenter: DetailPresenterProtocol = DetailPresenter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entryPoint = view as? DetailEntry
        
        return router
    }
}
