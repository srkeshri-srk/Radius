//
//  TableView+ViewController.swift
//  Radius
//
//  Created by Shreyansh Raj Keshri on 29/03/22.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.propertiesVM.properties.facilities[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = propertiesTableView.dequeueReusableCell(withIdentifier: "PropertiesTableViewCell") as! PropertiesTableViewCell
        cell.configureUI(data: self.propertiesVM.properties.facilities[indexPath.section].options[indexPath.row])
        
        if propertiesVM.properties.facilities[indexPath.section].options[indexPath.row].id == propertiesVM.selection[propertiesVM.properties.facilities[indexPath.section].facilityID] {
            cell.outerView.layer.borderColor = propertiesVM.validateSelection() ? UIColor.green.cgColor : UIColor.red.cgColor
            cell.outerView.layer.borderWidth = 2.0
        } else {
            cell.outerView.layer.borderWidth = 0.0
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.propertiesVM.properties.facilities.count
    }
            
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
        headerView.sectionTitleLabel.text = self.propertiesVM.properties.facilities[section].name
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
        
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let facilitiesID = propertiesVM.properties.facilities[indexPath.section].facilityID
        let optionId = propertiesVM.properties.facilities[indexPath.section].options[indexPath.row].id
        propertiesVM.selection[facilitiesID] = optionId
        
        tableView.reloadData()
    }
}
