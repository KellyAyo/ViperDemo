//
//  MovieStarRouter.swift
//  viperDemo
//
//  Created by Phillip Kelly-Ayo on 29/07/2020.
//  Copyright © 2020 Phillip Kelly-Ayo. All rights reserved.
//

import Foundation
import UIKit

class MovieStarRouter: PresenterToRouterProtocol {
    static func createModule() -> MovieStarController {
        
        let view = MovieStarController()
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = MovieStarPresenter()
        let interactor: PresenterToInteractorProtocol = MovieStarInteractor()
        let router: PresenterToRouterProtocol = MovieStarRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToMovieScreen(navigationController: UINavigationController) {
        
    }
    
    
}
