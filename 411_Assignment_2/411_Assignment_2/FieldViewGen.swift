//
//  FieldViewGen.swift
//  411_Assignment_2
//
//  Created by Abid Bakhtiyar on 11/25/20.
//

import UIKit

class FieldViewGen {
    var labelName : String
    var vals : UITextField
    var valV : UIStackView
    var labelV : UIStackView
    
    init(n : String) {
        labelName = n
        vals = UITextField()
        valV = UIStackView()
        labelV = UIStackView()
    }
    
    func gen() -> UIStackView {
        let stacks = UIStackView()
        stacks.axis = .horizontal
        stacks.distribution = .fill
        stacks.spacing = 15
        
        let label = UILabel()
        label.text = labelName
        label.font = UIFont(name : "Arial-Bold", size : 12)
        label.sizeToFit()
        labelV.addArrangedSubview(label)
        stacks.addArrangedSubview(labelV)
        
        if labelName == "Status" {
            vals.isUserInteractionEnabled = false
            vals.text = "<Status Message>"
            vals.font = UIFont(name : "Arial-Italic", size : 12)
        }
        
        vals.borderStyle = UITextField.BorderStyle.roundedRect
        valV.addArrangedSubview(vals)
        stacks.addArrangedSubview(valV)
        stacks.layoutMargins = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        stacks.isLayoutMarginsRelativeArrangement = true
        stacks.spacing = 15
        
        return stacks
    }
}

