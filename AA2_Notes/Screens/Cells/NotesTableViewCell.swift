//
//  NotesTableViewCell.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 1/6/23.
//

import Foundation
import UIKit

class MyCell: UITableViewCell{
    static var Id: String {
        return "MyCell"
    }
    
    var relativeRightDescription : NSLayoutConstraint?
    var alignRightDescription : NSLayoutConstraint?
    
    lazy var Title: Label = {
        let label = Label("Title")
        self.contentView.addSubview(label)
        
        label
            .AlignLeftTo(self)
            .AlignTopTo(self)
        
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var Description: TextView = {
        let text = TextView()
        self.contentView.addSubview(text)
        
        text
            .AlignLeftTo(self)
            .AlignBotTo(self)
            .RelativeTopTo(Title)
        
        relativeRightDescription = text.RelativeRightConstraint(other: RemoveButton, activated: false)
        alignRightDescription = text.AlignRightContraint(other: self, activated: false)
        
        return text
    }()
    
    lazy var RemoveButton: Button = {
        let button = Button(Label("-")) { _ in
            debugPrint("remove note")
        }
        self.contentView.addSubview(button)
        
        button
            .AlignCenterVerticallyTo(self)
            .AlignRightTo(self, padding: .space4)
            .SetWidth(size: .ButtonType1).SetHeight(size: .ButtonType1)
        
        button.backgroundColor = .Button_RemoveNote
        
        return button
    }()
    
    func EnableViewMode()
    {
        RemoveButton.isHidden = true
        relativeRightDescription?.isActive = false
        alignRightDescription?.isActive = true
    }
    func EnableEditMode()
    {
        RemoveButton.isHidden = false
        alignRightDescription?.isActive = false
        relativeRightDescription?.isActive = true
    }
}
