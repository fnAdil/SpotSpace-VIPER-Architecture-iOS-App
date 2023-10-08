//
//  DetailInteractor.swift
//  spotspace
//
//  Created by Adil Özdemir on 5.09.2023.
//

import Foundation

protocol DetailInteractorProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
}

class DetailInteractor: DetailInteractorProtocol {
    
    var presenter: DetailPresenterProtocol?
    
}
