//
//  GeneralSettingTableViewControllerCell.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 17/08/2021.
//

import UIKit

protocol SettingDelegate {
    func didSetSetting(mod: Int, inputGain: Float, bool: Bool, settingItems: SettingItems)
}

class GeneralSettingTableViewControllerCell: UITableViewCell {
    
    var settingDelegate: SettingDelegate?
    var settingItems: SettingItems = .darkMod
    let sdp = SettingDelegateParameters(numberOfKeys: 2, inputGain: 0.5, bool: false)

    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var valueOutlet: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var btnOutlet: UIButton!
    
    
    @IBAction func btnAction(_ sender: UIButton) {
//        sdp.bool = true
        settingDelegate?.didSetSetting(mod: sdp.mod, inputGain: sdp.inputGain, bool: sdp.bool, settingItems: settingItems)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        valueOutlet.text = String("\(sender.value)")
        sdp.inputGain = sender.value
        settingDelegate?.didSetSetting(mod: sdp.mod, inputGain: sdp.inputGain, bool: sdp.bool, settingItems: settingItems)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        sdp.bool = sender.isOn
        settingDelegate?.didSetSetting(mod: sdp.mod, inputGain: sdp.inputGain, bool: sdp.bool, settingItems: settingItems)
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        sdp.mod = sender.selectedSegmentIndex
        settingDelegate?.didSetSetting(mod: sdp.mod, inputGain: sdp.inputGain, bool: sdp.bool, settingItems: settingItems)
    }
    
    func setSettingCell(settingDataSourceBuilder:SettingDataSourceBuilder){
        
        settingItems = settingDataSourceBuilder.settingItems
        
        titleOutlet.text = settingDataSourceBuilder.title
        valueOutlet.text = "Value"
        sliderOutlet.value = 0
        switchOutlet.isOn = false
        
        btnOutlet.isHidden = true
        valueOutlet.isHidden = true
        sliderOutlet.isHidden = true
        switchOutlet.isHidden = true
        segmentOutlet.isHidden = true
        
        switch settingDataSourceBuilder.actionElementType {
        case .btn:
            btnOutlet.isHidden = false
        case .switchOnOff:
            switchOutlet.isHidden = false
        case .slider:
            sliderOutlet.isHidden = false
            valueOutlet.isHidden = false
        case .segment:
            segmentOutlet.isHidden = false
        }
    }
    

}

