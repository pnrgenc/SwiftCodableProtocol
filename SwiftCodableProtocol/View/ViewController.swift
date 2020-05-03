//
//  ViewController.swift
//  SwiftCodableProtocol
//
//  Created by Pınar Genç on 3.05.2020.
//  Copyright © 2020 Pınar Genç. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var currencyListViewModel : HeroListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
      
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/pnrgenc/testjson/master/dota.json")!
                     DataService().downloadHeroes(url: url) { (currencies) in
                         if let currencies = currencies{
                            self.currencyListViewModel = HeroListViewModel(heroList: currencies.heroes)
                           
                           DispatchQueue.main.async {
                               self.tableView.reloadData()
                           }
                         }
                     }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencyListViewModel == nil ? 0 : self.currencyListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoCellTableViewCell
        cell.lblName.text = currencyListViewModel.currencyAtIndex(indexPath.row).name
        cell.heroImage.sd_setImage(with: URL(string: self.currencyListViewModel.currencyAtIndex(indexPath.row).imageURL))
        return cell
        
    }
}

