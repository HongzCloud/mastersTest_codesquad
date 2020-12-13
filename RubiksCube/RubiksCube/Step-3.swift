//
//  Step-3.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/11.
//
/*
 order 종류
 F : O면 기준으로 오른쪽으로 돌림
 R : G면 기준으로 오른쪽으로 돌림
 U : B면 기준으로 오른쪽으로 돌림
 B : Y면 기준으로 오른쪽으로 돌림
 L : W면 기준으로 오른쪽으로 돌림
 D : R면 기준으로 오른쪽으로 돌림
 Q : 종료
 S : 뒤섞기
 */
import Foundation

struct RubiksCubeManager {
    func startGame() {
        //초기셋팅
        var myRubiksCube = initializeCube()
        var isGameEnd = false
        var orderCount = 0
        let startTime = Date()
        printCube(myRubiksCube)

        while !isGameEnd {
            //사용자 입력
            let input = userInput()
     
            //큐브 조작
            for index in 0..<divideOrders(input).count {
                print(divideOrders(input)[index])
                myRubiksCube = pushNavigator(myRubiksCube, order: divideOrders(input)[index])
                printCube(myRubiksCube)
            }
            orderCount += divideOrders(input).count
            
            //종료
            isGameEnd = jugeEndGame(cube: myRubiksCube, order: input, orderCount: orderCount)
        }
        let endTime = Date()
        let useTime = Int(endTime.timeIntervalSince(startTime))
        print("경과 시간 : \(String(format: "%02d", useTime/60)):\(String(format: "%02d", useTime%60))")
    }
    
    func userInput() -> String {
        print("CODE> ", terminator:"")
        let input = readLine() ?? ""
        print()
        
        return input
    }
    
    func jugeEndGame(cube: [[[Character]]], order: String, orderCount: Int) -> Bool {
        if order == "Q" {
            print("이용해주셔서 감사합니다. 🥰")
            print("조각 갯수 : \(orderCount-1)")
            
            return true
        }
        
        //추가 기능 : 모든 면을 맞출시 종료
        else if orderCount != 0 && cube == initializeCube() {
            print("축하합니다 맞추셨어요.~ 🥰")
            print("조각 갯수 : \(orderCount)")
            return true
        }
        
        return false
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
    
    func divideOrders(_ orders: String) -> [String] {
        var dividiedOrders = [String]()
        let convertStrToCharArr = Array(orders)
        
        for index in 0..<convertStrToCharArr.count {
            if convertStrToCharArr[index] == "'" {
                continue
            }
            dividiedOrders.append(String(convertStrToCharArr[index]))
            if index < convertStrToCharArr.count-1 && convertStrToCharArr[index+1] == "'" {
                dividiedOrders[dividiedOrders.count-1] += "'"
            }
        }
        return dividiedOrders
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
        
        myCube[5][2] = [myCube[0][0][0],myCube[0][1][0],myCube[0][2][0]]
        myCube[4][0] = [myCube[2][0][0],myCube[2][1][0],myCube[2][2][0]]
        
        for row in 0..<3 {
            myCube[2][row][0] = tempValue2[2-row]
            myCube[0][row][0] = tempValue[2-row]
        }
        
        return myCube
    }
    
    func pushForL(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
        var tempValue3 = [Character]()
        var tempValue4 = [Character]()
 
        tempValue = [myCube[4][0][0], myCube[4][1][0], myCube[4][2][0]]
        tempValue2 = [myCube[5][0][0], myCube[5][1][0], myCube[5][2][0]]
        tempValue3 = [myCube[3][0][2], myCube[3][1][2], myCube[3][2][2]]
        tempValue4 = [myCube[1][0][0], myCube[1][1][0], myCube[1][2][0]]
        
        for row in 0..<3 {
            myCube[3][2-row][2] = tempValue2[row]
            myCube[1][row][0] = tempValue[row]
            myCube[5][row][0] = tempValue4[row]
            myCube[4][2-row][0] = tempValue3[row]
        }
        
        return myCube
    }
 
    func pushForD(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
 
        tempValue = myCube[2][2]
        tempValue2 = myCube[0][2]
        
        myCube[0][2] = myCube[3][2]
        myCube[2][2] = myCube[1][2]
        myCube[3][2] = tempValue
        myCube[1][2] = tempValue2
        
        return myCube
    }
    
    func pushForReverseF(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
        
        tempValue = cube[4][2]
        tempValue2 = cube[5][0]
        
        myCube[5][0] = [myCube[0][2][2],myCube[0][1][2],myCube[0][0][2]]
        myCube[4][2] = [myCube[2][2][0],myCube[2][1][0],myCube[2][0][0]]
      
        for row in 0..<3 {
            myCube[2][row][0] = tempValue2[row]
            myCube[0][row][2] = tempValue[row]
        }
        
        return myCube
    }

    func pushForReverseR(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
 
        for row in 0..<3 {
            tempValue.append(myCube[4][row][2])
            tempValue2.append(myCube[5][row][2])
           
            myCube[5][row][2] = myCube[1][row][2]
            myCube[4][row][2] = myCube[3][2-row][0]
            myCube[3][2-row][0] = tempValue2[row]
            myCube[1][row][2] = tempValue[row]
        }
        
        return myCube
    }
    
    
    func pushForReverseU(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
 
        tempValue = myCube[2][0]
        tempValue2 = myCube[0][0]

        myCube[0][0] = myCube[3][0]
        myCube[2][0] = myCube[1][0]
        myCube[1][0] = tempValue2
        myCube[3][0] = tempValue
        
        return myCube
    }
    
    func pushForReverseB(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
        
        tempValue = cube[4][0]
        tempValue2 = cube[5][2]
        
        myCube[4][0] = [myCube[0][0][0],myCube[0][1][0],myCube[0][2][0]]
        myCube[5][2] = [myCube[2][0][0],myCube[2][1][0],myCube[2][2][0]]
        
        for row in 0..<3 {
            myCube[2][row][0] = tempValue[2-row]
            myCube[0][row][0] = tempValue2[2-row]
        }
        
        return myCube
    }
    
    func pushForReverseL(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
        var tempValue3 = [Character]()
        var tempValue4 = [Character]()
 
        tempValue = [myCube[4][0][0], myCube[4][1][0], myCube[4][2][0]]
        tempValue2 = [myCube[5][0][0], myCube[5][1][0], myCube[5][2][0]]
        tempValue3 = [myCube[3][0][2], myCube[3][1][2], myCube[3][2][2]]
        tempValue4 = [myCube[1][0][0], myCube[1][1][0], myCube[1][2][0]]
        
        for row in 0..<3 {
            myCube[3][2-row][2] = tempValue[row]
            myCube[1][row][0] = tempValue2[row]
            myCube[5][row][0] = tempValue3[row]
            myCube[4][2-row][0] = tempValue4[row]
        }
        
        return myCube
    }
    
    func pushForReverseD(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
 
        tempValue = myCube[2][2]
        tempValue2 = myCube[0][2]
        
        myCube[0][2] = myCube[1][2]
        myCube[2][2] = myCube[3][2]
        myCube[3][2] = tempValue2
        myCube[1][2] = tempValue
        
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
        case "D":
            myCube = pushForD(cube)
        case "F'":
            myCube = pushForReverseF(cube)
        case "R'":
            myCube = pushForReverseR(cube)
        case "U'":
            myCube = pushForReverseU(cube)
        case "B'":
            myCube = pushForReverseB(cube)
        case "L'":
            myCube = pushForReverseL(cube)
        case "D'":
            myCube = pushForReverseD(cube)
        case "S":
            //뒤섞기
            let orders = ["F","R","U","L","B","D"]
            for _ in 0...20 {
                myCube = pushNavigator(myCube, order: orders.randomElement()!)
            }
        default:
            break
        }
        
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

