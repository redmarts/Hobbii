//
//  ContentView.swift
//  Hobbii
//
//  Created by Martin Dissing Söderlind on 25/08/2020.
//  Copyright © 2020 Martin Söderlind. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
	@EnvironmentObject var loggedInState: LoggedInState
	
    var body: some View {
		VStack {
			if self.loggedInState.loggedIn {
				ProductsListView()
			} else {
				LoginView()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
