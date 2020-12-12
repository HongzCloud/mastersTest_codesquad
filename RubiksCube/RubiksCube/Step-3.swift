//
//  Step-3.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/11.
//

import Foundation

struct RubiksCubeManager {
    func startGame() {
        //초기셋팅
        let rubiksCube = initializeCube()
        //사용자 입력
        //큐브 조작
        //종료
    }
    
    func initializeCube() -> [[[Character]]] {
        let rubiksCube: [[[Character]]] = [
            [["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]],
            [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]],
            [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]],
            [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]],
            [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]],
            [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]],
        ]
        return rubiksCube
    }
    
    func push(_ cube: [[[Character]]], order: String) -> [[[Character]]] {
        var tempValue = [Character]()
        var tempValue2 = [Character]()
        var cube = cube

        switch order {
        case "F":
            tempValue = cube[4][2]
            tempValue2 = cube[5][0]
            cube[4][2] = [cube[1][2][2],cube[1][1][2],cube[1][2][2]]
            cube[5][0] = [cube[3][2][0],cube[3][1][0],cube[3][0][0]]
            cube[3][0][0] = tempValue[0]
            cube[3][1][0] = tempValue[1]
            cube[3][2][0] = tempValue[2]
            cube[1][2][2] = tempValue2[0]
            cube[1][1][2] = tempValue2[1]
            cube[1][0][2] = tempValue2[2]
        default:
            break
        }
        printCube(cube)
        return [[["A"]]]
    }
    
    func printCube(_ cube: [[[Character]]]) {
        //위
        for row in 0...2 {
            print("\t\t\t\(cube[4][row][0]) \(cube[4][row][1]) \(cube[4][row][2])", terminator:"")
            print()
        }
        //측면
        for row in 0..<3 {
            for side in 0..<4 {
                print("\(cube[side][row][0]) \(cube[side][row][1]) \(cube[side][row][2])\t", terminator:"")
            }
            print()
        }
        //아래
        for row in 0...2 {
            print("\t\t\t\(cube[5][row][0]) \(cube[5][row][1]) \(cube[5][row][2])", terminator:"")
            print()
        }
    }
}

