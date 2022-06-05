//
//  customButton.swift
//  lab10
//
//  Created by jerry on 2022/6/1.
//
import SwiftUI
import Foundation
struct customButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title, action: action)
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(8)
    }
}
