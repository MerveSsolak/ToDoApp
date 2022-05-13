//
//  YapilacakIsKayitRouter.swift
//  ToDoApp
//
//  Created by Merve Solak on 10.05.2022.
//

import Foundation

class YapilacakIsKayitRouter : PresenterToRouterYapilacakIsKayitProtocol{
    static func createModule(ref: YapilacakIsKayitVC) {
        ref.yapilacakIsKayitPresenterNesnesi = YapilacakIsKayitPresenter()
        ref.yapilacakIsKayitPresenterNesnesi?.yapilacakIsKayitInteractor = YapilacakIsKayitInteractor()
    }
    
    
}
