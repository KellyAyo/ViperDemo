//
//  MovieStarController.swift
//  viperDemo
//
//  Created by Phillip Kelly-Ayo on 29/07/2020.
//  Copyright © 2020 Phillip Kelly-Ayo. All rights reserved.
//

import UIKit

class MovieStarController: UIViewController {
    
    enum Section {
        case main
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, MovieStarModel>! = nil
    var snapshot = NSDiffableDataSourceSnapshot<Section, MovieStarModel>()
    var collectionView: UICollectionView!
    
    var presentor: ViewToPresenterProtocol?
    var movieStarArray: Array<MovieStarModel> = Array()
    
    private let cellId = "insta"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        configureHierarchy()
        configureDataSource()
        presentor?.startFetchingMovieStars()
    }
}

extension MovieStarController {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            
            let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0))
            let item = NSCollectionLayoutItem(layoutSize: layoutSize)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            
            section.visibleItemsInvalidationHandler = { items, offset, env in
            
            }

            return section
        }
        return layout
    }
    
    func configureHierarchy() {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .yellow
        collectionView.register(MovieStarCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
    
    func configureDataSource() {
        datasource = UICollectionViewDiffableDataSource<Section, MovieStarModel>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, post: MovieStarModel) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! MovieStarCell
            cell.name = post.name

        return cell
        }
    }
    
    private func populateCollection(movieStarPosts: [MovieStarModel]) {
        self.movieStarArray.removeAll()
        self.movieStarArray.append(contentsOf: movieStarPosts)
        snapshot.deleteAllItems()
        snapshot.appendSections([.main])
        snapshot.appendItems(movieStarPosts)
        datasource.apply(snapshot, animatingDifferences: true)
        
    }
}

extension MovieStarController: PresenterToViewProtocol {
    func showMovieStar(movieStarArray: Array<MovieStarModel>) {
        populateCollection(movieStarPosts: movieStarArray)
    }
}

class MovieStarCell: UICollectionViewCell {
    
    var name: String! {
        didSet {
            nameLabel.text = name
        }
    }
    
    private var commonConstraints: [NSLayoutConstraint] = []
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.backgroundColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameLabel)
        setupLayoutConstraints()
    }
    
    func setupLayoutConstraints() {
        commonConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(commonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
