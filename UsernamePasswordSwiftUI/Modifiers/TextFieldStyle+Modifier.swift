//
//  TextField+ViewModifiers.swift
//  UsernamePasswordSwiftUI
//
//  Created by Michael Chan on 15/02/2022.
//

import SwiftUI

extension View {
    
    func underline(_ alerted: Bool) -> some View {
        
        textFieldStyle(TextFieldUnderline(error: alerted))
        
    }
    
}
