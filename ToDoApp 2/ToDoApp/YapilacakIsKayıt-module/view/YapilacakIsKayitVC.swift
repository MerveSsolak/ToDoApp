//
//  YapilacakIsKayitVC.swift
//  ToDoApp
//
//  Created by Merve Solak on 9.05.2022.
//

import UIKit

class YapilacakIsKayitVC: UIViewController {

    @IBOutlet weak var tfYapilacakİs: UITextField!
    
    var yapilacakIsKayitPresenterNesnesi:ViewToPresenterYapilacakIsKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YapilacakIsKayitRouter.createModule(ref: self)

        
    }
    

    @IBAction func buttonEkle(_ sender: Any) {
        if let yi = tfYapilacakİs.text {
            yapilacakIsKayitPresenterNesnesi?.ekle(yapilacak_is: yi)
           
            
        }
        
    }
    
    

}
