//
//  ExampleView2.swift
//  CupcakeCorner
//
//  Created by Justin Hold on 3/20/23.
//

// MARK: Sending and receiving Codable data with URLSession and SwiftUI

import SwiftUI

struct Response: Codable {
	var results: [Result]
}

struct Result: Codable {
	var trackId: Int
	var trackName: String
	var collectionName: String
}

struct ExampleView2: View {
	@State private var results = [Result]()
    var body: some View {
		NavigationStack {
			List(results, id: \.trackId) { item in
				VStack(alignment: .leading) {
					Text(item.trackName)
						.font(.headline)
					Text(item.collectionName)
				}
			}
			.task {
				await loadData()
			}
			.navigationTitle("Overscene Songs")
		}
    }
	// iTunes search API
	func loadData() async {
		guard let url = URL(string: "https://itunes.apple.com/search?term=overscene&entity=song") else {
			print("Invalid URL")
			return
		}
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
				results = decodedResponse.results
			}
		} catch {
			print("Invalid data")
		}
	}
}

struct ExampleView2_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView2()
    }
}
