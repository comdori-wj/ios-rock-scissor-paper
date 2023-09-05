//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Wonji Ha on 2023/09/06.
//

import Foundation

final class RockPaperScissors {
    
    enum Hand : String, CaseIterable {
        case scissor = "1"
        case rock = "2"
        case paper = "3"
    }
    
    private let aiHand = Hand.allCases.randomElement()
    
    func start() {
        
        while true {
            print(aiHand?.rawValue)
            
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
            guard let inputUser = readLine() else { return }
            
            if inputUser == "0" {
                print("게임 종료")
                break
            }
            
            guard let userHand = Hand(rawValue: inputUser) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            if userHand == aiHand {
                print("비겼습니다!")
            }
            else if (userHand == .scissor && aiHand == .paper) || (userHand == .rock && aiHand == .scissor) || (userHand == .paper && aiHand == .rock) {
                print("이겼습니다!")
                print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ")
            }
            else {
                print("졌습니다!")
                break
            }
        }
    }
}
