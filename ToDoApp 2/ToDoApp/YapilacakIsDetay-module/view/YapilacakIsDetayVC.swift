//
//  YapılacakIsVC.swift
//  ToDoApp
//
//  Created by Merve Solak on 9.05.2022.
//

import UIKit

class YapilacakIsDetayVC: UIViewController {

    @IBOutlet weak var tfYapilacakİs: UITextField!
    
    var iş :Yapilacakİsler?
    var yapilacakIsDetayPresnterNesnesi:ViewToPresenterYapilacakIsDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YapilacakIsDetayRouter.createModule(ref: self)
        
        if let İ = iş {
            tfYapilacakİs.text = İ.yapilacak_is
        }

        
    }
    
   
    @IBAction func buttonGüncelle(_ sender: Any) {
        if let yi = tfYapilacakİs.text,let İ = iş {
            yapilacakIsDetayPresnterNesnesi?.guncelle(kisi_id: İ.kisi_id!, yapilacak_is: yi)
            
        }
    }

}
