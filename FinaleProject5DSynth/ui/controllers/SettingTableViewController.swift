//
//  SettingTableViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 05/08/2021.
//

import UIKit

class SynthTableViewController: UITableViewController {
    
    let synthSettingList:[SynthDataSource] = [
        SynthDataSource(title: SettingListItems.synth.rawValue, color: .purple, settingList: .synth),
        SynthDataSource(title: SettingListItems.pitch.rawValue, color: .systemPurple, settingList: .pitch),
        SynthDataSource(title: SettingListItems.distoration.rawValue, color: .systemOrange, settingList: .distoration),
        SynthDataSource(title: SettingListItems.modulation.rawValue, color: .systemBlue, settingList: .modulation),
        SynthDataSource(title: SettingListItems.reverb.rawValue, color: .systemRed, settingList: .reverb),
        SynthDataSource(title: SettingListItems.delay.rawValue, color: .systemGreen, settingList: .delay),
        SynthDataSource(title: SettingListItems.eq.rawValue, color: .systemYellow, settingList: .eq)]
    
    

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
        return synthSettingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = synthSettingList[indexPath.row]
        cell.textLabel?.text = item.title
        cell.textLabel?.backgroundColor = item.color
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name:"Charter Roman",size:36)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        chooseVC(selectedRow: synthSettingList[indexPath.row].settingList ?? SettingListItems.synth)
        
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



enum SettingListItems: String {
    case synth = "Synth"
    case pitch = "Pitch"
    case distoration = "Distoration"
    case modulation = "Modulation"
    case reverb = "Reverb"
    case delay = "Delay"
    case eq = "EQ"
}
