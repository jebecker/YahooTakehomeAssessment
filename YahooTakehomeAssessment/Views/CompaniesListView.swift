//
//  CompaniesListView.swift
//  YahooTakehomeAssessment
//
//  Created by Jayme Becker on 4/1/25.
//

import SwiftUI

/// SwiftUI view to display a list of companies
struct CompaniesListView: View {
    
    let viewModel = CompaniesListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.companies) { company in
                NavigationLink(destination: CompanyDetailsView(company: company)) {
                    CompanyNameView(name: company.name)
                }
            }
            .navigationTitle("Companies List")
            .overlay {
                if viewModel.companies.isEmpty {
                    ProgressView()
                        .tint(.gray)
                }
            }
        }
        .task {
            await viewModel.fetchCompanies()
        }
    }
}

#Preview {
    CompaniesListView()
}
