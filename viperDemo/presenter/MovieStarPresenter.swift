//
//  MovieStarPresenter.swift
//  viperDemo
//
//  Created by Phillip Kelly-Ayo on 29/07/2020.
//  Copyright © 2020 Phillip Kelly-Ayo. All rights reserved.
//

import Foundation
import UIKit

class MovieStarPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingMovieStars() {
        interactor?.fetchMovieStars()
    }
}

extension MovieStarPresenter: InteractorToPresenterProtocol {
    func noticeFetchedSuccess(movieStarModelArray: Array<MovieStarModel>) {
        view?.showMovieStar(movieStarArray: movieStarModelArray)
    }
}
