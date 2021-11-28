//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 25.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var trackName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var albumName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    private(set) lazy var songCover: UIImageView = {
        let cover = UIImageView()
        cover.translatesAutoresizingMaskIntoConstraints = false
        cover.layer.cornerRadius = 14
        cover.layer.masksToBounds = true
        cover.layer.borderWidth = 1
        cover.layer.borderColor = UIColor.lightGray.cgColor
        return cover
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    private let imageDownloader = ImageDownloader()
    
    func configure(with cellModel: SongCellModel) {
        self.trackName.text = cellModel.trackName
        self.artistName.text = cellModel.artist
        self.albumName.text = cellModel.albumName
        
        self.imageDownloader.getImage(fromUrl: cellModel.artwork) { (image, error) in
            guard let image = image else { return }
            self.songCover.image = image
        }
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.trackName, self.artistName, self.albumName].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addTrackName()
        self.addArtistName()
        self.addAlbumName()
        self.addSongCover()
    }
    
    private func addTrackName() {
        self.contentView.addSubview(self.trackName)
        NSLayoutConstraint.activate([
            self.trackName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.trackName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 68.0),
            self.trackName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addArtistName() {
        self.contentView.addSubview(self.artistName)
        NSLayoutConstraint.activate([
            self.artistName.topAnchor.constraint(equalTo: self.trackName.bottomAnchor, constant: 4.0),
            self.artistName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 68.0),
            self.artistName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addAlbumName() {
        self.contentView.addSubview(self.albumName)
        NSLayoutConstraint.activate([
            self.albumName.topAnchor.constraint(equalTo: self.artistName.bottomAnchor, constant: 4.0),
            self.albumName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 68.0),
            self.albumName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addSongCover() {
        self.contentView.addSubview(self.songCover)
        NSLayoutConstraint.activate([
            self.songCover.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7.0),
            self.songCover.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 4.0),
            self.songCover.rightAnchor.constraint(equalTo: self.trackName.leftAnchor, constant: -4.0),
            self.songCover.heightAnchor.constraint(equalToConstant: 60),
            self.songCover.widthAnchor.constraint(equalToConstant: 60)
            ])
    }
}

