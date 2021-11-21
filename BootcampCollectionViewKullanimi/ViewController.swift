//
//  ViewController.swift
//  BootcampCollectionViewKullanimi
//
//  Created by Ertuğrul Kulaber on 6.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ulkeCollectionView: UICollectionView!
    
    var ulkelerListe = [Ulkeler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let u1 = Ulkeler(ulke_id: 1, ulke_ad: "Türkiye", ulke_baskent: "Ankara")
        let u2 = Ulkeler(ulke_id: 2, ulke_ad: "Fransa", ulke_baskent: "Paris")
        let u3 = Ulkeler(ulke_id: 3, ulke_ad: "Rusya", ulke_baskent: "Moskava")
        let u4 = Ulkeler(ulke_id: 4, ulke_ad: "Japonya", ulke_baskent: "Tokyo")
        let u5 = Ulkeler(ulke_id: 5, ulke_ad: "İtalya", ulke_baskent: "Roma")
        let u6 = Ulkeler(ulke_id: 6, ulke_ad: "Çin", ulke_baskent: "Pekin")
        let u7 = Ulkeler(ulke_id: 7, ulke_ad: "Almanya", ulke_baskent: "Berlin")
        
        ulkelerListe.append(u1)
        ulkelerListe.append(u2)
        ulkelerListe.append(u3)
        ulkelerListe.append(u4)
        ulkelerListe.append(u5)
        ulkelerListe.append(u6)
        ulkelerListe.append(u7)
        ulkeCollectionView.delegate = self
        ulkeCollectionView.dataSource = self
        
        let genislik = ulkeCollectionView.frame.size.width
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 5
        tasarim.minimumLineSpacing = 5
        tasarim.itemSize = CGSize(width: (genislik-25)/2, height: (genislik-25)/2)
        ulkeCollectionView.collectionViewLayout = tasarim
    }
 
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ulkelerListe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ulke = ulkelerListe[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ulkeHucre", for: indexPath) as! UlkeCollectionViewCell
        cell.ulkeLabel.text = ulke.ulke_ad
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 15
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ulke = ulkelerListe[indexPath.row]
        print("Seçilen Ülke \(ulke.ulke_ad!) - \(ulke.ulke_baskent!)")
        performSegue(withIdentifier: "toDetay", sender: ulke)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let ulke = sender as? Ulkeler
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.ulke = ulke
        }
    }
}
