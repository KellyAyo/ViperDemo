//
//  Protocol.swift
//  viperDemo
//
//  Created by Phillip Kelly-Ayo on 29/07/2020.
//  Copyright © 2020 Phillip Kelly-Ayo. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingMovieStars()
}

protocol PresenterToViewProtocol: class {
    func showMovieStar(movieStarArray: Array<MovieStarModel>)
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> MovieStarController
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchMovieStars()
}

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(movieStarModelArray: Array<MovieStarModel>)
}
