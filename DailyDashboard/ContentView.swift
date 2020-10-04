//
//  ContentView.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 04/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import SwiftUI
import Charts

let akWhite = Color(NSColor(red: 0.953, green: 0.949, blue: 0.941, alpha: 1.0))
let akWhiter = Color(NSColor(red: 0.996, green: 0.996, blue: 0.996, alpha: 1.0))
let akBlack = Color(NSColor(red: 0.184, green: 0.181, blue: 0.172, alpha: 1.0))

let glamour = "GlamourAbsolute-regular"



struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("")
            .frame(height: 30)
            Text("WELCOME,")
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .foregroundColor(akBlack)
                .font(.custom("Futura-Medium", size: 12))
            Text("LORD FRESH")
                .multilineTextAlignment(.center)
                .foregroundColor(akBlack)
                .font(.custom("Futura-Medium", size: 18))
            Text("TO THE")
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .foregroundColor(akBlack)
                .font(.custom("Futura-Bold", size: 8))
                .opacity(0.2)
            
            Divider()

            Text("")
            .frame(height: 30)
            Text("The daily dash")
                .foregroundColor(akBlack)
                .font(.custom(glamour, size: 48))
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
                        .font(.custom(glamour, size: 24))
                    Spacer()
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
                        .font(.custom(glamour, size: 12))
                        .fontWeight(.bold)
                    Text("100%")
                        .foregroundColor(akBlack)
                        .font(.custom(glamour, size: 48))
                }
                .frame(width: 200, height: 100, alignment: .center)
                .background(akWhiter)
                .cornerRadius(16)
            }
            
            
            HStack{
                VStack {
                    Text("Graph")
                        .foregroundColor(akBlack)
                        .font(.custom(glamour, size: 32))
                        .padding()
                    
                    Chart(data: [0, 0.3, 0.2, 0.5, 0.4, 0.9, 0])
                        .chartStyle(
                            LineChartStyle(.quadCurve, lineColor: akBlack, lineWidth: 5)
                    )
                        .padding()
                }
                .frame(width: 400, height: 200, alignment: .center)
                .background(akWhiter)
                .cornerRadius(16)
                
                VStack {
                    Text("Graph")
                        .foregroundColor(akBlack)
                        .font(.custom(glamour, size: 32))
                        .padding()
                    
                    Chart(data: [0, 0.3, 0.2, 0.5, 0.4, 0.9, 0])
                        .chartStyle(
                            LineChartStyle(.quadCurve, lineColor: akBlack, lineWidth: 5)
                    )
                        .padding()
                }
                .frame(width: 400, height: 200, alignment: .center)
                .background(akWhiter)
                .cornerRadius(16)
                
                VStack {
                    Text("Todays clothing")
                        .foregroundColor(akBlack)
                        .font(.custom(glamour, size: 32))
                        .padding()
                    VStack() {
                        HStack {
                            Image("sunny")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .center)
                            VStack(alignment: .leading) {
                                Text("Umbrella")
                                .foregroundColor(akBlack)
                                .font(.custom(glamour, size: 14))
                                Text("Rain over 3mm")
                                .foregroundColor(akBlack)
                            }
                        }
                        //Spacer()
                        HStack {
                            Image("sunny")
                            .resizable()
                            .frame(width: 48, height: 48, alignment: .center)
                            VStack(alignment: .leading) {
                                Text("Umbrella")
                                .foregroundColor(akBlack)
                                .font(.custom(glamour, size: 14))
                                Text("Rain over 3mm")
                                .foregroundColor(akBlack)
                            }
                        }
                        HStack {
                            Image("sunny")
                            .resizable()
                            .frame(width: 48, height: 48, alignment: .center)
                            VStack(alignment: .leading) {
                                Text("Umbrella")
                                .foregroundColor(akBlack)
                                .font(.custom(glamour, size: 14))
                                Text("Rain over 3mm")
                                .foregroundColor(akBlack)
                            }
                        }
                    
                    }.padding()
                }
                .frame(width: 280, height: .none, alignment: .center)
                .background(akWhiter)
                .cornerRadius(16)
                
            }
        .padding()
        }
        .background(akWhite)
        .padding()
        .frame(width: 1000, height: 700, alignment: .center)
        .onAppear(perform: {
            for font in NSFontManager.shared.availableFonts {
                print(font)
            }
        })
        
        
        
        
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
