//
//  UIFont+Resize.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 19/5/23.
//

import Foundation
import UIKit

extension UIFont {
    
    static func SizeByStyle(_ style: TextStyle) -> CGFloat {
        return UIFont.preferredFont(forTextStyle: style).pointSize
    }
    
    static func FontByStyle(_ style: TextStyle) -> UIFont {
        
        let size = SizeByStyle(style)
        
        switch(style)
        {
        case .largeTitle:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .title1:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .title2:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .title3:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .headline:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .subheadline:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .body:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .callout:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .footnote:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .caption1:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .caption2:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        default:
            return UIFont.preferredFont(forTextStyle: style)
        }
    }
    
}
