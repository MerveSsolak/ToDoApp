//
//  YapilacakIsDetayPresenter.swift
//  ToDoApp
//
//  Created by Merve Solak on 11.05.2022.
//

import Foundation



class YapilacakIsDetayPresenter : ViewToPresenterYapilacakIsDetayProtocol {
    var yapilacakIsDetayInteractor: PresenterToInteractorYapilacakIsDetayProtocol?
    
    
    func guncelle(kisi_id: Int, yapilacak_is: String) {
        yapilacakIsDetayInteractor?.yapılacakIsGuncelle(kisi_id: kisi_id, yapilacak_is: yapilacak_is)
    }
}
