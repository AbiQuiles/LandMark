/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    //.border(Color.red)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    
                    withAnimation(.easeInOut(duration: 0.4)) {
                    //withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(Image.Scale.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //.animation(nil, value: showDetail)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        //.animation(.spring, value: showDetail)
                }
            }

            if showDetail {
                //Reminder: This animation is able also because we added 'withAnimation' to the action of the button
                HikeDetail(hike: hike)
                    .transition(.tralingInAndOut)
            }
        }
    }
}

//Our Own
extension AnyTransition {
    static var tralingInAndOut: AnyTransition {
        AnyTransition.move(edge: .trailing)
//        .asymmetric(
//            insertion: .move(edge: .trailing).animation(.easeIn(duration: 0.3)),
//            removal: .move(edge: .trailing).animation(.easeOut(duration: 0.3))
//        )
    }
}

//Apples Example
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
