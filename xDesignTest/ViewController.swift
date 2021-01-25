//
//  ViewController.swift
//  xDesignTest
//
//  Created by Personal on 25/01/2021.
//

import UIKit
import MunroLibrary

class ViewController: UIViewController {

    var data: String!
    var munroTab: [Munro]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///load CSV data
        do {
            data = try CSVHelper.getData(from: "munrotab_v6.2")
        } catch {
            print(error.localizedDescription)
        }
        munroTab = CSVHelper.parseCSVData(from: data)
        
        // MARK: - Library example
        ///search by hill category with no preference provided:
        //print(munroTab.searchByHillCategory())
        
        ///search by hill category with preference:
        //print(munroTab.searchByHillCategory(by: .MUN))
        //print(munroTab.searchByHillCategory(by: .TOP))
        //print(munroTab.searchByHillCategory(by: .EITHER))
        
        ///order by height
        //print(munroTab.orderByHeight(by: .ascending))
        //print(munroTab.orderByHeight(by: .descending))
        
        ///order alphabetically
        //print(munroTab.orderAlphabetically(by: .ascending))
        //print(munroTab.orderAlphabetically(by: .descending))
        
        ///return limited results
        //print(munroTab.returnLimitedElements(of: 10))
        
        ///set minimum height threshold
        do {
            ///set minimum height threshold
            //print(try munroTab.minimumHeight(meters: 1200))
            //print(try munroTab.minimumHeight(meters: 2500))
            
            ///set maximum height threshold
            //print(try munroTab.maximumHeight(meters: 910))
            //print(try munroTab.maximumHeight(meters: 400))
            
            ///combined name and height criteria
            //print(try munroTab.combineSortCriteria(by: .height, and: .name))
            
            ///example of any combination of the above
            print( try munroTab.maximumHeight(meters: 950).searchByHillCategory(by: .TOP).combineSortCriteria(by: .height, and: .name).returnLimitedElements(of: 3))
        } catch {
            print(error.localizedDescription)
        }
    }
}

