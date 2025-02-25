//
//  String+Translation.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 19/5/23.
//

import Foundation

extension String {
    var Translated: String{
        get {
            let str = NSLocalizedString(self, tableName: "Translations", comment: "")
            
            if (str == self){
                debugPrint("Esta traducción no existía en el idioma X")
            }
            
            return str
        }
    }
}
