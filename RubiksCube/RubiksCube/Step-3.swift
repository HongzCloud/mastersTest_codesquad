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
    
    func printCube(_ cube: [[[Character]]]) {
    }
}

