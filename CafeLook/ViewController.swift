//
//  ViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cafeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cafeCollectionView.delegate = self
        cafeCollectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CafeCollectionViewCell
        
        cell.backgroundColor = UIColor.blue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 228, height: 387)
    }
}
