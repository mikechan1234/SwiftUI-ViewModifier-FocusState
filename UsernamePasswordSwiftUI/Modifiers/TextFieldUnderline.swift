//
//  AlertBorder.swift
//  UsernamePasswordSwiftUI
//
//  Created by Michael Chan on 15/02/2022.
//

import SwiftUI

struct TextFieldUnderline: TextFieldStyle {

    var error: Bool
    
    func _body(configuration: TextField<_Label>) -> some View {
        
        VStack(spacing: 5) {
            
            configuration
            Rectangle().frame(maxWidth: .infinity, maxHeight: 2, alignment: .leading).foregroundColor(error ? Color.red : Color.accentColor)
            
        }
        
    }
    
}

extension View {
    
    func underline(_ alerted: Bool) -> some View {
        
        textFieldStyle(TextFieldUnderline(error: alerted))
        
    }
    
}
