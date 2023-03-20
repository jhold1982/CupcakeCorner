//
//  ExampleView3.swift
//  CupcakeCorner
//
//  Created by Justin Hold on 3/20/23.
//

// MARK: Loading an image from a remote server

import SwiftUI

struct ExampleView3: View {
    var body: some View {
		AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
			if let image = phase.image {
				image
					.resizable()
					.scaledToFit()
			} else if phase.error != nil {
				Text("There was an error loading the image.")
			} else {
				ProgressView()
			}
		}
		.frame(width: 200, height: 200)
    }
}

struct ExampleView3_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView3()
    }
}
