//
//  ContentView.swift
//  LenguageClausures
//
//  Created by Joaquin Segovia on 21/3/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var chain1="a"
    @State var chain2="bb"
    @State var chain3="𝛌"
    @State var chain4=""
    
    @State var isToggleClausureAll = true
    
    @State var lenguageResult=""
    
    @State var isAlertCanRun = false
    
    var body: some View {
        ZStack{
            Color("DarkBlue")
            ScrollView{
                VStack {
                    VStack {
                        Text("Lenguages Clausures Calculator!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.top,50).padding(.bottom,20)
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Chain 1").font(.caption).foregroundColor(.white).multilineTextAlignment(.leading)
                                TextField("Chain 1", text: $chain1).foregroundColor(.white)
                                Divider().frame(height: 1).background(Color(.white)).padding(.bottom,10)
                                
                                Text("Chain 2").font(.caption).foregroundColor(.white).multilineTextAlignment(.leading)
                                TextField("Chain 2", text: $chain2).foregroundColor(.white)
                                Divider().frame(height: 1).background(Color(.white)).padding(.bottom,10)
                            }
                            
                            VStack(alignment: .leading){
                                Text("Chain 3").font(.caption).foregroundColor(.white).multilineTextAlignment(.leading)
                                TextField("Chain 3", text: $chain3).foregroundColor(.white)
                                Divider().frame(height: 1).background(Color(.white)).padding(.bottom,10)
                                
                                Text("Chain 4").font(.caption).foregroundColor(.white).multilineTextAlignment(.leading)
                                TextField("Chain 4", text: $chain4).foregroundColor(.white)
                                Divider().frame(height: 1).background(Color(.white)).padding(.bottom,10)
                            }
                            
                            
                            ZStack{
                                //                                Color("DarkBlue")
                                Toggle("Clausure * o + ?", isOn: $isToggleClausureAll).foregroundColor(.white)
                            }
                            
                        }.padding(.leading, 10).padding(.trailing, 10)
                        
                        
                        
                    }.padding(.horizontal, 30)
                    
                    
                    
                    VStack {
                        Button(action: {calculateLenguage()}, label: {
                            Text("Run").font(.title).foregroundColor(.white).multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.white), lineWidth: 2).shadow(color: .white, radius: 6))
                        }).padding(.top,20).alert(isPresented: $isAlertCanRun){
                            Alert(title: Text("Error"), message: Text("You must type at least one chain"), dismissButton: .default(Text("Undestood")))
                        }
                        
                        
                        Text("\(lenguageResult)").foregroundColor(.white).multilineTextAlignment(.leading).frame(width:350, height: 100)
                        ZStack{
                            Color("BlueAction")
                            
                            TextField("Result: ", text: $lenguageResult).frame(width:350, height: 50).padding(10).background(Color("BlueAction")).foregroundColor(.white)
                            
                            if lenguageResult.isEmpty{
                                Text("Result: ").foregroundColor(.white).multilineTextAlignment(.leading).frame(width:350, height: 50)
                            }
                            
                        }.cornerRadius(10)
                        
                        
                    }.padding(.horizontal, 30)
                    
                    
                    VStack {
                        Button(action: {copyResult()}, label: {
                            Text("Copy").font(.subheadline).foregroundColor(.white).multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.white), lineWidth: 2).shadow(color: .white, radius: 6))
                        }).padding(.top,20)
                    }.padding(.horizontal, 150)
                    
                    Spacer().frame(width: 1, height: 400)
                    
                }
            }.padding(.leading, 10).padding(.trailing, 10)
        }.ignoresSafeArea()
        
        
    }
    
    func calculateLenguage() {
        UIApplication.shared.keyWindow?.endEditing(true)
        
//        var keyboardDismissMode: UIScrollView.KeyboardDismissMode { get set }
//        keyboardDismissMode
        
//        scrollView.keyboardDismissMode = .interactive
        
        lenguageResult = ""
        
        
        if chain1.isEmpty && chain2.isEmpty && chain3.isEmpty && chain4.isEmpty {
            isAlertCanRun = true
        }else{
            
            print("Get into func")
            var stringToApend = ""
            
            var resultadoAux = ""
            if isToggleClausureAll {
                resultadoAux = resultadoAux + "𝛌, "
            }
            
            
            //        var arrayInit=[chain1, chain2]
            //        var arrayIncremental=[chain1, chain2]
            
            var arrayInit = [String]()
            var arrayIncremental = [String]()
            
            if !chain1.isEmpty {
                arrayInit.append(chain1)
                arrayIncremental.append(chain1)
                resultadoAux = resultadoAux + chain1 + ", "
            }
            if !chain2.isEmpty {
                arrayInit.append(chain2)
                arrayIncremental.append(chain2)
                resultadoAux = resultadoAux + chain2 + ", "
            }
            if !chain3.isEmpty {
                arrayInit.append(chain3)
                arrayIncremental.append(chain3)
                resultadoAux = resultadoAux + chain3 + ", "
            }
            if !chain4.isEmpty {
                arrayInit.append(chain4)
                arrayIncremental.append(chain4)
                resultadoAux = resultadoAux + chain4 + ", "
            }
            
            for i in 1...3 {
                
                for chain in arrayIncremental {
                    print("arrayIncremental.count \(arrayIncremental.count)")
                    print("Founded element \(chain)")
                    
                    for chain2 in arrayInit {
                        stringToApend = chain+chain2
                        arrayIncremental.append(stringToApend)
                        
                        resultadoAux = resultadoAux + chain + chain2 + ", "
                    }
                }
            }
            
            print("resultadoAux \(resultadoAux)")
            
            
//            var unique = Array(Set(arrayIncremental))
//            unique.sort()
//            if isToggleClausureAll {
//                lenguageResult = lenguageResult + "𝛌, "
//            }
//            for chain in arrayInit {
//                lenguageResult = lenguageResult + chain + ", "
//                unique = unique.filter { $0 != chain }
//            }
//            for chain in unique {
//                lenguageResult = lenguageResult + chain + ", "
//            }
            
            
            lenguageResult = resultadoAux
            
            lenguageResult = lenguageResult + " ... "
            
        }
    }
    
    func copyResult() {
        UIPasteboard.general.string = lenguageResult
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
