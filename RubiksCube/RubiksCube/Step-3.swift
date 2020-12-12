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

