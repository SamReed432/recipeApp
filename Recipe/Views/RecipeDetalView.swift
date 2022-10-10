//
//  RecipeDetailView.swift
//  List Practice
//
//  Created by Sam Reed on 10/9/22.
//  Copyright © 2022 Sam Reed. All rights reserved.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            Image(recipe.image).resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Spacer()
            
            Text(recipe.name).bold()
            
            Spacer()
            
            Text(recipe.description)
            Spacer()
            HStack {
                Spacer()
                Text("Cook Time")
                Spacer()
                Text("Prep Time")
                Spacer()
                Text("Total Time")
                Spacer()
            }.underline()
            
            Spacer()
            
            HStack {
                Spacer()
                
                Text(recipe.cookTime)
                Spacer()
                Text(recipe.prepTime)
                Spacer()
                Text(recipe.totalTime)
                Spacer()
                Spacer()
            }
            
            VStack{
                Spacer()
                Text("Cooking Instructions").font(.title2).underline()
                
                Spacer()
                Spacer()
                
                ForEach(0...recipe.directions.count-1, id:\.self) { index in
                   
                    HStack{
                        Text(String(index + 1) + ". ").foregroundColor(Color.purple).bold()
                        Text(recipe.directions[index])
                        
                    }
                    
                }
                Spacer()
                Text("Ingredients").font(.title2).underline()
                
                Spacer()
                Spacer()
                
                ForEach(0...recipe.directions.count-1, id:\.self) { index in
                   
                    HStack{
                        
                        Text(recipe.ingredients[index])
                        
                    }
                    
                }
            }
            
             
            
            
            
            }//End Scroll View
        }
    }


struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create a dummy recipe so we can preveiw
        let model = RecipeModel()
        
        
        
        RecipeDetailView(recipe: model.recipes[1])
    }
}
