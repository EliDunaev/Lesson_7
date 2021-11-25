//
//  PreviewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 19.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

class PreviewViewController: UIViewController {
    
    let collectionScreenshotView = AppPreviewView()
    
    private var screenshotView: AppPreviewView {
        return self.view as! AppPreviewView
    }
    
    override func loadView() {
        self.view = AppPreviewView()
    }
    
    private let app: ITunesApp
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        screenshotView.collectionView.reloadData()
    }
    
    var screnshotsUrls: [String] = []
    
    private func setup() {
        self.screenshotView.titleLabel.text = "Предпросмотр"
        let urls = app.screenshotUrls
        self.screnshotsUrls.append(contentsOf: urls)
        self.screenshotView.collectionView.dataSource = self
        self.screenshotView.collectionView.delegate = self
        self.screenshotView.collectionView.register(AppPreviewCell.self, forCellWithReuseIdentifier: AppPreviewCell.identifier)
    }
}


extension PreviewViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screnshotsUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppPreviewCell.identifier, for: indexPath) as! AppPreviewCell
        
        let screnshotUrls = screnshotsUrls[indexPath.row]
        imageCache(url: screnshotUrls) { image in
            cell.setup(with: image)
        }
        return cell
    }
}

extension PreviewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let photoFrame = collectionView.frame
        let widthFrame = photoFrame.width / CGFloat(AppPreviewView.LayoutConstant.counts)
        let heightFrame = widthFrame * 1.75

        return CGSize(width: widthFrame, height: heightFrame)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return AppPreviewView.LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
