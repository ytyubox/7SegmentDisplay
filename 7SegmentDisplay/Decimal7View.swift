//
//  Decimal7View.swift
//  7SegmentDisplay
//
//  Created by 游宗諭 on 2020/7/30.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import SwiftUI
import Binary7SegmentCore
struct Decimal7View:View {
    var cirCuits: ByteCirCuits
    let i:CGFloat = 20
    let i2:CGFloat =  1.2
    var body: some View {
        GeometryReader {
            proxy in
            VStack {
                SegmentTextV("a", isActive: self.cirCuits.orList[0])
                    .frame(width: proxy.size.width / self.i2,
                           height: proxy.size.height / self.i)
                HStack() {
                    SegmentTextH("f", isActive: self.cirCuits.orList[5])
                    Spacer(minLength: proxy.size.width * 3 / 4)
                    SegmentTextH("b", isActive: self.cirCuits.orList[1])
                }
                SegmentTextV("g", isActive: self.cirCuits.orList[6])
                    .frame(width: proxy.size.width / self.i2,
                           height: proxy.size.height / self.i)
                
                HStack {
                    SegmentTextH("e", isActive: self.cirCuits.orList[4])
                    Spacer(minLength: proxy.size.width * 3 / 4)
                    SegmentTextH("c", isActive: self.cirCuits.orList[2])
                }
                Divider()
                SegmentTextV("d", isActive: self.cirCuits.orList[3])
                    .frame(width: proxy.size.width / self.i2,
                           height: proxy.size.height / self.i)
            }
        }
        .padding()
    }
}


struct SegmentTextH:View {
    init(_ text: String, isActive: Bool) {
        self.text = text
        self.isActive = isActive
    }
    
    var text:String
    var isActive:Bool
    var body: some View{
        GeometryReader {
            (proxy:GeometryProxy) in
            Text(self.text)
                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                .background(self.isActive ? Color.red : Color.gray)
                .foregroundColor(Color.white)
                .font(.title)
                .cornerRadius(.infinity)
        }
    }
}
struct SegmentTextV:View {
    init(_ text: String, isActive: Bool) {
        self.text = text
        self.isActive = isActive
    }
    
    var text:String
    var isActive:Bool
    var body: some View{
        GeometryReader {
            (proxy:GeometryProxy) in
            Text(self.text)
                .frame(width: proxy.size.width , height: proxy.size.height, alignment: .center)
                .background(self.isActive ? Color.red : Color.gray)
                .foregroundColor(Color.white)
                .font(.title)
                .cornerRadius(.infinity)
        }
    }
}

struct Decimal7View_Previews: PreviewProvider {
    static var previews: some View {
        Decimal7View(cirCuits: .init(byte: Byte()))
    }
}
