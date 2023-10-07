//
//  HomeInteractor.swift
//  spotspace
//
//  Created by Adil Özdemir on 4.09.2023.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func getSpots()
}

class HomeInteractor: HomeInteractorProtocol {
    
    let link = "http://localhost:8080/spots"
    
    var presenter: HomePresenterProtocol?
    
    func getSpots() {
        guard let url = URL(string: link) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let spotData = data, error == nil else {
                self?.presenter?.interactorDidFetchSpots(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let entities = try JSONDecoder().decode([Spot].self, from: spotData)
                self?.presenter?.interactorDidFetchSpots(with: .success(entities))
            } catch {
                self?.presenter?.interactorDidFetchSpots(with: .failure(FetchError.failed))
            }
        }
        task.resume()
    }
}
