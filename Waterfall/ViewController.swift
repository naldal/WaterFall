//
//  ViewController.swift
//  Waterfall
//
//  Created by 송하민 on 2021/07/19.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class ViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        
        // The Cell what we made, should be registered on Collection View
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    struct Model {
        let imageName: String
        let height: CGFloat
    }
    
    private var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let images = Array(1...10).map{"animal\($0)"}
        models = images.compactMap{
            Model.init(imageName: $0, height: CGFloat.random(in: 200...400))
        }
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension ViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            fatalError()
        }
        cell.configure(image: UIImage(named: models[indexPath.row].imageName))
        return cell
    }
}

extension ViewController: CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2 , height: models[indexPath.row].height)
    }
    
    
}

