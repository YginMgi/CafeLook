//
//  ViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/03/07.
//

import UIKit

class ViewController: UIViewController {
    private let cafeData = CafeData()
    
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
        daeguBtn.addTarget(self, action: #selector(deagoBtnClicked(_:)), for: .touchUpInside)
    }
    
    private func addDelegate(){
        cafeCollectionView.delegate = self
        cafeCollectionView.dataSource = self
    }
    
    private func addRegister(){
        cafeCollectionView.register(CafeCollectionViewCell.self, forCellWithReuseIdentifier: CafeCollectionViewCell.reuseId)
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
    
    private func sendData(location : String){
        guard let vc =  storyboard?.instantiateViewController(identifier: "SelectLocationViewController") as? SelectLocationViewController else
                { return }
        vc.location = location
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - targets
    @objc private func seoulBtnClicked(_: UIButton){ sendData(location: "Seoul") }
    @objc private func busanBtnClicked(_: UIButton){ sendData(location: "Busan") }
    @objc private func gwangjuBtnClicked(_: UIButton){ sendData(location: "Gwanju") }
    @objc private func daejeonBtnClicked(_: UIButton){ sendData(location: "Daejeon") }
    @objc private func ulsanBtnClicked(_: UIButton){ sendData(location: "Ulsan") }
    @objc private func sejongBtnClicked(_: UIButton){ sendData(location: "Sejong") }
    @objc private func incheonBtnClicked(_: UIButton){ sendData(location: "Incheon") }
    @objc private func deagoBtnClicked(_: UIButton){ sendData(location: "Deago") }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CafeCollectionViewCell.reuseId, for: indexPath) as? CafeCollectionViewCell else {
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
