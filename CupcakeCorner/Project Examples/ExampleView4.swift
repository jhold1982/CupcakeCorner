//
//  ExampleView4.swift
//  CupcakeCorner
//
//  Created by Justin Hold on 3/20/23.
//

// MARK: Validating and disabling forms

import SwiftUI

struct ExampleView4: View {
	@State private var username = ""
	@State private var email = ""
    var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("Username", text: $username)
					TextField("Email", text: $email)
				}
				Section {
					Button("Create account") {
						print("Creating account...")
					}
					.disabled(disableForm)
				}
			}
			.navigationTitle("Disabling Forms")
		}
		
    }
	var disableForm: Bool {
		username.count < 5 || email.count < 5
	}
}

struct ExampleView4_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView4()
    }
}
