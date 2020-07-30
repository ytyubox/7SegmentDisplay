//
//  ContentView.swift
//  7SegmentDisplay
//
//  Created by 游宗諭 on 2020/7/30.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import SwiftUI
import Binary7SegmentCore

struct ContentView: View {
    @State var byte = Byte()
    var body: some View {
        Decimal7View()
//        VStack {
//            Text("Hello, World!")
//            Group {
//                Toggle(isOn: $byte._A) {
//                    Text("A")
//                }
//                Toggle(isOn: $byte._B) {
//                    Text("A")
//                }
//                Toggle(isOn: $byte._C) {
//                    Text("A")
//                }
//                Toggle(isOn: $byte._D) {
//                    Text("A")
//                }
//                }.labelsHidden()
//            .padding(.horizontal)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Byte {
    func makeDecimal() -> ByteCirCuits {
        ByteCirCuits(byte: self)
    }
}
