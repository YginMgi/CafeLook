//
//  CafeCollectionViewCell.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/11.
//

import UIKit

class CafeCollectionViewCell: UICollectionViewCell {
    static let reuseId = "\(CafeCollectionViewCell.self)"
    
    private var bgView: UIView = {
       let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 13
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor(red: 229/255, green: 223/255, blue: 221/255, alpha: 1).cgColor
        return v
    }()
    
    private var cafeLabelView = UIView()
    
    var cafeName: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        l.textColor = UIColor(red: 118/255, green: 96/255, blue: 87/255, alpha: 1)
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
        l.textColor = UIColor.black
        return l
    }()
    
    private let openCloseView = UIView()
    
    private let viview = UIView()
    
    private var openTitle: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "ArialRoundedMTBold", size: 10)
        l.text = "OPEN"
        l.textColor = UIColor(red: 118/255, green: 96/255, blue: 87/255, alpha: 1)
        return l
    }()
    
    private var closeTitle: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "ArialRoundedMTBold", size: 10)
        l.text = "CLOSE"
        l.textColor = UIColor(red: 118/255, green: 96/255, blue: 87/255, alpha: 1)
        return l
    }()
    
    private var openTime: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 10)
        l.text = "12:00"
        return l
    }()
    
    private var closeTime: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 10)
        l.text = "13:00"
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.masksToBounds = true
        
        addView()
        setupLayout()
    }
    
    private func addView(){
        contentView.addSubview(bgView)
        bgView.addSubview(cafeLabelView)
        cafeLabelView.addSubview(cafeName)
        cafeLabelView.addSubview(cafeLocation)
        cafeLocation.addSubview(locationImage)
        bgView.addSubview(openCloseView)
        openCloseView.addSubview(openTime)
        openCloseView.addSubview(closeTime)
        openCloseView.addSubview(openTitle)
        openCloseView.addSubview(closeTitle)
    }
    
    private func setupLayout(){
        [bgView, cafeLabelView, cafeName, locationImage, cafeLocation, openCloseView, openTime, openTitle, closeTime, closeTitle].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        bgView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bgView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bgView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        cafeLabelView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        cafeLabelView.heightAnchor.constraint(equalToConstant: self.frame.height/2.5).isActive = true
        cafeLabelView.widthAnchor.constraint(equalToConstant: self.frame.width/2).isActive = true
        cafeLabelView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: contentView.frame.width/11.03).isActive = true
        
        cafeName.topAnchor.constraint(equalTo: cafeLabelView.topAnchor).isActive = true
        cafeName.leftAnchor.constraint(equalTo: cafeLabelView.leftAnchor).isActive = true
        
        locationImage.bottomAnchor.constraint(equalTo: cafeLabelView.bottomAnchor).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 8).isActive = true
        locationImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
        locationImage.leftAnchor.constraint(equalTo: cafeName.leftAnchor).isActive = true
        
        cafeLocation.leftAnchor.constraint(equalTo: locationImage.rightAnchor, constant: self.frame.width/80).isActive = true
        cafeLocation.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor).isActive = true
        cafeLocation.widthAnchor.constraint(equalToConstant: self.frame.width/2.5).isActive = true
        
        openCloseView.heightAnchor.constraint(equalTo: cafeLabelView.heightAnchor).isActive = true
        openCloseView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -contentView.frame.width/11.03).isActive = true
        openCloseView.widthAnchor.constraint(equalToConstant: self.frame.width/3.8).isActive = true
        openCloseView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        openTitle.topAnchor.constraint(equalTo: openCloseView.topAnchor).isActive = true
        openTitle.leftAnchor.constraint(equalTo: openCloseView.leftAnchor).isActive = true
        
        closeTitle.leftAnchor.constraint(equalTo: openCloseView.leftAnchor).isActive = true
        closeTitle.bottomAnchor.constraint(equalTo: openCloseView.bottomAnchor).isActive = true
        
        openTime.rightAnchor.constraint(equalTo: openCloseView.rightAnchor).isActive = true
        openTime.topAnchor.constraint(equalTo: openCloseView.topAnchor).isActive = true
        
        closeTime.rightAnchor.constraint(equalTo: openCloseView.rightAnchor).isActive = true
        closeTime.bottomAnchor.constraint(equalTo: openCloseView.bottomAnchor).isActive = true
    }
}
