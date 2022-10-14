//
//  dataService.swift
//  Recipe
//
//  Created by Sam Reed on 10/9/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        if pathString != nil {
            
            let url = URL(fileURLWithPath: pathString!)
            
            do {
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                    
                    //Add unique ids to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                return recipeData
                
            }
            catch {
                
            }
        }
        
        return [Recipe]()

    }
    
}
