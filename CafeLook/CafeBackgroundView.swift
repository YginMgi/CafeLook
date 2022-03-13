//
//  CafeBackgroundView.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/13.
//

import UIKit

class CafeBackgroundView: UIView {
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
        self.backgroundColor = UIColor(red: 243/255, green: 241/255, blue: 240/255, alpha: 1)
        self.layer.cornerRadius = 28
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
