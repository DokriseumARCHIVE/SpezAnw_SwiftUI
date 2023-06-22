//
//  Cipher.swift
//  SpezAnwUebung
//
//  Created by Dustin on 22.06.23.
//


////////////////////////////////////////////////////////////////////////
///
///         INDEX EXTENSION
///
////////////////////////////////////////////////////////////////////////

struct Cipher {
    private var cipherKey: Int;
    init() {
        self.cipherKey = 0;
    }
    
    func caesarEncrypt(plaintext: String, keyInput: Int) -> String {
        // Definiere das Alphabet als Zeichenkette mit Kleinbuchstaben von 'a' bis 'z'
        let alphabet = "abcdefghijklmnopqrstuvwxyz";
        var encrypted = "";
        @LatinAlphabet var key = keyInput;
        
        for char in plaintext.lowercased() {
            
            if char.isWhitespace {
                encrypted += " ";
            }
            
            if let charIdx = (alphabet.firstIndex(of: char)) {
                let position = alphabet.distance(from: alphabet.startIndex, to: charIdx); // macht ausm Alphabet einen Integer zum rechnen
                let cipherIdx = ((position + key) % alphabet.count);
                print("cipherIdx: " + String(cipherIdx));
                print("char: " + String(char));
                
                let index = alphabet.index(alphabet.startIndex, offsetBy: cipherIdx);
                print("alphabet[index]: " + String(alphabet[index]));
                encrypted += String(alphabet[index]);
            }
        }    
        // Gib den verschlüsselten String zurück
        return encrypted
    }
}
