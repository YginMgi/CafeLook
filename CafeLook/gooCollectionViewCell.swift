//
//  gooCollectionViewCell.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/14.
//

import UIKit

class gooCollectionViewCell: UICollectionViewCell {
    static var reuseId = "\(gooCollectionViewCell.self)"
    
    var gooBtn: UIButton = {
       let b = UIButton()
        b.setTitle("미추홀구", for: .normal)
        b.setTitleColor(UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1), for: .normal)
        b.backgroundColor = .clear
        b.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 10)
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addView()
        addLocation()
    }
    
    private func addView(){
        self.addSubview(gooBtn)
    }
    
    private func addLocation(){
        gooBtn.translatesAutoresizingMaskIntoConstraints = false
        
        gooBtn.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        gooBtn.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        gooBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        gooBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
