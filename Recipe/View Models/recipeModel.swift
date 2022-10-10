//
//  recipeModel.swift
//  Recipe
//
//  Created by Sam Reed on 10/9/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData()
    }
    
    
}
