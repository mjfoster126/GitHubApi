//
//  commitCell.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 13/12/20.
//

import UIKit

class commitCell: UITableViewCell {
    
    let author: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.bold)
        return lbl
    }()
    let dateTime: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        return lbl
    }()
    let sha: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.black)
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    let userImage: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .brown
        img.layer.cornerRadius = 25
        return img
    }()
    let commitDescription: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.translatesAutoresizingMaskIntoConstraints = true
        tv.sizeToFit()
        tv.isScrollEnabled = false
        tv.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.light)
        return tv
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(userImage)
        addSubview(author)
        addSubview(dateTime)
        addSubview(sha)
        addSubview(commitDescription)
        
        userImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50, enableInsets: false)
        
        author.anchor(top: topAnchor, left: userImage.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width - userImage.frame.width, height: 25, enableInsets: false)
        
        dateTime.anchor(top: author.bottomAnchor, left: userImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width - userImage.frame.width, height: 25, enableInsets: false)
        
        commitDescription.anchor(top: userImage.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
        
        
        sha.anchor(top: commitDescription.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: frame.size.width, height: 0, enableInsets: false)
         
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }

}
