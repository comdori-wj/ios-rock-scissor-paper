//
//  Mukjjippa.swift
//  RockPaperScissors
//
//  Created by Wonji Ha on 2023/09/07.
//

import Foundation

final class Mukjjippa {
    
    enum Hand : String, CaseIterable {
        case muk = "1"
        case jji = "2"
        case ppa = "3"
    }
    
    var winner = RockPaperScissors.winner?.rawValue ?? "" // 무조건 추출 안하고 옵셔널 체이닝

    func play() {
        while true {
            print( "[\(winner) 턴] 묵 (1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            guard let userInput = readLine() else { return }
            
            let macHand = Hand.allCases.randomElement()
            
            if userInput == "0" {
                return print(GuideMessage.exit)
            }
            else {
                switch (userInput, macHand) {
                case ("1", .muk), ("2", .jji), ("3", .ppa):
                    print("\(winner)의 승리!")
                    return
                case ("2", .ppa), ("3", .muk), ("1", .jji):
                    print("\(winner)의 턴입니다.")
                default:
                    print(GuideMessage.inputError)
                }
            }
        }
    }
}
