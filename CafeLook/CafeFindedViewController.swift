//
//  CafeFindedViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/13.
//

import UIKit

class CafeFindedViewController: UIViewController {
    // MARK: - Property
    private let cafeBackgroundView = CafeBackgroundView()
        
    private let findCafeLabel: UILabel = {
        var l = UILabel()
        l.text = "광주광역시에 있는 카페에요!"
        l.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        l.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        return l
    }()
    
    private let findCafeCollectionView: UICollectionView = {
         let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
         cv.backgroundColor = UIColor(red: 243/255, green: 241/255, blue: 240/255, alpha: 1)
         return cv
     }()
    
    init(text: String?){
        super.init(nibName: nil, bundle: nil)
        findCafeLabel.text = "\(text!)에 있는 카페에요!"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Helpers
    private func setupView(){
        addDelegate()
        addRegister()
        addView()
        addLocation()
    }
    
    private func addDelegate(){
        findCafeCollectionView.delegate = self
        findCafeCollectionView.dataSource = self
    }
    
    private func addRegister(){
        findCafeCollectionView.register(FindCafeCollectionViewCell.self, forCellWithReuseIdentifier: FindCafeCollectionViewCell.reuseId)
    }
    
    // MARK: - addView
    private func addView(){
        view.addSubview(cafeBackgroundView)
        cafeBackgroundView.addSubview(findCafeLabel)
        cafeBackgroundView.addSubview(findCafeCollectionView)
    }
    
    // MARK: - addLocation
    private func addLocation(){
        cafeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        findCafeLabel.translatesAutoresizingMaskIntoConstraints = false
        findCafeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        cafeBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cafeBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cafeBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cafeBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        findCafeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/26.41).isActive = true
        findCafeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width/10.13).isActive = true
        
        findCafeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        findCafeCollectionView.topAnchor.constraint(equalTo: findCafeLabel.bottomAnchor, constant: view.frame.height/35).isActive = true
        findCafeCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        findCafeCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension CafeFindedViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FindCafeCollectionViewCell.reuseId, for: indexPath) as? FindCafeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // SelectLocationVC로 이벤트 전달
    }
}

extension CafeFindedViewController: UICollectionViewDelegateFlowLayout{
    //MARK: collectionview - cell height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/1.18, height: view.frame.height/7)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.height/40
    }
}
