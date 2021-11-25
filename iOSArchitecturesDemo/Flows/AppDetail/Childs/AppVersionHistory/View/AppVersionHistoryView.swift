//
//  AppVersionHistoryView.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 19.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import SwiftUI
import UIKit

class AppVersionHistoryView: UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var versionHistoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onActionButtonPressed(_:)), for: .touchUpInside)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0)
        button.setTitle("История версий", for: .normal)
        return button
    }()
    
    private(set) lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    // MARK: - Actions
    
    @objc private func onActionButtonPressed(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func setupView() {
        self.addSubview(titleLabel)
        self.addSubview(versionLabel)
        self.addSubview(dateLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(versionHistoryButton)
        
        NSLayoutConstraint.activate([
            
            self.versionHistoryButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            self.versionHistoryButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            self.versionHistoryButton.widthAnchor.constraint(equalToConstant: 90),
            self.versionHistoryButton.heightAnchor.constraint(equalToConstant: 10),
            self.versionHistoryButton.bottomAnchor.constraint(lessThanOrEqualTo: self.dateLabel.bottomAnchor, constant: -16),

            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                                 constant: 8),
            self.titleLabel.rightAnchor.constraint(equalTo: self.versionHistoryButton.rightAnchor,
                                                   constant: 10),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                  constant: 8),
            
            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,
                                                    constant: 8),
            self.versionLabel.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                    constant: 8),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor,
                                                constant: 8),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                        constant: 8),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                        constant: -8),
            self.descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 0),
            
            self.dateLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,
                                                constant: 8),
            self.dateLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                constant: -8),
            self.dateLabel.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
}

//struct AppVersionHistoryView_Preview: PreviewProvider {
//    static var previews: some View {
//        let view = AppVersionHistoryView()
//        view.titleLabel.text = "Что нового"
//        view.versionLabel.text = "Версия 1101"
//        view.dateLabel.text = "6 дней назад"
//        view.descriptionLabel.text = "- Добавлена новая фича"
//        return UIPreview(view)
//            .previewLayout(.fixed(width: 375, height: 100))
//    }
//}
