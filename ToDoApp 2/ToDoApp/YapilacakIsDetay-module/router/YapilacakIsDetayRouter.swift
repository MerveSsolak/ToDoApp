//
//  YapilacakIsDetayRouter.swift
//  ToDoApp
//
//  Created by Merve Solak on 11.05.2022.
//

import Foundation

class YapilacakIsDetayRouter {
    static func createModule(ref:YapilacakIsDetayVC) {
        ref.yapilacakIsDetayPresnterNesnesi = YapilacakIsDetayPresenter()
        ref.yapilacakIsDetayPresnterNesnesi?.yapilacakIsDetayInteractor = YapilacakIsDetayInteractor()
    }
    
}
