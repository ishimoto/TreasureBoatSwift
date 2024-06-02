//
//  TBCurrencyField.swift
//
//
//  Created by Alex Nagy on 15.07.2022.
//

import SwiftUI

public struct TBCurrencyField: View {
    
    @ObservedObject public var currency: TBCurrency
    
    public init(_ currency: TBCurrency) {
        self.currency = currency
    }
    
    public var body: some View {
        TextField(currency.title != nil ? currency.title! : "", text: currency.text())
            .currency(currency)
    }
}

