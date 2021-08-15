//
//  SynthDetailsTableViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 11/08/2021.
//

import UIKit

class ModelsDetailsTableViewController: UIViewController {
    
    let mySynth = Synth.shared
    
    // let dataSource[
    var type:SettingListItems?
    var dataSource = DataSourceArrays()
    
    var models:[[ModelsDataSourceBuilder]] = []
    var model:[ModelsDataSourceBuilder] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models = dataSource.modulationDataSource()
        model = models[0]
        tableView.delegate = self
        tableView.dataSource = self
        loadSegment()
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        let inedx = sender.selectedSegmentIndex
        
        model = models[inedx]
        
        tableView.reloadData()
        setModulTypeFromSegment(num: inedx)
    }
    
    func loadSegment(){
        
        segmentOutlet.removeAllSegments()
        
        for num in 0...models.count-1{
            segmentOutlet.insertSegment(withTitle: models[num][0].name, at: num, animated: true)
        }
        
    }
    
    func setModulTypeFromSegment(num: Int){
        
        switch model[0].family {
        case .synth:
            mySynth.setSynthType(type: num)
        case .modulation:
            mySynth.setModulationType(num)
        case .delay:
            mySynth.setDelayType(num)
        case .eq:
            mySynth.eqType(num)
        default:
            break
        }
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
        return model.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "synthDetailsCell", for: indexPath) as! ModelsDetailsTableViewCell
        
        let dataSourceCell = model[indexPath.row]
        
        cell.setModelCell(modelsDataSourceBuilder: dataSourceCell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
