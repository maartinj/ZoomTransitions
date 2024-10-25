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
    @State private var showFull = false
    var body: some View {
        VStack {
            Image(image.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                .matchedTransitionSource(id: image, in: transitionNamespace)
                .onTapGesture {
                    showFull.toggle()
                }
                .fullScreenCover(isPresented: $showFull) {
                    NavigationStack {
                        DetailView(image: image)
                    }
                    .navigationTransition(.zoom(sourceID: image, in: transitionNamespace))
                }
            
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
