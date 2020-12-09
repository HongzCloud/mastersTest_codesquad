//
//  Step-2.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/09.
//

import Foundation

struct FlatCubeManager {
    func startGame() {
        //초기셋팅
        //사용자 조작 입력
        //큐브 조작
        //결과
    }
    
    func push(_ flatCube: [[Character]], _ order: String) -> [[Character]] {
        var outFlatCube = flatCube
        
        return outFlatCube
    }
    
    func showResult(_ flatCube: [[Character]]) {
        for row in 0..<flatCube[0].count {
            print("\(flatCube[row][0]) \(flatCube[row][1]) \(flatCube[row][2])")
        }
        print()
    }
}
