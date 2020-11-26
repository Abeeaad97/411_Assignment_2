//
//  Buttons.swift
//  411_Assignment_2
//
//  Created by Abid Bakhtiyar on 11/25/20.
//

import UIKit

class Buttons {
    let button = UIButton()
    
    func gen() -> UIStackView{
        let butStack = UIStackView()
        butStack.axis = .horizontal
        butStack.distribution = .fill
        butStack.spacing = 15
        button.setTitle("        Add", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        butStack.addArrangedSubview(button)
        
        return butStack
    }
}
