//
//  SelectLocationViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/13.
//

import UIKit

class SelectLocationViewController: UIViewController {
    @IBOutlet weak var locationImageView: UIImageView!
    
    var location: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("location : \(location)")
        changeLocationImage(location: location!)
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
            locationImageView.image = UIImage(named: "CafeLook_GwanjuImage")
            break
        default:
            break
        }
    }
}
