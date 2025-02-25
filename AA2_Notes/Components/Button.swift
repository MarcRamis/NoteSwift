//
//  Button.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 19/5/23.
//

import Foundation
import UIKit

class Button : UIView {
    
    var label: Label?
    typealias OnClick = (Button) -> ()
    var onClick: OnClick = {_ in }
    
    init(_ label: Label? = nil, _ onClick: @escaping OnClick = {_ in } ) {
        super.init(frame: .zero)
        
        self.EnableConstraints()
       
        self.label = label
        if let label = self.label {
            self.addSubview(label)
            label.PinTo(other: self)
        }
        
        self.onClick = onClick
        self.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.OnTap))
        self.addGestureRecognizer(gesture)
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // objective C, tiene que ponerse para poder usar implementaciones de objective C
    @objc func OnTap() {
        self.onClick(self)
    }
}
