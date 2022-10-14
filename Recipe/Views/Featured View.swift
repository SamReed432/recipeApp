//
//  Featured View.swift
//  Recipe
//
//  Created by Sam Reed on 10/14/22.
//

import SwiftUI

struct Featured_View: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured Recipies")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                .bold()
            
            GeometryReader{ geo in
                
                TabView {
                    
                    
                    ForEach (0..<model.recipes.count){ index in
                        
                        if model.recipes[index].featured == true {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack{
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .font(.headline)
                                        .padding(.bottom, 7.0)
                                        
                                }
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red:0, green: 0, blue: 0, opacity: 0.5), radius: 15, x:-5, y:5)
                        }
                        
                    }
                    
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode:.always))
                
            }
            
            VStack(alignment: .leading){
                Text("Prep Time")
                Text("1 Hour")
                Text("Highlights")
                Text("Healthy Hearty")
            }
            .padding([.leading, .bottom])
        }// End VStack1
    
        
    }
}

struct Featured_View_Previews: PreviewProvider {
    static var previews: some View {
        Featured_View()
            .environmentObject(RecipeModel())
    }
}
