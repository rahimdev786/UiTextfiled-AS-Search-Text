//
//  ViewController.swift
//  UiTextfiled AS Search Text
//
//  Created by arshad on 4/19/22.
//

import UIKit

class ViewController: UIViewController {
    var data1 = [String]()
    var searchData:[String]!
    var searching = false
    
    @IBOutlet weak var table:UITableView!
    @IBOutlet weak var searchTxt:UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
       data1 =  ["Geeta","Swwty","My lover","Love","Baby","Darling","Garlimi","Hopping Darling ","Seenes","Norways","Londons","SwiterLand"]
        self.searchTxt.delegate = self
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "cellData")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
}


extension ViewController:UISearchBarDelegate{
  
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchData = data1.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        table.reloadData()
        
    }
    
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching =  false
        searchBar.text = ""
        table.reloadData()
    }
    
}


extension ViewController:UITableViewDataSource{
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     if searching{
       return searchData.count
     }
     return data1.count
    }
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellData", for: indexPath)
     if searching{
         cell.textLabel?.text = searchData[indexPath.row]
     }else{
         cell.textLabel?.text = data1[indexPath.row]
     }
       
        return cell
    }
}


