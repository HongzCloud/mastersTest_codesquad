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
    
   
    func pushForF(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
        
        tempValue = cube[4][2]
        tempValue2 = cube[5][0]
        
        myCube[5][0] = [myCube[2][2][0],myCube[2][1][0],myCube[2][0][0]]
        myCube[4][2] = [myCube[0][2][2],myCube[0][1][2],myCube[0][0][2]]

        for row in 0..<3 {
            myCube[2][row][0] = tempValue[row]
            myCube[0][row][2] = tempValue2[row]
        }
        
        return myCube
    }
    
    func pushForR(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
 
        for row in 0..<3 {
            tempValue.append(myCube[4][row][2])
            tempValue2.append(myCube[5][row][2])
            
            myCube[5][row][2] = myCube[3][2-row][0]
            myCube[4][row][2] = myCube[1][row][2]
            myCube[3][2-row][0] = tempValue[row]
            myCube[1][row][2] = tempValue2[row]
        }
        
        return myCube
    }
    
    func pushForU(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
 
        tempValue = myCube[2][0]
        tempValue2 = myCube[0][0]

        myCube[0][0] = myCube[1][0]
        myCube[1][0] = tempValue
        myCube[2][0] = myCube[3][0]
        myCube[3][0] = tempValue2
        
        return myCube
    }
    
    func pushForB(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
        
        tempValue = cube[4][0]
        tempValue2 = cube[5][2]
        
        myCube[5][2] = [myCube[0][0][2],myCube[0][1][2],myCube[0][2][2]]
        myCube[4][0] = [myCube[2][0][0],myCube[2][1][0],myCube[2][2][0]]
        
        for row in 0..<3 {
            myCube[2][row][2] = tempValue2[2-row]
            myCube[0][row][0] = tempValue[2-row]
        }
        
        return myCube
    }
    
    func pushForL(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube

        return myCube
    }
    
    func pushNavigator(_ cube: [[[Character]]], order: String) -> [[[Character]]] {
        var myCube = cube
        
        switch order {
        case "F":
            myCube = pushForF(cube)
        case "R":
            myCube = pushForR(cube)
        case "U":
            myCube = pushForU(cube)
        case "B":
            myCube = pushForB(cube)
        case "L":
            myCube = pushForL(cube)
        default:
            break
        }
        
        printCube(myCube)
        return myCube
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

