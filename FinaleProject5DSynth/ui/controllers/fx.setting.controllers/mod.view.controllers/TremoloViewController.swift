//
//  TremoloViewController.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 04/08/2021.
//

import UIKit

class TremoloViewController: UIViewController {

    @IBOutlet weak var itemsStack: UIStackView!
    @IBOutlet weak var itemView: UIView! // איפה שכל הפקדים נמצאים
    
    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var bottomStack: UIStackView!
    
    // new scroll vuew
//    var scrollView:UIScrollView  = {
//        let scrollView = UIScrollView()
//        scrollView.contentSize = CGSize(width: 410, height: 200)
//        return scrollView
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // check רק אם  איפון
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            loadScrollView()
        }
    }

    func loadScrollView(){
        
     //   self.view.frame.size = CGSize(width: 410, height: 240)

        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))

        scrollView.contentSize.width = 400
        self.view.addSubview(scrollView)
        addConstrains(scrollView, view)

        
        scrollView.addSubview(itemsStack)
        
        addConstrains(itemsStack, scrollView)
        
        //scrollView.addSubview(itemView)
//        addConstrains(itemView)
//        itemView.isUserInteractionEnabled = true
//        itemView.frame = CGRect(x: 0 , y: 0, width: scrollView.frame.width, height: 200)

        
    }
    
    func addConstrains(_ view:UIView, _ viewTo:UIView){
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: viewTo.topAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: viewTo.rightAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: viewTo.leftAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: viewTo.bottomAnchor).isActive = true
        
    }
}
