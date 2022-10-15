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
    
    static func getPortion(ingredient:Ingredient, recipeServings: Int, targetServings:Int) ->String {
        
        var portion = ""
        
        var numerator = ingredient.num ?? 1
        
        var demomenator = ingredient.demon ?? 1
        
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            demomenator *= recipeServings
            
            numerator *= targetServings
                    
        let gcd = Rational.greatestCommonDivisor(numerator, demomenator)
            
        numerator /= gcd
            
        demomenator /= gcd
            
            if numerator > demomenator {
                wholePortions = numerator / demomenator
                numerator = numerator % demomenator
                portion += String(wholePortions)
            }
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += String(numerator) + "/" + String(demomenator)
            }
            
        
            
            
        }
        
        if portion == "1/1" {portion = "1"}
        
        return portion
    }
}
