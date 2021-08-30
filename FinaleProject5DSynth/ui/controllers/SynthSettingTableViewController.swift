//
//  SynthSettingTableViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 05/08/2021.
//

import UIKit

class SynthSettingTableViewController: UITableViewController {
    
    let synthDataSource = DataSourceArrays()
    let dataSource = DataSourceArrays()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return synthDataSource.synthSettingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = synthDataSource.synthSettingList[indexPath.row]
        cell.textLabel?.text = item.title
        cell.textLabel?.backgroundColor = .white
        cell.textLabel?.textColor = item.color
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name:"Charter Roman",size:36)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let choosenCell = synthDataSource.synthSettingList[indexPath.row].settingList
        performSegue(withIdentifier: "synthDetails", sender: choosenCell)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let dest = segue.destination as? ModelsDetailsTableViewController,
              let type = sender as? SettingListItems
              else {return}
        
        switch type {
        case .synth:
            dest.models = dataSource.synthSettingDataSource()
        case .pitch:
            dest.models = dataSource.pitchSettingSettingDataSource()
        case .distoration:
            dest.models = dataSource.distortionSettingSettingDataSource()
        case .modulation:
            dest.models = dataSource.modulationDataSource()
        case .reverb:
            dest.models = dataSource.reverbSettingSettingDataSource()
        case .delay:
            dest.models = dataSource.delaySettingSettingDataSource()
        case .eq:
            dest.models = dataSource.eqettingSettingDataSource()
        case .nonModel:
            break
        }
        
    }

}


