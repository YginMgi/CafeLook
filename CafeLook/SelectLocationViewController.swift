//
//  SelectLocationViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/13.
//

import UIKit

class SelectLocationViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var locationImageView: UIImageView!
    
    private let cafeBackgroundView = CafeBackgroundView()
    
    private let cafeFindedViewController = CafeFindedViewController()
    
    var location: String?
    
    private let selectLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        l.text = "더 자세히 선택해보세요!"
        l.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        return l
    }()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeLocationImage(location: location!)
        setupView()
    }
    
    // MARK: - Helpers
    private func setupView(){
        addView()
        addLocation()
    }
    
    private func addView(){
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        view.addSubview(cafeBackgroundView)
        [selectLabel, cafeFindedViewController.view].forEach{ cafeBackgroundView.addSubview($0) }
    }
    
    private func addLocation(){
        cafeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        cafeFindedViewController.view.translatesAutoresizingMaskIntoConstraints = false

        cafeBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cafeBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cafeBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cafeBackgroundView.heightAnchor.constraint(equalToConstant: view.frame.height/1.27).isActive = true
        
        selectLabel.topAnchor.constraint(equalTo: cafeBackgroundView.topAnchor, constant: view.frame.height/22.55).isActive = true
        selectLabel.leftAnchor.constraint(equalTo: cafeBackgroundView.leftAnchor, constant: view.frame.width/10.13).isActive = true
        
        cafeFindedViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cafeFindedViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cafeFindedViewController.view.heightAnchor.constraint(equalToConstant: view.frame.height/1.54).isActive = true
        cafeFindedViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
