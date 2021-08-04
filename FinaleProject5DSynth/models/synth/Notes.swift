//
//  Notes.swift
//  FirstSynth
//
//  Created by דוד נוי on 22/07/2021.
//

import Foundation

struct Notes {
    
    var totalXOfView: Double
    var numberOfNote: Int
    let xSteps: Double
    
    let step1 = 7.778 // C -> Db
    let step2 = 8.241
    let step3  = 8.713
    let step4  = 9.246
    let step5  = 9.8
    let step6  = 10.383
    let step7  = 11.001
    let step8  = 11.654
    let step9  = 12.348
    let step10  = 13.082
    let step11  = 13.86
    let step12  = 14.684 // B -> C
    
    
    
    init(totalXOfView: Double, numberOfNote: Int = 26) {
        self.totalXOfView = totalXOfView
        self.numberOfNote = numberOfNote
        self.xSteps = totalXOfView / Double(numberOfNote) // נותן את המרחק בין תו לתו
    }
    
    func getNote(touchPoint: Double) -> Double {
        let frequency: Double
        var area = (touchPoint / xSteps).rounded(.towardZero) // נותן מספר שלם - איזה בין תווים זה
        let pointOnArea = touchPoint.truncatingRemainder(dividingBy: xSteps) // מיקום בתוך הסאב ויו
        let precent = pointOnArea / xSteps  // נותן את האחוז לחישוב המרחק המדוייק של התדר
        var multiplie = 1.0
        
        if area > 11 {
            
            if area > 23 {
                multiplie = 4 // תמיד כפול 2 מהקודם כי זה תדרים
                area = area - 24
            } else {
                multiplie = 2
                area = area - 12
            }
            
        }
        
        
        switch area {
        case 0:
            frequency = (NotesFrequency.b.rawValue + (step12 * precent)) / 2
        case 1:
            frequency = NotesFrequency.c.rawValue + (step1 * precent)
        case 2:
            frequency = NotesFrequency.db.rawValue + (step2 * precent)
        case 3:
            frequency = NotesFrequency.d.rawValue + (step3 * precent)
        case 4:
            frequency = NotesFrequency.eb.rawValue + (step4 * precent)
        case 5:
            frequency = NotesFrequency.e.rawValue + (step5 * precent)
        case 6:
            frequency = NotesFrequency.f.rawValue + (step6 * precent)
        case 7:
            frequency = NotesFrequency.gb.rawValue + (step7 * precent)
        case 8:
            frequency = NotesFrequency.g.rawValue + (step8 * precent)
        case 9:
            frequency = NotesFrequency.ab.rawValue + (step9 * precent)
        case 10:
            frequency = NotesFrequency.a.rawValue + (step10 * precent)
        case 11:
            frequency = NotesFrequency.bb.rawValue + (step11 * precent)
            
        default:
            frequency = 0
        }
       //print(frequency * multiplie, multiplie)
        return frequency * multiplie
    }
    
}

enum NotesFrequency: Double {
    case c = 130.813
    case db = 138.591
    case d = 146.832
    case eb = 155.568
    case e = 164.814
    case f = 174.614
    case gb = 184.997
    case g = 195.998
    case ab = 207.652
    case a = 220
    case bb = 233.082
    case b = 246.942
}
