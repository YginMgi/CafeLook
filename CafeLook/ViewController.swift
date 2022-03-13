//
//  ViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/07.
//

import UIKit

class ViewController: UIViewController {
    private let cafeData = CafeData()
    
    private let selectLocationViewController = SelectLocationViewController()
    
    @IBOutlet weak var seoulBtn: UIButton!
    @IBOutlet weak var busanBtn: UIButton!
    @IBOutlet weak var gwangjuBtn: UIButton!
    @IBOutlet weak var daejeonBtn: UIButton!
    @IBOutlet weak var ulsanBtn: UIButton!
    @IBOutlet weak var sejongBtn: UIButton!
    @IBOutlet weak var incheonBtn: UIButton!
    @IBOutlet weak var daeguBtn: UIButton!
    
    private let cafeCollectionView: UICollectionView = {
         let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
         return cv
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView(){
        addDelegate()
        addRegister()
        addTarget()
        addView()
        addLocation()
    }
    
    private func addTarget(){
        seoulBtn.addTarget(self, action: #selector(seoulBtnClicked(_:)), for: .touchUpInside)
        busanBtn.addTarget(self, action: #selector(busanBtnClicked(_:)), for: .touchUpInside)
        gwangjuBtn.addTarget(self, action: #selector(gwangjuBtnClicked(_:)), for: .touchUpInside)
        daejeonBtn.addTarget(self, action: #selector(daejeonBtnClicked(_:)), for: .touchUpInside)
        ulsanBtn.addTarget(self, action: #selector(ulsanBtnClicked(_:)), for: .touchUpInside)
        sejongBtn.addTarget(self, action: #selector(sejongBtnClicked(_:)), for: .touchUpInside)
        incheonBtn.addTarget(self, action: #selector(incheonBtnClicked(_:)), for: .touchUpInside)
        daeguBtn.addTarget(self, action: #selector(daeguBtnClicked(_:)), for: .touchUpInside)
    }
    
    private func addDelegate(){
        cafeCollectionView.delegate = self
        cafeCollectionView.dataSource = self
    }
    
    private func addRegister(){
        cafeCollectionView.register(CafeCollectionViewCell.self, forCellWithReuseIdentifier: CafeCollectionViewCell.identifier)
    }
    
    private func addView(){
        view.backgroundColor = .white
        view.addSubview(cafeCollectionView)
    }
    
    private func addLocation(){
        cafeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cafeCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cafeCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cafeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cafeCollectionView.topAnchor.constraint(equalTo: gwangjuBtn.bottomAnchor, constant: view.frame.height/13.7).isActive = true
    }
    
    @objc private func seoulBtnClicked(_: UIButton){
        selectLocationViewController.changelocationText(location: "seoul")
    }
    
    @objc private func busanBtnClicked(_: UIButton){
        selectLocationViewController.changelocationText(location: "busan")
    }
    
    @objc private func gwangjuBtnClicked(_: UIButton){
        selectLocationViewController.changelocationText(location: "gwangju")
    }
    
    @objc private func daejeonBtnClicked(_: UIButton){
        selectLocationViewController.changelocationText(location: "daejeon")
    }
    
    @objc private func ulsanBtnClicked(_: UIButton){
        selectLocationViewController.changelocationText(location: "ulsan")
    }
    
    @objc private func sejongBtnClicked(_: UIButton){
        selectLocationViewController.changelocationText(location: "sejong")
    }
    
    @objc private func incheonBtnClicked(_: UIButton){
        selectLocationViewController.changelocationText(location: "incheon")
    }
    
    @objc private func daeguBtnClicked(_: UIButton){
        selectLocationViewController.changelocationText(location: "daegu")
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
        return CGSize(width: view.frame.width/1.25, height: view.frame.height/9.6)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.height/62.4
    }
}
