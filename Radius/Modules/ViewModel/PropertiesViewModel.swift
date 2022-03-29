//
//  PropertiesViewModel.swift
//  Radius
//
//  Created by Shreyansh Raj Keshri on 28/03/22.
//

import Foundation

protocol PropertiesVMProtocol {
    var properties: PropertiesModel { get set }
    var selection: [String:String] { get set }
    func fetchDetails(completion: ((Bool) -> Void)?)
    func validateSelection() -> Bool
}

class PropertiesViewModel: AlamoServiceProtocol, PropertiesVMProtocol {
    //MARK: - Properties
    var properties = PropertiesModel()
    var selection: [String:String] = [:]
    
    
    //MARK: - Methods
    func fetchDetails(completion: ((Bool) -> Void)? = nil) {
        request(for: PropertiesModel.self, with: "https://my-json-server.typicode.com/iranjith4/ad-assignment/db") { [weak self] result in
            switch result {
            case .success(let data):
                self?.properties = data
                completion?(true)
            case .failure:
                completion?(false)
            }
        }
    }
    
    
    func validateSelection() -> Bool {
        var result: Bool = true
        for exclusion in properties.exclusions {
            var matches = 0
            for item in exclusion where selection[item.facilityID] == item.optionsID  {
                matches += 1
            }
            if (matches == exclusion.count) {
                result = false
                break
            }
        }
        return result
    }
}
