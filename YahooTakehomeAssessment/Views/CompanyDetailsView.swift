//
//  CompanyDetailsView.swift
//  YahooTakehomeAssessment
//
//  Created by Jayme Becker on 4/1/25.
//

import SwiftUI

/// Simple SwiftUI view to show the details of a company when tapped on from the CompaniesListView
struct CompanyDetailsView: View {
    let company: Company
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(company.symbol)
                .font(.title)
                .bold()
            Text(company.name)
                .font(.title2)
                .bold()
            MarketCapView(marketCap: company.marketCap)
        }
    }
}


/// Simple SwiftUI view to display a companies specific market cap values
struct MarketCapView: View {
    let marketCap: MarketCap
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Market Cap: $\(marketCap.formatted)")
            Text("Market Cap long: $\(marketCap.longFormat)")
            Text("Raw value: $" + String(format: "%.2f", marketCap.raw))
        }
    }
}
