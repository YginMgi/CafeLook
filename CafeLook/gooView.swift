//
//  gooView.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/13.
//

import UIKit

class gooView: UIButton {
    private let viewBounds = UIScreen.main.bounds
    
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
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.heightAnchor.constraint(equalToConstant: viewBounds.height/29).isActive = true
        self.widthAnchor.constraint(equalToConstant: viewBounds.width/6.69).isActive = true
        
        self.layer.cornerRadius = viewBounds.height/29/2
        
        self.setTitle("남구", for: .normal)
        self.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 10)
        self.setTitleColor(UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1), for: .normal)
    }
}
