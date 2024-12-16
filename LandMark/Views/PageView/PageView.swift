//
//  PageView.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/10/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State var currentPage: Int = 0

       var body: some View {
           ZStack(alignment: .bottomTrailing) {
               PageViewController(pages: pages, currentPage: $currentPage)
               PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                   .frame(width: CGFloat(pages.count * 18))
                   .padding(.trailing)
           }
           .aspectRatio(3 / 2, contentMode: .fit)
       }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
