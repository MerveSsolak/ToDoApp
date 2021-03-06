//
//  YapilacakIsDetayInteractor.swift
//  ToDoApp
//
//  Created by Merve Solak on 11.05.2022.
//

import Foundation


class YapilacakIsDetayInteractor:PresenterToInteractorYapilacakIsDetayProtocol {
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
        
    }
    func yapÄ±lacakIsGuncelle(kisi_id: Int, yapilacak_is: String) {
        db?.open()
        
        do{
            
            try db! .executeUpdate("UPDATE yapilacakisler SET yapilacak_is = ? WHERE kisi_id = ?", values: [yapilacak_is,kisi_id])
            
        }catch{
            print(error.localizedDescription)
        }
        
        
        
        
        db?.close()
    }
    
}
