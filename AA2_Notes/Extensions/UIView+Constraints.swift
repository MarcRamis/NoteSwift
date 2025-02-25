//
//  UIView+Constraints.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 19/5/23.
//

import Foundation
import UIKit

import Foundation
import UIKit

extension UIView {
    
    struct Config {
        let padding: CGFloat = 0
        let type: ContraintType = .Equal
        let safeArea : Bool = true
        let activated: Bool = true
    }
    
    public enum ContraintType {
        case Lesser
        case Equal
        case Greater
    }
    
    @discardableResult func EnableConstraints() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    //MARK: Aligns
    
    @discardableResult func AlignLeftContraint(other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherLeadingAnchor = safeArea ? other.safeAreaLayoutGuide.leadingAnchor : other.leadingAnchor
        
        switch(type)
        {
        case .Lesser:
            constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: otherLeadingAnchor, constant: padding)
        case .Equal:
            constraint = self.leadingAnchor.constraint(equalTo: otherLeadingAnchor, constant: padding)
        case .Greater:
            constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: otherLeadingAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func AlignLeftTo(_ other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true) -> UIView {
        AlignLeftContraint(other: other, padding: padding, type: type,safeArea: safeArea, activated: true)
        return self
    }
    
    @discardableResult func AlignRightContraint(other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true , activated: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherTrailingAnchor = safeArea ? other.safeAreaLayoutGuide.trailingAnchor : other.trailingAnchor
        
        switch(type)
        {
        case .Lesser:
            constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: otherTrailingAnchor, constant: -padding)
        case .Equal:
            constraint = self.trailingAnchor.constraint(equalTo: otherTrailingAnchor, constant: -padding)
        case .Greater:
            constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: otherTrailingAnchor, constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func AlignRightTo(_ other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true) -> UIView {
        AlignRightContraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    @discardableResult func AlignTopContraint(other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherTopAnchor = safeArea ? other.safeAreaLayoutGuide.topAnchor : other.topAnchor
        
        switch(type)
        {
        case .Lesser:
            constraint = self.topAnchor.constraint(lessThanOrEqualTo: otherTopAnchor, constant: padding)
        case .Equal:
            constraint = self.topAnchor.constraint(equalTo: otherTopAnchor, constant: padding)
        case .Greater:
            constraint = self.topAnchor.constraint(greaterThanOrEqualTo: otherTopAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func AlignTopTo(_ other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true) -> UIView {
        AlignTopContraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    @discardableResult func AlignBotContraint(other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherBottomAnchor = safeArea ? other.safeAreaLayoutGuide.bottomAnchor : other.bottomAnchor
        
        switch(type)
        {
        case .Lesser:
            constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: otherBottomAnchor, constant: -padding)
        case .Equal:
            constraint = self.bottomAnchor.constraint(equalTo: otherBottomAnchor, constant: -padding)
        case .Greater:
            constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: otherBottomAnchor, constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func AlignBotTo(_ other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true) -> UIView {
        AlignBotContraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    @discardableResult func AlignCenterHorizontallyTo(_ other: UIView) -> UIView {
        self.centerXAnchor.constraint(equalTo: other.centerXAnchor).isActive = true
        return self
    }
        
    @discardableResult func AlignCenterVerticallyTo(_ other: UIView) -> UIView {
        self.centerYAnchor.constraint(equalTo: other.centerYAnchor).isActive = true
        return self
    }
    
    
    //MARK: Relatives
    
    // hacer los relativos que es lo mismo pero cambiar las variables correspondientes a cada costado que se "origina"
    
    @discardableResult func RelativeLeftConstraint(other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherRightAnchor = safeArea ? other.safeAreaLayoutGuide.rightAnchor : other.rightAnchor
        
        switch(type)
        {
        case .Lesser:
            constraint = self.leftAnchor.constraint(lessThanOrEqualTo: otherRightAnchor, constant: padding)
        case .Equal:
            constraint = self.leftAnchor.constraint(equalTo: otherRightAnchor, constant: padding)
        case .Greater:
            constraint = self.leftAnchor.constraint(greaterThanOrEqualTo: otherRightAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func RelativeLeftTo(_ other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true) -> UIView {
        RelativeLeftConstraint(other: other, padding: padding, type: type,safeArea: safeArea, activated: true)
        return self
    }
    
    @discardableResult func RelativeRightConstraint(other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true , activated: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherLeadingAnchor = safeArea ? other.safeAreaLayoutGuide.leftAnchor : other.leftAnchor
        
        switch(type)
        {
        case .Lesser:
            constraint = self.rightAnchor.constraint(lessThanOrEqualTo: otherLeadingAnchor, constant: -padding)
        case .Equal:
            constraint = self.rightAnchor.constraint(equalTo: otherLeadingAnchor, constant: -padding)
        case .Greater:
            constraint = self.rightAnchor.constraint(greaterThanOrEqualTo: otherLeadingAnchor, constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func RelativeRightTo(_ other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true) -> UIView {
        RelativeRightConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    @discardableResult func RelativeTopConstraint(other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherBottomAnchor = safeArea ? other.safeAreaLayoutGuide.bottomAnchor : other.bottomAnchor
        
        switch(type)
        {
        case .Lesser:
            constraint = self.topAnchor.constraint(lessThanOrEqualTo: otherBottomAnchor, constant: padding)
        case .Equal:
            constraint = self.topAnchor.constraint(equalTo: otherBottomAnchor, constant: padding)
        case .Greater:
            constraint = self.topAnchor.constraint(greaterThanOrEqualTo: otherBottomAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func RelativeTopTo(_ other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true) -> UIView {
        RelativeTopConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    @discardableResult func RelativeBotConstraint(other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherTopAnchor = safeArea ? other.safeAreaLayoutGuide.topAnchor : other.topAnchor
        
        switch(type)
        {
        case .Lesser:
            constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: otherTopAnchor, constant: -padding)
        case .Equal:
            constraint = self.bottomAnchor.constraint(equalTo: otherTopAnchor, constant: -padding)
        case .Greater:
            constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: otherTopAnchor, constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func RelativeBotTo(_ other: UIView, padding: CGFloat = 0, type: ContraintType = .Equal, safeArea: Bool = true) -> UIView {
        RelativeBotConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    //MARK: Helpers
    
    @discardableResult func PinTo(other: UIView, padding: CGFloat = 0, safeArea: Bool = true) -> UIView
    {
        self.EnableConstraints()
            .AlignTopTo(other, padding: padding)
            .AlignLeftTo(other, padding: padding)
            .AlignRightTo(other, padding: padding)
            .AlignBotTo(other, padding: padding)
        return self
    }
    
    @discardableResult func SetHeightConstraint(size: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint

        constraint = self.heightAnchor.constraint(equalToConstant: size)
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult func SetHeight(size: CGFloat) -> UIView {
        SetHeightConstraint(size: size)
        return self
    }
    
    @discardableResult func SetWidthConstraint(size: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint

        constraint = self.widthAnchor.constraint(equalToConstant: size)
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult func SetWidth(size: CGFloat) -> UIView {
        SetWidthConstraint(size: size)
        return self
    }
    
}
