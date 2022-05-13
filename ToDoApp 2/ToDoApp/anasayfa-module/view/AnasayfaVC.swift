//
//  ViewController.swift
//  ToDoApp
//
//  Created by Merve Solak on 9.05.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var YapilacakIslerTableView: UITableView!
    
    var yapilacaklarListesi = [Yapilacakİsler]()
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        YapilacakIslerTableView.delegate = self
        YapilacakIslerTableView.dataSource = self
        
        veritabaniKopyala()
        
        AnasayfaRouter.createModule(ref: self)
        
        anasayfaPresenterNesnesi?.IsleriAl()
    }
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.IsleriAl()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let iş = sender as? Yapilacakİsler {
                let gidilecekVC = segue.destination as! YapilacakIsDetayVC
                gidilecekVC.iş = iş
                
            }
        }
    }
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "yapilacaklar", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veri tabanı vardır")
            
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{}
            
        }
        
 }
    
}
extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func viweVeriGonder(yapilacaklarListesi: Array<Yapilacakİsler>) {
        self.yapilacaklarListesi = yapilacaklarListesi
        self.YapilacakIslerTableView.reloadData()
    }
}

extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(Kelime: searchText)    }
    
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacakIs = yapilacaklarListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapılacakIslerHucre", for: indexPath) as! TableViewHucre
        
        hucre.yapılacakIsLabel.text = "\(yapilacakIs.yapilacak_is!)"
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (action,view,void) in
            let yapilacakIs = self.yapilacaklarListesi[indexPath.row]
            
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacakIs.yapilacak_is!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in}
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(kisi_id: yapilacakIs.kisi_id!)
        }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacakIs = yapilacaklarListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacakIs)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

