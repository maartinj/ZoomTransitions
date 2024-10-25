//
// ----------------------------------------------
// Original project: ZoomTransitions
// by  Stewart Lynch on 2024-07-16
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
// ----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.


import SwiftUI

struct PhotoGridView: View {
    @Namespace private var transitionNamespace
    let columns = [GridItem(.adaptive(minimum: 175))]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(MyImage.samples) { photo in
                        NavigationLink(value: photo) {
                            Image(photo.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 175, height: 175)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                                .matchedTransitionSource(id: photo, in: transitionNamespace)
                        }
                    }
                }
            }
            .navigationDestination(for: MyImage.self) { image in
                DetailView(image: image)
                    .navigationTransition(.zoom(sourceID: image, in: transitionNamespace))
            }
            .navigationTitle("My Images")
            .padding()
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    PhotoGridView()
}
