//
//  SelectLocationViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/13.
//

import UIKit

class SelectLocationViewController: UIViewController {
    @IBOutlet weak var locationImageView: UIImageView!
    
    private let cafeBackgroundView = CafeBackgroundView()
    
    private let namgooView = gooView()
    private let donggooView = gooView()
    private let gwansangooView = gooView()
    
    var location: String?
    
    private let selectLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        l.text = "더 자세히 선택해보세요!"
        l.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        return l
    }()
    
    lazy var locationStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [namgooView, donggooView, gwansangooView])
        s.axis = .horizontal
        s.spacing = 10
        s.distribution = .fillEqually
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeLocationImage(location: location!)
        setupView()
    }
    
    private func setupView(){
        addView()
        addLocation()
    }
    
    private func addView(){
        view.addSubview(cafeBackgroundView)
        cafeBackgroundView.addSubview(selectLabel)
        cafeBackgroundView.addSubview(locationStackView)
    }
    
    private func addLocation(){
        cafeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        locationStackView.translatesAutoresizingMaskIntoConstraints = false

        
        cafeBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cafeBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cafeBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cafeBackgroundView.heightAnchor.constraint(equalToConstant: view.frame.height/1.27).isActive = true
        
        selectLabel.topAnchor.constraint(equalTo: cafeBackgroundView.topAnchor, constant: view.frame.height/22.55).isActive = true
        selectLabel.leftAnchor.constraint(equalTo: cafeBackgroundView.leftAnchor, constant: view.frame.width/10.13).isActive = true
        
        locationStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width/12.93).isActive = true
        locationStackView.widthAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        locationStackView.heightAnchor.constraint(equalToConstant: view.frame.height/29).isActive = true
        locationStackView.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: view.frame.height/90.22).isActive = true
    }
    
    private func changeLocationImage(location: String){
        switch location{
        case "Gwanju":
            locationImageView.image = UIImage(named: "CafeLook_GwanjuImage")
            break
        case "Busan":
            locationImageView.image = UIImage(named: "CafeLook_BusanImage")
            break
        case "Daejeon":
            locationImageView.image = UIImage(named: "CafeLook_DaejeonImage")
            break
        case "Deago":
            locationImageView.image = UIImage(named: "CafeLook_DeagoImage")
            break
        case "Incheon":
            locationImageView.image = UIImage(named: "CafeLook_IncheonImage")
            break
        case "Sejong":
            locationImageView.image = UIImage(named: "CafeLook_SejongImage")
            break
        case "Seoul":
            locationImageView.image = UIImage(named: "CafeLook_SeoulImage")
            break
        case "Ulsan":
            locationImageView.image = UIImage(named: "CafeLook_UlsanImage")
            break
        default:
            break
        }
    }
}
