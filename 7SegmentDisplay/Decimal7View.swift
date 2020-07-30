//
//  Decimal7View.swift
//  7SegmentDisplay
//
//  Created by 游宗諭 on 2020/7/30.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import SwiftUI
struct Decimal7View:View {
    let i:CGFloat = 20
    let i2:CGFloat =  1.2
    var body: some View {
        GeometryReader {
            proxy in
            VStack {
                SegmentTextV("a")
                    .frame(width: proxy.size.width / self.i2,
                           height: proxy.size.height / self.i)
                HStack() {
                    SegmentTextH("f")
                    Spacer(minLength: proxy.size.width * 3 / 4)
                    SegmentTextH("b")
                }
                SegmentTextV("g")
                    .frame(width: proxy.size.width / self.i2,
                           height: proxy.size.height / self.i)
                
                HStack {
                    SegmentTextH("e")
                    Spacer(minLength: proxy.size.width * 3 / 4)
                    SegmentTextH("c")
                }
                Divider()
                SegmentTextV("d")
                    .frame(width: proxy.size.width / self.i2,
                       height: proxy.size.height / self.i)
            }
        }
    .padding()
    }
}


struct SegmentTextH:View {
    init(_ text: String) {
        self.text = text
    }
    
    var text:String
    var body: some View{
        GeometryReader {
            (proxy:GeometryProxy) in
            Text(self.text)
                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                .background(Color.red)
                .foregroundColor(Color.white)
                .font(.title)
                .cornerRadius(.infinity)
        }
    }
}
struct SegmentTextV:View {
    init(_ text: String) {
        self.text = text
    }
    
    var text:String
    var body: some View{
        GeometryReader {
            (proxy:GeometryProxy) in
            Text(self.text)
                .frame(width: proxy.size.width , height: proxy.size.height, alignment: .center)
                .background(Color.red)
                .foregroundColor(Color.white)
                .font(.title)
                .cornerRadius(.infinity)
        }
    }
}

struct Decimal7View_Previews: PreviewProvider {
    static var previews: some View {
        Decimal7View()
    }
}
