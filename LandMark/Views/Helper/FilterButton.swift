//
//  FilterButton.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/11/24.
//

import SwiftUI

struct FilterButton: View {
    @Binding var filter: Bool
    
    var body: some View {
        Button {
            filter.toggle()
        } label: {
            Label(
                "Toggle Filter",
                systemImage: filter ?
                "line.horizontal.3.decrease.circle.fill"
                :"line.horizontal.3.decrease.circle"
            )
        }
    }
}

#Preview {
    FilterButton(filter: .constant(false))
}


//Different Way (Longer); Did it myself 😅
//        Button(action: {filter.toggle()}) {
//            Image(systemName: filter ?
//                  "line.horizontal.3.decrease.circle.fill"
//                  :"line.horizontal.3.decrease.circle"
//            )
//            .foregroundColor(.blue)
//        }
//        .onTapGesture {
//            withAnimation {
//                filter.toggle()
//            }
//        }
