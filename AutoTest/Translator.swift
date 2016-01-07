//
//  Translator1.swift
//  AutoTest
//
//  Created by 李硕 on 16/1/7.
//  Copyright © 2016年 李硕. All rights reserved.
//

import UIKit

struct Translator {
    
    let hanzi = ["零","九","八","七","六","五","四","三","二","一","十","百","千","万","亿","两"]
    let hanziUnits = ["十":10,"百":100,"千":1000,"万":10000,"亿":1_0000_0000]
    let hanziNumbers = ["零":0,"九":9,"八":8,"七":7,"六":6,"五":5,"四":4,"三":3,"二":2,"一":1,"两":2]

    
    private func filterOtherCharactor(inputString: String) -> [String] {
        let filterResult = inputString.characters.flatMap{ (char) -> String? in
            let s: String? = String(char)
            if hanzi.contains(s!) {
                return s
            }else {
                return nil
            }
        }
        return filterResult
    }
    
    func translate(chineseNumber: String) -> Int {
        
        let filterResult = filterOtherCharactor(chineseNumber)
        
        var t = 1
        var total = 0
        var final = 0
        
        for (index , s) in filterResult.enumerate() {
            if index < (filterResult.count - 1) {
                if hanziNumbers.keys.contains(s) {
                    //此位为数字
                    t = hanziNumbers[s]!
                }
                else{
                    //此位为单位,计算
                    if s == "亿" || s == "万" {
                        total = (total + t) * hanziUnits[s]!
                        final += total
                        total = 0
                    } else {
                        total += t * hanziUnits[s]!
                        t = 0
                    }
                }
            } else {
                if hanziNumbers.keys.contains(s) {
                    //此位为数字
                    t = hanziNumbers[s]!
                    total += t
                    final += total
                }
                else{
                    //此位为单位,计算
                    
                    if s == "亿" || s == "万" {
                        total = (total + t) * hanziUnits[s]!
                        final += total
                        total = 0
                    }
                    else{
                        total += t * hanziUnits[s]!
                        final += total
                    }
                }
            }
        }
        return final
    }
}
