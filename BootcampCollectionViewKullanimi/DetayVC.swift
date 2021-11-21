//
//  DetayVC.swift
//  BootcampCollectionViewKullanimi
//
//  Created by Ertuğrul Kulaber on 8.11.2021.
//

import UIKit

class DetayVC: UIViewController {

    @IBOutlet weak var LabelBaskent: UILabel!
    var ulke:Ulkeler?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let u = ulke {
            self.navigationItem.title = u.ulke_ad
            LabelBaskent.text = u.ulke_baskent
        }
    
    }


}
