//
//  LoginViewModel.swift
//  UsernamePasswordSwiftUI
//
//  Created by Michael on 12/9/19.
//

import Foundation
import Combine

extension LoginView {
    
    class ViewModel: ObservableObject {
        
        @Published var username: String = ""
        @Published var password: String = ""
        @Published var validated: Bool = false {
            didSet {
                objectWillChange.send()
            }
        }
        
        private var validationCancellable: AnyCancellable!
        
        init() {
                            
            let usernameValidation = $username.map { (value) -> Bool in
                
                return value.count > 5
                
            }
            
            let passwordValidation = $password.map { (value) -> Bool in
                
                return value.count > 5
                
            }
            
            validationCancellable = Publishers.CombineLatest(usernameValidation, passwordValidation).map { (values) -> Bool in
                                
                return values.0 && values.1
                
            }.assign(to: \LoginView.ViewModel.validated, on: self)
            
        }
        
    }
    
}


