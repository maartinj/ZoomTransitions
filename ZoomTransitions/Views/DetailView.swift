//
//  DetailView.swift
//  ZoomTransitions
//
//  Created by Marcin Jędrzejak on 25/10/2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    let image: MyImage
    var body: some View {
        Image(image.imageName)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                }
            }
    }
}

#Preview {
    NavigationStack {
        DetailView(image: MyImage.samples[0])
    }
}
