//
//  AssignmentText.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation
import SwiftUI

struct AssignmentText: View {
    let text: String
    let data: ItemData?
    
    init(text: String, data: ItemData?) {
        self.text = text
        self.data = data
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(text)
                .font(.headline)
                .foregroundColor(.black)
            if let color = data?.color {
                getSubtext(initialText: "Color", value: color)
            }
            if let capacity = data?.capacity {
                getSubtext(initialText: "Capacity", value: capacity)
            }
            if let price = data?.price {
                getSubtext(initialText: "Price", value: "$\(price)")
            }
        }
    }
    
    @ViewBuilder
    private func getSubtext(initialText: String, value: String) -> some View {
        Text("\(initialText): \(value)")
            .font(.subheadline)
            .foregroundStyle(.gray)
    }
}
