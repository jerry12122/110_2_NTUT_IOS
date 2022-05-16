//
//  NumberImage.swift
//  lab7
//
//  Created by jerry on 2022/5/16.
//

import SwiftUI
struct NumberImage: View {
    let number: Int
    var body: some View {
        Image(systemName: "\(number).circle.fill")
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}
