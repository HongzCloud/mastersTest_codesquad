//
//  Step-2.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/09.
//
/*
> U  가장 윗줄을 왼쪽으로 한 칸 밀기 RRW -> RWR
> U' 가장 윗줄을 오른쪽으로 한 칸 밀기 RRW -> WRR
> R  가장 오른쪽 줄을 위로 한 칸 밀기 WWB -> WBW
> R' 가장 오른쪽 줄을 아래로 한 칸 밀기 WWB -> BWW
> L  가장 왼쪽 줄을 아래로 한 칸 밀기 RGG -> GRG (L의 경우 R과 방향이 반대임을 주의한다.)
> L' 가장 왼쪽 줄을 위로 한 칸 밀기 RGG -> GGR
> B  가장 아랫줄을 오른쪽으로 한 칸 밀기 GBB -> BGB (B의 경우도 U와 방향이 반대임을 주의한다.)
> B' 가장 아랫줄을 왼쪽으로 한 칸 밀기 GBB -> BBG
> Q  Bye~를 출력하고 프로그램을 종료한다.
*/
import Foundation

struct FlatCubeManager {
    func startGame() {
        //초기셋팅
        let flatCube: [[Character]] = [["R","R","W"], ["G","C","W"], ["G","B","B"]]
        var pushedFlatCube = flatCube
        var isGameEnd = false
        showResult(flatCube)
        
        //사용자 조작 입력
        while !isGameEnd {
            print("CODE> ", terminator:"")
            let input = readLine() ?? ""
            print()
            
            //큐브 조작 UU'R -> [U,U',R]
            pushedFlatCube = push(pushedFlatCube, divideOrders(input))
            
            //종료
            if input.hasPrefix("Q") || input.hasSuffix("Q") {
                isGameEnd = true
            }
        }
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
    
    func push(_ flatCube: [[Character]], _ orders: [String]) -> [[Character]] {
        var outFlatCube = flatCube
        var tempValue: Character?
        
        func up(column: Int) {
            tempValue = outFlatCube[0][column]
            outFlatCube[0][column] = outFlatCube[1][column]
            outFlatCube[1][column] = outFlatCube[2][column]
            outFlatCube[2][column] = tempValue!
        }
        
        func down(column: Int) {
            tempValue = outFlatCube[2][column]
            outFlatCube[2][column] = outFlatCube[1][column]
            outFlatCube[1][column] = outFlatCube[0][column]
            outFlatCube[0][column] = tempValue!
        }
        
        func left(row: Int) {
            outFlatCube[row].append(outFlatCube[row].removeFirst())
        }
        
        func right(row: Int) {
            outFlatCube[row].insert(outFlatCube[row].removeLast(), at: 0)
        }
        
        for order in orders {
            switch order {
            case "U":
                left(row: 0)
            case "U'":
                right(row: 0)
            case "R":
                up(column: 2)
            case "R'":
                down(column: 2)
            case "L":
                down(column: 0)
            case "L'":
                up(column: 0)
            case "B":
                right(row: 2)
            case "B'":
                left(row: 2)
            case "Q":
                print("Bye ~")
                return outFlatCube
            default:
                print("이해할 수 없는 조작입니다.")
            }
            showResult(outFlatCube, order)
        }
        return outFlatCube
    }
    
    func showResult(_ flatCube: [[Character]], _ optionalOrder: String? = nil) {
        
        if let order = optionalOrder {
            print(order)
        }
        
        for row in 0..<flatCube[0].count {
            print("\(flatCube[row][0]) \(flatCube[row][1]) \(flatCube[row][2])")
        }
        print()
    }
}
