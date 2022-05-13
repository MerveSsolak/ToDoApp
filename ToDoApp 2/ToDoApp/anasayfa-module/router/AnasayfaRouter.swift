//
//  AnasayfaRouter.swift
//  ToDoApp
//
//  Created by Merve Solak on 11.05.2022.
//

import Foundation

class AnasayfaRouter :PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC) {
       let presenter = AnasayfaPresenter()
        
        ref.anasayfaPresenterNesnesi = presenter
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
    

    
    
}
