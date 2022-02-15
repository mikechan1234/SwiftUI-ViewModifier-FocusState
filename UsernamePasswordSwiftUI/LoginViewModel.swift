//
//  LoginViewModel.swift
//  UsernamePasswordSwiftUI
//
//  Created by Michael on 12/9/19.
//  Copyright © 2019 UBS. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
	
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
			
		}.assign(to: \LoginViewModel.validated, on: self)
		
	}
	
}
