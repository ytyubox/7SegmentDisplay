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
    @State var value = 0
    var body: some View {
        VStack {
            Text("Decimal 7 Segment")
            Stepper("", value: self.$byte.value, in: 0...9, step: 1)
                .labelsHidden()
            HStack {
                VStack {
                    Text("A")
                    Toggle(isOn: $byte._A) {
                        Text("A")
                    }
                }
                
                VStack {
                    Text("B")
                    Toggle("",isOn: $byte._B)
                }
                VStack {
                    Text("C")
                    Toggle("",isOn: $byte._C)
                }
                VStack {
                    Text("D")
                    Toggle("",isOn: $byte._D)
                }
                Text(byte.value.description)
            }.labelsHidden()
                .padding(.horizontal)
            Decimal7View(cirCuits: byte.makeDecimal())
                .padding()
        }
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
