//
//  toptext_Display.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/24.
//

import SwiftUI

struct toptext_Display: View {
    var body: some View {
        HStack {
            Text("Kotoba Daily")
                .font(.generalTextLarge)
                .padding([.top, .leading, .trailing], 16)
        }
    }
}

#Preview {
    toptext_Display()
}
