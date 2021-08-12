//
//  SynthDetailsTableViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 11/08/2021.
//

import UIKit

class ModelsDetailsTableViewController: UIViewController {
    
   // let dataSource[
    var type:SettingListItems?
    var dataSource = DataSourceArrays()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
    }
}

extension ModelsDetailsTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.synthSettingList.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "synthDetailsCell", for: indexPath) as! ModelsDetailsTableViewCell
        
        let dataSourceCell = dataSource.synthSettingList[indexPath.row]
        
        cell.setModelCell(synthSettingList: dataSourceCell)
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
