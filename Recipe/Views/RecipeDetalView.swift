//
//  RecipeDetailView.swift
//  List Practice
//
//  Created by Sam Reed on 10/9/22.
//  Copyright © 2022 Sam Reed. All rights reserved.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var recipe:Recipe
    
    @State var numServs = 1
    
    var body: some View {
        
        ScrollView {
            Image(recipe.image).resizable()
                .aspectRatio(contentMode: .fill)
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
            
            VStack(alignment: .leading){
                Spacer()
                Text("Cooking Instructions").font(.title2).underline()
                
                Spacer()
                Spacer()
                
                ForEach(0...recipe.directions.count-1, id:\.self) { index in
                    
                    Text(String(index + 1) + ". " + recipe.directions[index]).foregroundColor(Color(hue: 0.78, saturation: 0.932, brightness: 0.383)).bold()
                    
                    
                } // End Directions Loop
                
                Spacer()
                
                Text("Ingredients:").font(.title2).underline()
                
                Spacer()
                
                    Picker("Select Your Number of Servings:", selection: $numServs) {
                        Text("1").tag(1)
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(.segmented)
                
                
                ForEach(recipe.ingredients) { item in
                    HStack{
                        
                        var tot = RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: numServs)
                        
                        Text("⇴" + tot)
                            .multilineTextAlignment(.leading)
                        
                        
                        if tot != "1" && item.unit != nil && item.num != nil {
                            Text(item.unit! + "s")
                        } else { Text(item.unit ?? "") }
                        
                        Text(item.name)
                            .multilineTextAlignment(.leading)
                        
                    } // End HStack
                } //End For Each
            }
        }.padding(.horizontal, 20.0)
        //End Scroll View
    }
}


struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create a dummy recipe so we can preveiw
        let model = RecipeModel()
        
        
        
        RecipeDetailView(recipe: model.recipes[1])
    }
}
