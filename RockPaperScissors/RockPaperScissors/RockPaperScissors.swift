//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 지준용 on 2023/09/06.
//

import Foundation

final class RockPaperScissors {
    
    // MARK: - Enum
    
    enum Player : String {
        case mac = "컴퓨터"
        case user = "사용자"
    }
    
    enum Hand : String, CaseIterable {
        case scissors = "1"
        case rock = "2"
        case paper = "3"
    }
    
    static var winner : Player?

    // MARK: - Start
    
    func start() {
        while true {
            print(GuideMessage.rpsChoiceMenu, terminator: "")
            guard let userInput = readLine() else { return }
            
            if userInput == "0" {
                return print(GuideMessage.exit)
            }
            
            guard let userHand = Hand(rawValue: userInput) else {
                print(GuideMessage.inputError)
                continue
            }
            
            let aiHand = Hand.allCases.randomElement()
            
            if userHand == aiHand {
                print(GuideMessage.draw)
            } else if (userHand == .scissors && aiHand == .paper) ||
                      (userHand == .rock && aiHand == .scissors) ||
                      (userHand == .paper && aiHand == .rock) {
                RockPaperScissors.winner = .user
                print(GuideMessage.win)
                Mukjjippa().play()
              
            } else {
                RockPaperScissors.winner = .mac
                print(GuideMessage.lose)
                Mukjjippa().play()
            }
        }
    }
}

