//
//  TextField.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 2/6/23.
//

import Foundation
import UIKit

class TextField : UITextField {
    
    init(_ text: String = "", style: UIFont.TextStyle = .body)
    {
        super.init(frame: .zero)
        
        self.EnableConstraints()
        
        self.text = text
        
        // Esta linea hace que al cambiar los valores de accesibilidad, se cambie el tamaño al momento
        self.adjustsFontForContentSizeCategory = true
        
        self.font = .preferredFont(forTextStyle: style)
        self.isUserInteractionEnabled = false
        self.textAlignment = .left
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
