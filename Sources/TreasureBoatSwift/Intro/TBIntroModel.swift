//
//  TBIntroModel.swift
//
//
//  Created by Ken Ishimoto on 2023/12/17.
//

import Foundation
import SFSafeSymbols

public struct TBIntroModel : Hashable {
    
    public var systemSymbol: SFSymbol
    public var title: String
    public var subTitle: String
    
    public init(systemSymbol: SFSymbol, title: String, subTitle: String) {
        self.systemSymbol = systemSymbol
        self.title = title
        self.subTitle = subTitle
    }
    
    public static func sampleData() -> [TBIntroModel] {
        let msg1 = TBIntroModel(systemSymbol: .dollarsign,
                               title: "Transactions",
                               subTitle: "Keep track of your earnings and expenses.")
        let msg2 = TBIntroModel(systemSymbol: .chartBarFill,
                               title: "Visual Charts",
                               subTitle: "View your transactions using eye-catching graphic representations.")
        let msg3 = TBIntroModel(systemSymbol: .magnifyingglass,
                               title: "Advance Filters",
                               subTitle: "Find the expenses you want by advance search and filtering.")

       return [msg1, msg2, msg3]
    }
}
