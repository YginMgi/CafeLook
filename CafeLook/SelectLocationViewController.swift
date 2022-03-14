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
    
    private let gooData = GooData()
    
    var gooLocationArr: [String] = []
    
    private let selectLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        l.text = "더 자세히 선택해보세요!"
        l.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        return l
    }()
    
    private let gooCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let c = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        c.backgroundColor = .clear
        c.showsHorizontalScrollIndicator = false
        return c
    }()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeLocationImage(location: location!)
        setupView()
    }
    
    // MARK: - Helpers
    private func setupView(){
        addCollectionView()
        addView()
        addLocation()
    }
    
    private func addCollectionView(){
        gooCollectionView.delegate = self
        gooCollectionView.dataSource = self
        
        gooCollectionView.register(gooCollectionViewCell.self, forCellWithReuseIdentifier: gooCollectionViewCell.reuseId)
    }
    
    private func addView(){
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        view.addSubview(cafeBackgroundView)
        [selectLabel, cafeFindedViewController.view, gooCollectionView].forEach{ cafeBackgroundView.addSubview($0) }
    }
    
    private func addLocation(){
        cafeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        cafeFindedViewController.view.translatesAutoresizingMaskIntoConstraints = false
        gooCollectionView.translatesAutoresizingMaskIntoConstraints = false

        cafeBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cafeBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cafeBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cafeBackgroundView.heightAnchor.constraint(equalToConstant: view.frame.height/1.27).isActive = true
        
        selectLabel.topAnchor.constraint(equalTo: cafeBackgroundView.topAnchor, constant: view.frame.height/22.55).isActive = true
        selectLabel.leftAnchor.constraint(equalTo: cafeBackgroundView.leftAnchor, constant: view.frame.width/10.13).isActive = true
        
        gooCollectionView.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: view.frame.height/54.13).isActive = true
        gooCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width/12.93).isActive = true
        gooCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height/29).isActive = true
        gooCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
                
        cafeFindedViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cafeFindedViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cafeFindedViewController.view.heightAnchor.constraint(equalToConstant: view.frame.height/1.54).isActive = true
        cafeFindedViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func changeLocationImage(location: String){
        switch location{
        case "Gwanju":
            gooLocationArr = gooData.gwangju
            locationImageView.image = UIImage(named: "CafeLook_GwanjuImage")
            break
        case "Busan":
            locationImageView.image = UIImage(named: "CafeLook_BusanImage")
            gooLocationArr = gooData.busan
            break
        case "Daejeon":
            locationImageView.image = UIImage(named: "CafeLook_DaejeonImage")
            gooLocationArr = gooData.daejeon
            break
        case "Deago":
            locationImageView.image = UIImage(named: "CafeLook_DeagoImage")
            gooLocationArr = gooData.daegu
            break
        case "Incheon":
            locationImageView.image = UIImage(named: "CafeLook_IncheonImage")
            gooLocationArr = gooData.incheon
            break
        case "Sejong":
            locationImageView.image = UIImage(named: "CafeLook_SejongImage")
            gooLocationArr = gooData.sejong
            break
        case "Seoul":
            locationImageView.image = UIImage(named: "CafeLook_SeoulImage")
            gooLocationArr = gooData.seoul
            break
        case "Ulsan":
            locationImageView.image = UIImage(named: "CafeLook_UlsanImage")
            gooLocationArr = gooData.ulsan
            break
        default:
            break
        }
    }
}

extension SelectLocationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gooLocationArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gooCollectionViewCell.reuseId, for: indexPath) as? gooCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = view.frame.height/29/2
        cell.gooBtn.setTitle(gooLocationArr[indexPath.row], for: .normal)
        
        return cell
    }
    
    //MARK: collectionview - cell height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/5.85, height: view.frame.height/29)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.width/41.66
    }
}
