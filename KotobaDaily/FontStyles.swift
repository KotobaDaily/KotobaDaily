//
//  FontStyles.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/23.
//

import Foundation
import SwiftUI

extension Font {
    
    static var generalTextLarge: Font {
        
        return Font.custom("InterDisplay-Regular", size: 24)
    }
    
    static var generalTextSmall: Font {
        
        return Font.custom("InterDisplay-Regular", size: 16)
    }
    
    static var nameText: Font {
        
        return Font.custom("InterDisplay-Regular", size: 32)
    }
    
}
