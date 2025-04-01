//
//  CompaniesListViewModel.swift
//  YahooTakehomeAssessment
//
//  Created by Jayme Becker on 4/1/25.
//

import Foundation
import SwiftUI

/// View modeling protocol to allow for testability in the future
@MainActor
protocol CompaniesListViewModeling {
    var companies: [Company] { get }
    
    func fetchCompanies() async
}

/// Observable view model class that is responsible for fetching and returning the data needed for the CompanyListView
@MainActor
@Observable class CompaniesListViewModel: CompaniesListViewModeling {
    // companies property that will be updated if there are companies returned from the API, otherwise, empty
    var companies: [Company] = []
    private let endpointLoader: EndpointLoader
    
    init() {
        self.endpointLoader = EndpointLoader()
    }
    
    func fetchCompanies() async {
        companies = await endpointLoader.fetchData()
    }
    
}
