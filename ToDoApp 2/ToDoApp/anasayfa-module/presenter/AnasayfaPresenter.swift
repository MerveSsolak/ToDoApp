//
//  AnasayfaPresenter.swift
//  ToDoApp
//
//  Created by Merve Solak on 11.05.2022.
//

import Foundation

class AnasayfaPresenter :ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func IsleriAl() {
        anasayfaInteractor?.tumIsleriAl()
    }
    
    func ara(Kelime: String) {
        anasayfaInteractor?.IsleriAra(Kelime: Kelime)
    }
    
    
    func sil(kisi_id: Int) {
        anasayfaInteractor?.IsSil(kisi_id: kisi_id)
        
    }
    
}

extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilacaklarListesi: Array<Yapilacakİsler>) {
        anasayfaView?.viweVeriGonder(yapilacaklarListesi: yapilacaklarListesi)
    }
}
