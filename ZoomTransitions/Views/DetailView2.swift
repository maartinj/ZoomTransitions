//
//  DetailView2.swift
//  ZoomTransitions
//
//  Created by Marcin Jędrzejak on 25/10/2024.
//

import SwiftUI

struct DetailView2: View {
    let image: MyImage
    let transitionNamespace: Namespace.ID
    var body: some View {
        VStack {
            Image(image.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
            Text(image.name)
                .font(.title)
            Text(image.info)
            Spacer()
        }
        .navigationTransition(.zoom(sourceID: image, in: transitionNamespace))
        .padding()
    }
}

#Preview {
    @Previewable @Namespace var transitionNamespace
    DetailView2(image: MyImage.samples[6], transitionNamespace: transitionNamespace)
}
