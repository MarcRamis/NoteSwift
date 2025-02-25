//
//  View.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 1/6/23.
//

import Foundation
import UIKit

class View : UIView {
    
    init() {
        super.init(frame: .zero)
        
        self.EnableConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
