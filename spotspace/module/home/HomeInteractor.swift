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
    func updateFavourite(with spot: Spot)
}

class HomeInteractor: HomeInteractorProtocol {
    
    let getSpotsUrl = "http://localhost:8080/spots/getAll"
    let updateFavouriteUrl = "http://localhost:8080/spots"
    
    var presenter: HomePresenterProtocol?
    
    func getSpots() {
        guard let url = URL(string: getSpotsUrl) else { return }
        
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
    
    func updateFavourite(with spot: Spot) {
        guard let url = URL(string: updateFavouriteUrl) else { return }
        
        guard let jsonData = try? JSONEncoder().encode(spot) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let spotData = data, error == nil else {
                self?.presenter?.interactorDidFetchFavourite(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let spot = try JSONDecoder().decode(Spot.self, from: spotData)
                self?.presenter?.interactorDidFetchFavourite(with: .success(spot))
            } catch {
                self?.presenter?.interactorDidFetchFavourite(with: .failure(FetchError.failed))
            }
        }
        task.resume()
    }
}
