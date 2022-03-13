//
//  gooView.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/13.
//

import UIKit

class gooView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    var locationLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 10)
        l.textColor = UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1)
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Helpers
    private func setupView(){
        self.backgroundColor = UIColor.white
        self.addSubview(locationLabel)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = true
        locationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        locationLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.heightAnchor.constraint(equalToConstant: viewBounds.height/29).isActive = true
        self.widthAnchor.constraint(equalToConstant: viewBounds.width/6.69).isActive = true
    }
}
