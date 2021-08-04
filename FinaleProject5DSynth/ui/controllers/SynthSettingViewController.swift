//
//  SynthSettingViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 28/07/2021.
//

import UIKit

class SynthSettingViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var synthSettingTableVC: UITableView!
    @IBOutlet weak var synthSettingView: UIView!
    @IBOutlet weak var modVC: UIView!
    
    
    let synthSettingList:[TitleColor] = [
        TitleColor(title: SettingListItems.synth.rawValue, color: .purple, settingList: .synth),
        TitleColor(title: SettingListItems.pitch.rawValue, color: .systemPurple, settingList: .pitch),
        TitleColor(title: SettingListItems.distoration.rawValue, color: .systemOrange, settingList: .distoration),
        TitleColor(title: SettingListItems.modulation.rawValue, color: .systemBlue, settingList: .modulation),
        TitleColor(title: SettingListItems.reverb.rawValue, color: .systemRed, settingList: .reverb),
        TitleColor(title: SettingListItems.delay.rawValue, color: .systemGreen, settingList: .delay),
        TitleColor(title: SettingListItems.eq.rawValue, color: .systemYellow, settingList: .eq)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        synthSettingTableVC.dataSource = self
        synthSettingView.backgroundColor = .clear
        synthSettingView.isUserInteractionEnabled = true
        synthSettingTableVC.backgroundColor = .clear
        
        synthSettingTableVC.delegate = self
        synthSettingTableVC.dataSource = self
        
        synthSettingView.isHidden = true
        modVC.isHidden = true
                
        

        
    }
    
    
    func chooseVC(selectedRow: SettingListItems){
        
        synthSettingView.isHidden = true
        modVC.isHidden = true
        
        switch selectedRow {
        case .synth:
            synthSettingView.isHidden = false
        case .pitch:
            print(selectedRow.rawValue)
        case .distoration:
            print(selectedRow.rawValue)
        case .modulation:
            modVC.isHidden = false
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

extension SynthSettingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        synthSettingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = synthSettingList[indexPath.row]
        cell.textLabel?.text = item.title
        cell.textLabel?.backgroundColor = item.color
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        chooseVC(selectedRow: synthSettingList[indexPath.row].settingList ?? SettingListItems.synth)
        
    }
    
    
}
