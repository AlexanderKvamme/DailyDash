//
//  ContentView.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 04/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import SwiftUI

let akWhite = Color(NSColor(red: 0.953, green: 0.949, blue: 0.941, alpha: 1.0))
let akWhiter = Color(NSColor(red: 0.996, green: 0.996, blue: 0.996, alpha: 1.0))
let akBlack = Color(NSColor(red: 0.184, green: 0.181, blue: 0.172, alpha: 1.0))

let glamour = "GlamourAbsolute-regular"



struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Welome,\nLord Fresh")
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .foregroundColor(akBlack)
            Text("Daily Dash")
                .font(.headline)
            .foregroundColor(akBlack)
            Spacer()
            HStack(spacing: 20) {
                VStack {
                    Image("sunny")
                    .resizable()
                        .frame(width: 64, height: 64, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    Text("Mostly sunny")
                    .foregroundColor(akBlack)
                    .font(.custom(glamour, size: 32))
            
                
                }
                .frame(width: 200, height: 100, alignment: .center)
                .background(akWhiter)
                .cornerRadius(16)
                
                VStack {
                    Text("22°C")
                        .foregroundColor(akBlack)
                    .font(.custom(glamour, size: 48))
                        .fontWeight(.bold)
                    Text("Celcius")
                    .foregroundColor(akBlack)
                }
                .frame(width: 200, height: 100, alignment: .center)
                .background(akWhiter)
                .cornerRadius(16)
                
                VStack {
                    Text("3 m/s")
                        .foregroundColor(akBlack)
                    .font(.custom(glamour, size: 48))
                    Text("Wind")
                    .foregroundColor(akBlack)
                }
                .frame(width: 200, height: 100, alignment: .center)
                .background(akWhiter)
                .cornerRadius(16)
                
                VStack {
                        Text("Accuracy")
                            .foregroundColor(akBlack)
                            .font(.custom(glamour, size: 48))
                            .fontWeight(.bold)
                        Text("100%")
                        .foregroundColor(akBlack)
                        .font(.custom(glamour, size: 48))
                    }
                    .frame(width: 200, height: 100, alignment: .center)
                    .background(akWhiter)
                    .cornerRadius(16)
            }
            
            Spacer()
        }
        .background(akWhite)
        .onAppear{
            print("test")
            for font in NSFontManager.shared.availableFonts {
                print(font)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
