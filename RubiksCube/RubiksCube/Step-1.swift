//
//  Step-1.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/08.
//

import Foundation

func pushWord(_ input: String) -> String {
    let inputArr = input.components(separatedBy: " ")
    var outWord = Array(inputArr[0])
    guard var count = Int(inputArr[1]) else {
        return "push 반복할 숫자가 잘못되었습니다."
    }
    var direction = inputArr[2]
    
    //push 반복할 숫자(count)가 음수면 정수로 바꾸고 방향(direction)을 반대로 바꿈
    if count < 0 {
        count = -(count)
        switch direction {
        case "R","r":
            direction = "L"
        case "L","l":
            direction = "R"
        default:
            return "방향은 R,r,L,l 만 입력가능합니다."
        }
    }
    
    switch direction {
    case "R","r":
        for _ in 0..<count {
            outWord.insert(outWord.removeLast(), at: 0)
        }
    case "L","l":
        for _ in 0..<count {
            outWord.append(outWord.removeFirst())
        }
    default:
        return "방향은 R,r,L,l 만 입력가능합니다."
    }

    return String(outWord)
}
