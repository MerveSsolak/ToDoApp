//
//  AnasayfaProtocols.swift
//  ToDoApp
//
//  Created by Merve Solak on 11.05.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol?{get set}
    func IsleriAl()
    func ara(Kelime:String)
    func sil(kisi_id:Int)
    
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumIsleriAl()
    func IsleriAra(Kelime:String)
    func IsSil(kisi_id:Int)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilacaklarListesi:Array<Yapilacakİsler>)
    
}

protocol PresenterToViewAnasayfaProtocol {
    func viweVeriGonder(yapilacaklarListesi:Array<Yapilacakİsler>)
    
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule (ref:AnasayfaVC)
}
