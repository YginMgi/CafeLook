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
    
    var location: String?
    
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
    }
    
    private func addLocation(){
        cafeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        cafeBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cafeBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cafeBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cafeBackgroundView.heightAnchor.constraint(equalToConstant: view.frame.height/1.27).isActive = true
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
