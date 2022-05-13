//
//  YapilacakIsKayitPresenter.swift
//  ToDoApp
//
//  Created by Merve Solak on 10.05.2022.
//

import Foundation

class YapilacakIsKayitPresenter :ViewToPresenterYapilacakIsKayitProtocol {
    var yapilacakIsKayitInteractor: PresenterToInteractorYapilacakIsKayitProtocol?
    
    func ekle(yapilacak_is: String) {
        yapilacakIsKayitInteractor?.kayitekle(yapilacak_is: yapilacak_is)
    }
    
}
