//
//  EndpointLoader.swift
//  YahooTakehomeAssessment
//
//  Created by Jayme Becker on 4/1/25.
//

import Foundation

/// Protocol for the endpoint loader so that it can be easily tested if needed
protocol EndpointLoadable {
    func fetchData() async -> [Company]
}

/// Stuct that handles loading of the endpoint API data (company information + market cap)
struct EndpointLoader: EndpointLoadable {
    
    func fetchData() async -> [Company] {
        guard let url = URL(string: "https://us-central1-fbconfig-90755.cloudfunctions.net/getAllCompanies") else {
            return []
        }
        
        do {
            // fetch the data
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // parse the data
            let companies = try JSONDecoder().decode([Company?].self, from: data)
            
            // filter out the nil values
            let filteredCompanies = companies.compactMap { company in
                return company
            }
            
            // return the data
            return filteredCompanies
        } catch {
            // in a production level applicaetion, we would handle this error gracefully and in a better manner than printing the error received
            print("There was an error fetching the company data: \(error)")
            return []
        }
    }
}
