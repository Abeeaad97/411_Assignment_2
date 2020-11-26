//
//  ViewController.swift
//  411_Assignment_2
//
//  Created by Abid Bakhtiyar on 11/24/20.
//

import UIKit

class ViewController: UIViewController {
    
    var v = [UITextField]()
    var views = [UIStackView]()
    
    @objc func buttononclick(_sender : UIButton){
        let t : String = v[0].text!
        let d : String = v[1].text!
        if (t == "") || (d == ""){
            v[2].text = "Failed to add claim. Please enter the correct values"
        }
        else{
            let cObj = claim(t_:t, d_:d)
            let cService = claimServ()
            v[0].text = ""
            v[1].text = ""
            cService.addClaim(cObj: cObj)
            do{
                sleep(1)
            }
            v[2].text = cService.claimResp
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Stackview setup
        let sView = UIStackView()
        sView.axis = .vertical
        sView.distribution = .fill
        sView.spacing = 15
        
        //title label
        let t = UILabel()
        t.text = "Please Enter Claim Information"
        t.font = UIFont(name: "Arial", size: 24)
        t.textAlignment = .center
        t.sizeToFit()
        
        let claimGen = FieldViewGen(n: "Claim Title")
        let claimView = claimGen.gen()
        v.append(claimGen.vals)
        views.append(claimGen.valV)
        
        let dGen = FieldViewGen(n: "Date")
        let dView = dGen.gen()
        v.append(dGen.vals)
        views.append(dGen.valV)
        
        let butGen = Buttons()
        let butView = butGen.gen()
        
        let statGen = FieldViewGen(n: "Status")
        let statView = statGen.gen()
        v.append(statGen.vals)
        
        sView.isLayoutMarginsRelativeArrangement = true
        sView.addArrangedSubview(t)
        sView.addArrangedSubview(claimView)
        sView.addArrangedSubview(dView)
        sView.addArrangedSubview(butView)
        sView.addArrangedSubview(statView)
        view.addSubview(sView)
        
        for i in 0...views.count-1 {
            views[i].translatesAutoresizingMaskIntoConstraints = false
            let constStr = views[i].leadingAnchor.constraint(equalTo: views[0].leadingAnchor)
            constStr.isActive = true
        }
        
        butView.translatesAutoresizingMaskIntoConstraints = false
        let butCon = butView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -50)
        butCon.isActive = true
        sView.translatesAutoresizingMaskIntoConstraints = false
        let topCon = sView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        topCon.isActive = true
        let leadCon = sView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        leadCon.isActive = true
        let trailCon = sView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        trailCon.isActive = true
        
        let addButton = butGen.button
        addButton.addTarget(self, action: #selector(buttononclick(_sender:)), for: .touchUpInside)
        
        
        
    }


}

