//
//  YapilacakIsKayitProtocols.swift
//  ToDoApp
//
//  Created by Merve Solak on 10.05.2022.
//

import Foundation

protocol ViewToPresenterYapilacakIsKayitProtocol {
    var yapilacakIsKayitInteractor:PresenterToInteractorYapilacakIsKayitProtocol? {get set}
    func ekle(yapilacak_is:String)
    
}

protocol PresenterToInteractorYapilacakIsKayitProtocol {
    func kayitekle(yapilacak_is:String)
}

protocol PresenterToRouterYapilacakIsKayitProtocol {
    static func createModule(ref:YapilacakIsKayitVC)
}
