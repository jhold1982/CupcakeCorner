//
//  ExampleView1.swift
//  CupcakeCorner
//
//  Created by Justin Hold on 3/20/23.
//

// MARK: Adding Codable conformance for @Published properties

import SwiftUI

class ExampleView1User: ObservableObject, Codable {
	enum CodingKeys: CodingKey {
		case name
	}
	@Published var name = "Justin Hold"
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		name = try container.decode(String.self, forKey: .name)
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(name, forKey: .name)
	}
}

struct ExampleView1: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ExampleView1_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView1()
    }
}
