//
//  SongSearchView.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 25.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongSearchView: UIView {
    
    // MARK: - Subviews
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    let emptyResultView = UIView()
    let emptyResultLabel = UILabel()
    let toolBar = UIToolbar(frame:CGRect(x: 0, y: 524, width: 320, height: 44))
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addSearchBar()
        self.addTableView()
        self.addToolBar()
        self.addEmptyResultView()
        self.setupConstraints()
    }
    
    private func addSearchBar() {
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.searchBarStyle = .minimal
        self.addSubview(self.searchBar)
    }
    
    private func addTableView() {
        self.tableView.rowHeight = 72.0
        self.tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 0.0)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.isHidden = true
        self.tableView.tableFooterView = UIView()
        self.addSubview(self.tableView)
    }
    
    private func addToolBar() {

        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(song), for: .touchUpInside)

        let item = UIBarButtonItem(customView: button)
        var items = [UIBarButtonItem]()
        items.append(item)
        
        let button2 = UIButton()
        button2.frame = CGRect(x: 50, y: 0, width: 10, height: 10)
        button2.backgroundColor = .green
        button2.addTarget(self, action: #selector(apps), for: .touchUpInside)

        let item2 = UIBarButtonItem(customView: button2)
        items.append(item2)
        
        self.toolBar.barStyle = .black
        self.toolBar.isTranslucent = true
        self.toolBar.translatesAutoresizingMaskIntoConstraints = false
        self.toolBar.isHidden = false
        self.toolBar.setItems(items, animated: false)
        self.toolBar.isUserInteractionEnabled = true
        self.toolBar.reloadInputViews()
        self.addSubview(self.toolBar)
    }
    
    @objc private func song() {
        print("#CLICK")
    }
    
    @objc private func apps() {
        print("#CLICK")
    }
    
    private func addEmptyResultView() {
        self.emptyResultView.translatesAutoresizingMaskIntoConstraints = false
        self.emptyResultView.backgroundColor = .white
        self.emptyResultView.isHidden = true
        
        self.emptyResultLabel.translatesAutoresizingMaskIntoConstraints = false
        self.emptyResultLabel.text = "Nothing was found"
        self.emptyResultLabel.textColor = UIColor.darkGray
        self.emptyResultLabel.textAlignment = .center
        self.emptyResultLabel.font = UIFont.systemFont(ofSize: 12.0)
        
        self.addSubview(self.emptyResultView)
        self.emptyResultView.addSubview(self.emptyResultLabel)
    }
    
    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            self.searchBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            self.toolBar.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.toolBar.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.toolBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.emptyResultView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.emptyResultView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.emptyResultView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.emptyResultView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.emptyResultLabel.topAnchor.constraint(equalTo: self.emptyResultView.topAnchor, constant: 12.0),
            self.emptyResultLabel.leadingAnchor.constraint(equalTo: self.emptyResultView.leadingAnchor),
            self.emptyResultLabel.trailingAnchor.constraint(equalTo: self.emptyResultView.trailingAnchor)
            ])
    }
}

