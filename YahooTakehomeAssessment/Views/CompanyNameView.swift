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
    
    var body: some View {
        HStack {
            Image(systemName: "dollarsign.ring") // this is acting as a placeholder image. If there were to be URLs to company logos, I would use the AsyncImageView() from Apple to dynamically load the logos while showing a progress view until they are loaded
            Text(name)
        }
    }
}

