//
//  MovieStarInteractor.swift
//  viperDemo
//
//  Created by Phillip Kelly-Ayo on 29/07/2020.
//  Copyright © 2020 Phillip Kelly-Ayo. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class MovieStarInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    private let validation = ValidationService()
    
//    init(validation: ValidationService) {
//        self.validation = validation
//    }
    
    private let db = Firestore.firestore()
    private var movieStars: [MovieStarModel] = []
    
    func fetchMovieStars() {
        let getLinks = db.collection("movieStars")
        getLinks.addSnapshotListener { (queryDocumentSnapshot, error) in
            guard let documents = queryDocumentSnapshot?.documents else { return }
            self.movieStars = documents.compactMap({ (queryDocumentSnapshot) -> MovieStarModel? in
                return try? queryDocumentSnapshot.data(as: MovieStarModel.self)
            })
            
            for item in self.movieStars {
                do {
                    let name = try self.validation.validateName(item.name)
                    print("name: \(name)")
                    
                } catch {
                    print("\(error)")
                }
            }
            
            self.presenter?.noticeFetchedSuccess(movieStarModelArray: self.movieStars)
        }
    }
    
}
