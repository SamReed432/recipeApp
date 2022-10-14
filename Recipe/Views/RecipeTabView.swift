//
//  RecipeTabView.swift
//  Recipe
//
//  Created by Sam Reed on 10/9/22.
//

import SwiftUI

struct RecipeTabView: View {
    
    var body: some View {
        TabView{
            Featured_View()
                .tabItem{
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            ContentView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("Recipies")
                    }
                }
            
            
            
            
        }.environmentObject(RecipeModel())//End Tab View
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
