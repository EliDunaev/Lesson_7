//
//  AppDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 11/18/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import SwiftUI
import UIKit

class AppDetailHeaderView: UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onActionButtonPressed(_:)), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Open", for: .normal)
        return button
    }()
    
    private(set) lazy var iconView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 14
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    // MARK - Private
    
    private func setupView() {
        self.addSubview(iconView)
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            self.iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            self.iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.iconView.heightAnchor.constraint(equalToConstant: 80),
            self.iconView.widthAnchor.constraint(equalToConstant: 80),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.subtitleLabel.topAnchor, constant: -4),
            self.titleLabel.leftAnchor.constraint(equalTo: self.iconView.rightAnchor, constant: 8),
            
            self.subtitleLabel.leftAnchor.constraint(equalTo: self.iconView.rightAnchor, constant: 8),
            
            self.subtitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            
            self.actionButton.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 10),
            self.actionButton.leftAnchor.constraint(equalTo: self.iconView.rightAnchor, constant: 8),
            self.actionButton.widthAnchor.constraint(equalToConstant: 80),
            self.actionButton.heightAnchor.constraint(equalToConstant: 36),
            self.actionButton.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.actionButton.layer.cornerRadius = self.actionButton.bounds.height / 2
    }
    
    // MARK: - Actions
    
    @objc private func onActionButtonPressed(_ sender: UIButton) {
        
    }
    
}

struct AppDetailHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        let view = AppDetailHeaderView()
        view.subtitleLabel.text = "VK"
        view.titleLabel.text = "ВКонтакте"
        view.iconView.backgroundColor = .red
        return UIPreview(view)
            .previewLayout(.fixed(width: 375, height: 200))
    }
}
