//
//  AppPreviewView.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 19.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import SwiftUI
import UIKit

class AppPreviewView: UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private(set) lazy var collectionView: UICollectionView = {
        let screenSize: CGRect = UIScreen.main.bounds
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .init(x: 5, y: 20, width: screenSize.width - 10, height: screenSize.height / 2.15), collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    enum LayoutConstant {
        static let spacing: CGFloat = 0.1
        static let counts = 2
    }
    
    // MARK: - Private
    
    private func setupView() {
        self.addSubview(titleLabel)
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([

            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                   constant: 8),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                  constant: 8),

            self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),

        ])
    }
    
}
