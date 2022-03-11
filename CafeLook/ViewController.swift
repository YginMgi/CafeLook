//
//  ViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/07.
//

import UIKit

class ViewController: UIViewController {
    private let cafeData = CafeData()
    
    @IBOutlet weak var gwangjuBtn: UIButton!
    
    private let cafeCollectionView: UICollectionView = {
         let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
         return cv
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView(){
        cafeCollectionView.delegate = self
        cafeCollectionView.dataSource = self
        
        cafeCollectionView.register(CafeCollectionViewCell.self, forCellWithReuseIdentifier: CafeCollectionViewCell.identifier)
        
        view.backgroundColor = .white
        
        view.addSubview(cafeCollectionView)
        
        cafeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cafeCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cafeCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cafeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cafeCollectionView.topAnchor.constraint(equalTo: gwangjuBtn.bottomAnchor, constant: view.frame.height/13.7).isActive = true
    }
}



extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CafeCollectionViewCell.identifier, for: indexPath) as? CafeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.cafeName.text = cafeData.cafeName[indexPath.row]
        cell.cafeLocation.text = cafeData.cafeLocation[indexPath.row]
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    //MARK: collectionview - cell height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width/1.25, height: self.view.frame.height/10)
    }
     
    //MARK: collectionView - left Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.view.frame.width/9.61, bottom: 0, right: self.view.frame.width/9.61)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.height/62.4
    }
}
