//
//  ViewController.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 03/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var table = UITableView()
    var lapdata: [Lap]?
    override func viewDidLoad() {
        super.viewDidLoad()
        initComp()
    }
    
    func initComp(){
        navigationItem.title = "Laptops Collection"
        table.delegate = self
        table.dataSource = self
        table.register(LCTableViewCell.self, forCellReuseIdentifier: Const.cellid)
        view.addSubview(table)
        table.position(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        getLapData { (data, error) in
            if let temp = data{self.lapdata = temp}
            else{self.alert(tittle: "Info", message: error?.localizedDescription ?? "")}
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Const.showDetail{
            let det = segue.destination as! LCDetailViewController
            if let row =  self.table.indexPathForSelectedRow?.row{
                det.lap = lapdata?[row]
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func alert(tittle: String, message: String){
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: tittle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Const.showDetail, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapdata?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: Const.cellid, for: indexPath) as! LCTableViewCell
        cell.lap = lapdata?[indexPath.row]
        return cell
    }
}

