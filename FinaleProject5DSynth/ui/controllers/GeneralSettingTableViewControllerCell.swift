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
    let generalData = CoreDataManager.shared.getGeneralDataSettings()


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
        valueOutlet.text = String(format: "%.2f", sender.value)
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
            switchOutlet.isOn = getBool()
        case .slider:
            sliderOutlet.isHidden = false
            valueOutlet.isHidden = false
            sliderOutlet.value = getValue()
            valueOutlet.text = String(format: "%.2f", getValue())
        case .segment:
            segmentOutlet.isHidden = false
            segmentOutlet.selectedSegmentIndex = Int(getValue())
        }
    }
    
    func getValue() -> Float{
        
        switch settingItems {
        case .darkMod:
            if let value = generalData?.darkLightMod {
                return Float(value)
            }
        case .inputGain:
            if let value = generalData?.recordInputGain {
                return value
            }
        case .synthInputGain:
            if let value = generalData?.synthRecordGain {
                return value
            }
        case .playbackInputGain:
            if let value = generalData?.playbackRecordGain {
                return value
            }
        default:
            break
        }
        return 0
    }
    
    func getBool() -> Bool{
        
        switch settingItems {
        case .recordPlaybackToo:
            if let value = generalData?.recordPlayback {
                return value
            }
        case .recordCountdown:
            if let value = generalData?.recordCountdown {
                return value
            }
        case .playbackCountdown:
            if let value = generalData?.playbackCountdown {
                return value
            }
        default:
            break
        }
        return false
    }
}

