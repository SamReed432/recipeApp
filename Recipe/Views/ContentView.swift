//
//  ContentView.swift
//  Recipe
//
//  Created by Sam Reed on 10/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
            NavigationView {
                
                VStack(alignment: .leading, spacing: 30){
                    Text("All Recipes")
                        .bold(true)
                        .padding(.leading)
                        .padding(.top, 40)
                        .font(.largeTitle)
                    
                    ScrollView{
                        
                        LazyVStack(alignment:.leading, spacing: 15){
                            ForEach(model.recipes) { r in
                                
                                NavigationLink(
                                    destination: {
                                        RecipeDetailView(recipe: r)
                                    }, label: {
                                        
                                        VStack(alignment:.leading){
                                            HStack{
                                                Image(r.image)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 50, height: 50, alignment: .center)
                                                    .clipped()
                                                    .cornerRadius(10)
                                                
                                                
                                                Text(r.name)
                                                    .font(.headline)
                                                    .foregroundColor(.black)
                                            }
                                            
                                            
                                        }
                                    }
                                )
                                
                            } // End Nav view
                            .navigationBarHidden(true)
                        }
                        .padding(.leading, 25.0)

                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView().environmentObject(RecipeModel())
    }
}
