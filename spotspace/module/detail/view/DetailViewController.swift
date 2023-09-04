//
//  DetailViewController.swift
//  spotspace
//
//  Created by Adil Özdemir on 5.09.2023.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol?
    
}
