//
//  ViewController.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 03/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import UIKit

class LCViewController: UIViewController {
    
    var table = UITableView()
    var lapdata = [LapCollectionViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initComp()
    }
    
    func initComp(){
        navigationItem.title = "Laptops Collection"
        let image = UIImageView(image: UIImage(named: "placeholder")?.af_imageRoundedIntoCircle())
        image.contentMode = .scaleAspectFit
        navigationItem.titleView =  image
        initTable()
        Service.shared.getLapData { (data, error) in
            if let error = error{self.alert(tittle: "Info", message: error.localizedDescription)
            }
            self.lapdata = data?.map({return LapCollectionViewModel(model: $0)}) ?? []
            DispatchQueue.main.async {
                self.table.reloadData()
            }
            
        }
    }
    
    // MARK: - Navigation 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Const.showDetail1{
            let det = segue.destination as! LCDCollectionViewController
            if let row =  self.table.indexPathForSelectedRow?.row{
                det.lapCollectionViewModel = lapdata[row]
            }
        }
    }
    
    func initTable(){
        table.delegate = self
        table.dataSource = self
        table.register(LCTableViewCell.self, forCellReuseIdentifier: Const.cellid)
        view.addSubview(table)
        table.estimatedRowHeight = 50
        table.rowHeight = UITableView.automaticDimension
        table.position(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }
}

extension LCViewController: UITableViewDelegate, UITableViewDataSource{
    
    func alert(tittle: String, message: String){
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: tittle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Const.showDetail1, sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapdata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: Const.cellid, for: indexPath) as! LCTableViewCell
        cell.lapCollection = lapdata[indexPath.row]
        return cell
    }
}

