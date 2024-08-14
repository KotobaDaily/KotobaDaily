//
//  FontStyles.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/23.
//

import SwiftUI

extension Font {
    
    static var wotdWordText: Font {
        return Font.custom("NewYorkMedium-Regular", size: 58) // Use PostScript name
    }
    
    static var wotdText: Font {
        return Font.custom("NewYorkMedium-Regular", size: 46) // Use PostScript name
    }
    
    static var generalTextLarge: Font {
        return Font.custom("NewYorkMedium-Regular", size: 32) // Use PostScript name
    }
    
    static var generalTextSmall: Font {
        return Font.custom("NewYorkMedium-Regular", size: 24) // Use PostScript name
    }
    
    static var furigana: Font {
        return Font.custom("NewYorkMedium-Regular", size: 16) // Use PostScript name
    }
    
    static var kanjiText: Font {
        return Font.custom("NewYorkMedium-Regular", size: 52) // Use PostScript name
    }
    
    static var nameText: Font {
        return Font.custom("NewYorkMedium-Regular", size: 32) // Use PostScript name
    }
}
