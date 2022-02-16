//
//  LoginView.swift
//  UsernamePasswordSwiftUI
//
//  Created by Michael on 9/9/19.
//

import SwiftUI

extension LoginView {
    
    enum FocusedField {
        
        case username
        case password
        
    }
    
}

struct LoginView: View {
	
	@StateObject var viewModel: ViewModel
    @FocusState var focusedField: FocusedField?
	
	var body: some View {
	
		GeometryReader { geometry in

			VStack {
				
				Spacer().frame(width: 0, height: geometry.size.height / 10 , alignment: .center)
	
                VStack(spacing: 20) {
					
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("Username").smallTitle()
                        TextField("my_username", text: self.$viewModel.username)
                            .focused($focusedField, equals: .username).underline(!$viewModel.validated.wrappedValue && focusedField == .username)
                        
                    }
                     
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("Password").smallTitle()
                        SecureField("my_password", text: self.$viewModel.password).focused($focusedField, equals: .password).underline(!$viewModel.validated.wrappedValue && focusedField == .password)
                        
                    }
                   
                }.onSubmit {
                    
                    if focusedField == .username {
                        
                        focusedField = .password
                        
                    } else if !viewModel.validated {
                        
                        focusedField = .username
                        
                    } else {
                        
                        focusedField = nil
                        
                    }
                    
                }.submitLabel(.go)

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
            LoginView(viewModel: LoginView.ViewModel())
		}
    }
	
}
