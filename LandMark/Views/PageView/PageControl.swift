//
//  PageControl.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/12/24.
//

import SwiftUI
import UIKit

//UIKit Implementation with SwiftUI
//For more info: https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit
struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    //Initilization of data
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
            var control: PageControl


            init(_ control: PageControl) {
                self.control = control
            }


            @objc
            func updateCurrentPage(sender: UIPageControl) {
                control.currentPage = sender.currentPage
            }
        }
}


