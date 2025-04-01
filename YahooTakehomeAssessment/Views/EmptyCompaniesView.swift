//
//  EmptyCompaniesView.swift
//  YahooTakehomeAssessment
//
//  Created by Jayme Becker on 4/1/25.
//

import SwiftUI

/// Simple empty view used to display text to the user if we have no data
struct EmptyCompaniesView: View {
    var body: some View {
        ScrollView { // embedding in a scroll view allows for pull to refresh when only this text view is showing
            Text("Company data cannot be fetched at this time. Please check back later or try refreshing")
                .padding()
        }
    }
}

