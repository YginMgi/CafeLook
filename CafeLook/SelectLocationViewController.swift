//
//  SelectLocationViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/13.
//

import UIKit

class SelectLocationViewController: UIViewController {
    fileprivate var locationText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func changelocationText(location: String){
        locationText = location
        print("location : \(locationText)")
    }
}
