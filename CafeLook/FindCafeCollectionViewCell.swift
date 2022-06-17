//
//  findCafeCollectionViewCell.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/14.
//

import UIKit

class FindCafeCollectionViewCell: UICollectionViewCell {
    static var reuseId = "\(FindCafeCollectionViewCell.self)"
    
    private let labelView = UIView()
    
    var cafeName: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        l.textColor = UIColor(red: 118/255, green: 96/255, blue: 87/255, alpha: 1)
        l.text = "유진카페"
        return l
    }()
    
    private var locationImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "CafeLook_LocationImage")
        return i
    }()
    
    var cafeLocation: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 9)
        l.text = "암ㄴ이ㅏ러미다저래쟈덜;미ㅏㄷ럼;ㅐ댜ㅓㄹ;ㅁ지다러;"
        l.textColor = UIColor.black
        return l
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        
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
        self.addSubview(labelView)
        labelView.addSubview(cafeName)
        labelView.addSubview(cafeLocation)
        labelView.addSubview(locationImage)
    }
    
    private func addLocation(){
        labelView.translatesAutoresizingMaskIntoConstraints = false
        cafeName.translatesAutoresizingMaskIntoConstraints = false
        cafeLocation.translatesAutoresizingMaskIntoConstraints = false
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        
        labelView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.width/12.75).isActive = true
        labelView.heightAnchor.constraint(equalToConstant: self.frame.height/2).isActive = true
        labelView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        labelView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        cafeName.topAnchor.constraint(equalTo: labelView.topAnchor).isActive = true
        cafeName.leftAnchor.constraint(equalTo: labelView.leftAnchor).isActive = true
        
        locationImage.bottomAnchor.constraint(equalTo: labelView.bottomAnchor).isActive = true
        locationImage.leftAnchor.constraint(equalTo: labelView.leftAnchor).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 8).isActive = true
        locationImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        cafeLocation.leftAnchor.constraint(equalTo: locationImage.rightAnchor, constant: self.frame.width/80).isActive = true
        cafeLocation.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor).isActive = true
        cafeLocation.widthAnchor.constraint(equalToConstant: self.frame.width/2).isActive = true
    }
}
