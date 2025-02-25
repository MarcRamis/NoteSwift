//
//  CGFloat+Dimensions.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 19/5/23.
//

import Foundation

extension CGFloat {
    
    static var space0: CGFloat { get { return 1 } }
    static var space1: CGFloat { get { return 2 } }
    static var space2: CGFloat { get { return .space1 * 2 } }
    static var space4: CGFloat { get { return .space1 * 4 } }
    static var space8: CGFloat { get { return .space1 * 8 } }
}
