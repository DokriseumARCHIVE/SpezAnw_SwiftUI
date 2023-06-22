//
//  ContentView.swift
//  SpezAnwUebung
//
//  Created by Dustin on 22.06.23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText: String = "";
    @State private var inputNumber: Int = 0;
    @State private var outputText: String = "";
    @State private var objCipher = Cipher();
    @State private var frameWidth: Int = 0;
    @State private var frameHeight: Int = 0;
    
    var body: some View {
        Color(hex: "#151515")
            .ignoresSafeArea() // Ignore just for the color
                .overlay(
                    VStack {
                        
                        TextField("Klartext eingeben", text: self.$inputText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .font(.title)
                            .preferredColorScheme(.light);
                        
                        
                        Spacer()
                            .frame(width: 5.0, height: 5.0);
                        
                        
                        Stepper(value: self.$inputNumber, in: 0...26) {
                            Text("Zahl: \(self.inputNumber)")
                                .foregroundColor(Color(hex: "#ffffff"));
                        }
                        .padding()
//                        .foregroundColor(Color(hex: "#ffffff"))
                        .preferredColorScheme(.dark);
                        
                        
                        
                        
                        Button(action: {
                            self.outputText = self.objCipher.caesarEncrypt(plaintext: self.inputText, keyInput: self.inputNumber);
                        }) {
                            Text("Ausgeben")
                                .foregroundColor(Color(hex: "#000000"))
                                .bold()
                                .padding()
                                .background(Color(hex: "#99ffcc"))
                                .cornerRadius(16);
                        };
                        
                        Button(action: {
                            self.inputText = "";
                            self.outputText = "";
                            self.inputNumber = 0;
                        }) {
                            Text("Zurücksetzen")
                                .foregroundColor(Color(hex: "#000000"))
                                .bold()
                                .padding()
                                .background(Color(hex: "#99ffcc"))
                                .cornerRadius(16);
                        }
                        
                        Spacer();
                        
                        if self.outputText != "" {
                            Text("Verschlüsselter Text:")
                                .foregroundColor(Color(hex: "#000000"))
                                .shadow(radius: 20.0)
                                .blur(radius: 0.2)
                                .font(.title)
                                .monospaced(true);
                            Text(self.outputText)
                                .padding()
                                .background(Color(hex: "#99ffcc"))
                                .clipShape(Capsule())
                                .foregroundColor(Color(hex: "#000000"))
                                .font(.largeTitle)
                                .monospaced(true);
                        }
                        
                    }
                    .background(Color(hex: "#151515"))
                    .padding()
                    .controlSize(.large))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView();
    }
}
