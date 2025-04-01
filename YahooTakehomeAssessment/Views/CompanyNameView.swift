//
//  CompanyNameView.swift
//  YahooTakehomeAssessment
//
//  Created by Jayme Becker on 4/1/25.
//

import SwiftUI

/// Simple SwiftUI view to display a company name and logo
struct CompanyNameView: View {
    let name: String
    
    @State private var isFavorite = false
    
    var body: some View {
        HStack {
            Image(systemName: "dollarsign.ring") // this is acting as a placeholder image. If there were to be URLs to company logos, I would use the AsyncImageView() from Apple to dynamically load the logos while showing a progress view until they are loaded
            
            // This toggle is here to purely simulate favoriting. Actual implementation of favoriting is not implemented.
            // Since this is purely for simulating, if you scroll the row out of view and back into view, the toggle resets.
            // With actual implementation of this feature, it would correctly save off the favorite state and persist
            Toggle(name, isOn: $isFavorite)
        }
    }
}

