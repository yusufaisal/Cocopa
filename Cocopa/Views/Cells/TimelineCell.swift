//
//  TimelineCell.swift
//  Cocopa
//
//  Created by iSal on 20/05/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {
    static let identifier:String = "TimelineCell"
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var likesNum: UIButton!
    @IBOutlet weak var commentsNum: UIButton!
    @IBOutlet weak var threeDot: UIButton!
    var isLiked:Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.likesNum.target(forAction: #selector(didLikeTapped), withSender: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCell() {
        self.likesNum.addTarget(self, action: #selector(didLikeTapped), for: .touchUpInside)
    }
    
    @objc private func didLikeTapped(){
        self.isLiked = !isLiked
        self.setupLikeButton()
    }
    
    private func setupLikeButton() {
        let num = Int(self.likesNum.currentTitle!)
        
        if isLiked {
            self.likesNum.setImage(UIImage(named: "Heart Pink"), for: .normal)
            self.likesNum.setTitle(String(num!+1), for: .normal)
        } else {
            self.likesNum.setImage(UIImage(named: "Heart"), for: .normal)
            self.likesNum.setTitle(String(num!-1), for: .normal)
        }
    }
}

