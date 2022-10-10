//
//  ContentView.swift
//  Recipe
//
//  Created by Sam Reed on 10/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var recipeModel = RecipeModel()
    
    var body: some View {
        
            NavigationView {
                List(recipeModel.recipes) { r in
                        
                        NavigationLink(
                            destination: {
                                RecipeDetailView(recipe: r)
                            }, label: {
                                
                                HStack{
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        
                                    
                                    Text(r.name)
                                        .font(.headline)
                                        .foregroundColor(Color.purple)
                                }
                                    
                                Text(r.description)
                                    
                            }
                            )
                    
                } // End Nav view
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
