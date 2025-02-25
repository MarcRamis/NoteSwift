//
//  Note.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 19/5/23.
//

import Foundation
import UIKit

struct Note : Codable {
    var title: String
    var description: String
    var color: NamedUIColor
}

struct NamedUIColor : Codable {
    var name : String
    
    init(name: String) {
        self.name = name
    }
    
    var Color: UIColor?{
        return UIColor(named: name)
    }
}
