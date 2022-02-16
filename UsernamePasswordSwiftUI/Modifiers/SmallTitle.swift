//
//  TextFieldTitle.swift
//  UsernamePasswordSwiftUI
//
//  Created by Michael Chan on 16/02/2022.
//

import SwiftUI

struct SmallTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content.font(.caption).foregroundColor(.primary)
        
    }
    
}

extension View {
    
    func smallTitle() -> some View {
        
        modifier(SmallTitle())
        
    }
    
}
