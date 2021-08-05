//
//  SettingTableViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 05/08/2021.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    let dataSource = SettingDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.synthSettingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = dataSource.synthSettingList[indexPath.row]
        cell.textLabel?.text = item.title
        cell.textLabel?.backgroundColor = item.color
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        chooseVC(selectedRow: dataSource.synthSettingList[indexPath.row].settingList ?? SettingListItems.synth)
        
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func chooseVC(selectedRow: SettingListItems){
        
        
        switch selectedRow {
        case .synth:
            print(selectedRow.rawValue)
        case .pitch:
            print(selectedRow.rawValue)
        case .distoration:
            print(selectedRow.rawValue)
        case .modulation:
            print(selectedRow.rawValue)
        case .reverb:
            print(selectedRow.rawValue)
        case .delay:
            print(selectedRow.rawValue)
        case .eq:
            print(selectedRow.rawValue)
        }
 
        
    }

}


