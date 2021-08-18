//
//  GeneralSettingTableViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 17/08/2021.
//

import UIKit

class GeneralSettingTableViewController: UIViewController {
        
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var tableViewAction: UITableView!
    
    var delegate:SettingDelegate?
    var models:[[SettingDataSourceBuilder]] = DataSourceArrays().settingDataSource()
    var model:[SettingDataSourceBuilder] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        
        model = models[0]
  
    }

    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        model = models[sender.selectedSegmentIndex]
        tableViewOutlet.reloadData()
    }
    
}

extension GeneralSettingTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! GeneralSettingTableViewControllerCell
        
        let dataSourceCell = model[indexPath.row]
        cell.settingDelegate = delegate
        cell.setSettingCell(settingDataSourceBuilder: dataSourceCell)
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}
