//
//  MovieStarModel.swift
//  viperDemo
//
//  Created by Phillip Kelly-Ayo on 29/07/2020.
//  Copyright © 2020 Phillip Kelly-Ayo. All rights reserved.
//

import FirebaseFirestoreSwift

struct MovieStarModel: Codable, Hashable {
    @DocumentID var id: String? = UUID().uuidString
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    var name: String

}
