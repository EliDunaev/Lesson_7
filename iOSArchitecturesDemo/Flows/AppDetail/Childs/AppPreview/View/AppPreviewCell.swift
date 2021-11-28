//
//  AppPreviewCell.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 21.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class AppPreviewCell: UICollectionViewCell {

    private let screenshotImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.addSubview(screenshotImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 2, bottom: 0, right: 2))
    }

    private func setupLayouts() {
        screenshotImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            screenshotImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screenshotImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screenshotImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -5),
            screenshotImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with image: UIImage) {
        screenshotImageView.image = image
    }
}

extension AppPreviewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

