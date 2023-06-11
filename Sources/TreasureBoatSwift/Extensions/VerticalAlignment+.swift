//
//  VerticalAlignment+.swift
//  
//
//  Created by Ken Ishimoto on 2023/06/11.
//

import SwiftUI

extension VerticalAlignment {
    
    /*
     HStack(alignment: .wideAlignment) {
         VStack {
             Text("@twostraws")
                 .alignmentGuide(.wideAlignment) { d in
                     d[VerticalAlignment.center]
                 }
             Image("penguin")
                 .resizable()
                 .frame(width: 64, height: 64)
         }

         VStack {
             Text("Full name:")
             Text("PAUL HUDSON")
                 .alignmentGuide(.wideAlignment) { d in
                     d[VerticalAlignment.center]
                 }
                 .font(.largeTitle)
             Text("xxxxx")
         }
     }
     .frame(width: 800, height: 800)
     */
    
    public struct TBWideAlignment: AlignmentID {
        public static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
 
    public static let wideAlignment = VerticalAlignment(TBWideAlignment.self)
}
