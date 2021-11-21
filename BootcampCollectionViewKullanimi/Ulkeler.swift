//
//  Ulkeler.swift
//  BootcampCollectionViewKullanimi
//
//  Created by Ertuğrul Kulaber on 6.11.2021.
//

import Foundation

class Ulkeler {
    var ulke_id:Int?
    var ulke_ad:String?
    var ulke_baskent:String?

    init(){
        
    }
    init(ulke_id:Int,ulke_ad:String,ulke_baskent:String){
        self.ulke_id = ulke_id
        self.ulke_ad = ulke_ad
        self.ulke_baskent = ulke_baskent
    }
}
