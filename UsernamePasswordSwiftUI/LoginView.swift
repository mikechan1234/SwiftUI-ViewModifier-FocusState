//
//  LoginView.swift
//  UsernamePasswordSwiftUI
//
//  Created by Michael on 9/9/19.
//  Copyright © 2019 UBS. All rights reserved.
//

import SwiftUI

struct LoginView: View {
	
	@ObservedObject var viewModel: LoginViewModel
	
	var body: some View {
	
		GeometryReader { geometry in

			VStack {
				
				Spacer().frame(width: 0, height: geometry.size.height / 10 , alignment: .center)
	
				VStack {
					
					TextField("Username", text: self.$viewModel.username)
					SecureField("Password", text: self.$viewModel.password)
					
				}
				
				NavigationLink(destination: ContentView()) {

					Text("Login")

				}.disabled(!(self.$viewModel.validated.wrappedValue))

				Spacer()
				
			}.padding(.horizontal, 15)
			
		}.navigationBarTitle("Binding Basics")
		
	}
	
}

struct LoginView_Previews: PreviewProvider {
	
    static var previews: some View {
		NavigationView {
			LoginView(viewModel: LoginViewModel())
		}
    }
	
}
