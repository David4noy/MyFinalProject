//
//  FlangerViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 04/08/2021.
//

import UIKit

class FlangerViewController: UIViewController {

    @IBOutlet weak var itemsView: UIView!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var dryWetLabel: UILabel!
    
//
//        var scrollView:UIScrollView  = {
//            let scrollView = UIScrollView()
//            scrollView.contentSize = CGSize(width: 410, height: 200)
//            return scrollView
//        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            loadScrollView()
        }
        
    }
    @IBAction func frequencySlider(_ sender: UISlider) {
    }
    
    @IBAction func depthSlider(_ sender: UISlider) {
    }
    
    @IBAction func feedbackSlider(_ sender: UISlider) {
    }
    @IBAction func dryWetSliderSlider(_ sender: UISlider) {
    }
    
    func loadScrollView(){
        

        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))

        
        view.addSubview(scrollView)
        scrollView.contentSize.width = 400
        addConstrains(scrollView, view)

        
        scrollView.addSubview(itemsView)
        
        addConstrains(itemsView, scrollView)
        
        itemsView.isUserInteractionEnabled = true
       // itemsView.frame = CGRect(x: 0 , y: 0, width: scrollView.frame.width, height: 400)

        
    }
    
    func addConstrains(_ view:UIView, _ viewTo:UIView){
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: viewTo.topAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: viewTo.rightAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: viewTo.leftAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: viewTo.bottomAnchor).isActive = true
        
    }
    
    
}
