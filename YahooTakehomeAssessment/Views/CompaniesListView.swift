//
//  CompaniesListView.swift
//  YahooTakehomeAssessment
//
//  Created by Jayme Becker on 4/1/25.
//

import SwiftUI

enum LoadingState {
    case loading
    case loaded
}

enum CompaniesSortOption {
    case companyName
    case marketCap
}

/// SwiftUI view to display a list of companies
struct CompaniesListView: View {
    @State var initialState: LoadingState = .loading
    @State private var sortOptions: CompaniesSortOption = .companyName
    @State private var searchText = ""
    
    let viewModel = CompaniesListViewModel()
    
    /// property to configure how the list should be sorted
    private var sortedCompanies: [Company] {
        switch sortOptions {
        case .companyName:
            return viewModel.companies.sorted { $0.name < $1.name }
        case .marketCap:
            return viewModel.companies.sorted { $0.marketCap.raw > $1.marketCap.raw }
        }
    }
    
    /// property to support searching in the list
    private var searchResults: [Company] {
        if searchText.isEmpty {
            return sortedCompanies
        } else {
            return sortedCompanies.filter { company in
                company.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            // Show a progress view initially while we are loading the data
            if initialState == .loading {
                ProgressView("Loading...")
            } else {
                // if after loading we do not have any compnaies to display, show Text indicating that
                if viewModel.companies.isEmpty {
                    EmptyCompaniesView()
                } else {
                    // if after loading we have results, show them in a list with the ability to navigate to a detailed view of the company
                    List(searchResults) { company in
                        HStack {
                            NavigationLink(destination: CompanyDetailsView(company: company)) {
                                CompanyNameView(name: company.name)
                            }
                        }
                    }
                    .navigationTitle("Companies List")
                    .toolbar {
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort by", selection: $sortOptions) {
                                Text("Company Name").tag(CompaniesSortOption.companyName)
                                Text("Market Cap").tag(CompaniesSortOption.marketCap)
                            }
                        }
                    }
                    .searchable(text: $searchText)
                }
            }
        }
        .task {
            // on initial load of this view, kick off the API call to fetch
            await viewModel.fetchCompanies()
            initialState = .loaded
        }
        .refreshable {
            // adds the ability to pull down to refresh on the company list
            await viewModel.fetchCompanies()
        }
    }
}
