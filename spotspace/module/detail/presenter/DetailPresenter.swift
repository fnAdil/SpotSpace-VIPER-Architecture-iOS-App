//
//  DetailPresenter.swift
//  spotspace
//
//  Created by Adil Özdemir on 5.09.2023.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var view:DetailViewProtocol? { get set }
    var interactor: DetailInteractorProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
}

class DetailPresenter: DetailPresenterProtocol {
    
    var view: DetailViewProtocol?
    
    var interactor: DetailInteractorProtocol?
    
    var router: DetailRouterProtocol?
    
}
