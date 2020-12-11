# 코드스쿼드 마스터즈 테스트
---
 * 1단계 : 단어 밀어내기 구현하기
 * 2단계 : 평면 큐브 구현하기
 * 3단계 : 루빅스 큐브 구현하기
---
## - 2단계 : 평면 큐브 구현하기 -

### 1. main.swift
#### - 테스트코드 작성하기
  ```swift 
//MARK:- Step-2 Test Code
   let flatCubeManager = FlatCubeManager()
    //Integration Test
    flatCubeManager.startGame()
    
    //Unit Test
//    print(flatCubeManager.push([["R","R","W"], ["G","C","W"], ["G","B","B"]], "UUR") == [["W","R","W"], ["G","C","B"], ["G","B","R"]] ? "PASS":"FAILED")
```

flat cube game의 기능은 크게 3가지가 있으면 됩니다.

* 1단계 : 큐브 미는 조작 입력 받기
* 2단계 : 큐브 밀기
* 3단계 : 큐브상태 보여주기

이런 흐름들을 테스트하기 위해 latCubeManager.startGame()을 작성했습니다.

또한 각각의 단계의 메서드들을 테스트하기 위해 //Unit Test에 작성했습니다.


### 2. Step-2.swift
#### - 게임시작
  ```swift 
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
            
            //큐브 조작 divideOrders(UU'R) -> [U,U',R]
            pushedFlatCube = push(pushedFlatCube, divideOrders(input))
            
            //종료
            if input.hasPrefix("Q") || input.hasSuffix("Q") {
                isGameEnd = true
            }
        }
    }
```
game 시작을 위해 startGame() 작성하였습니다.

흐름을 설명하자면

1. 초기 큐브 상태를 지정, push된 큐브를 저장하기 위한 변수 생성, Q 입력 시 게임 종료를 판단할 변수 생성

2. Q가 입력되기 전까지 계속 게임이 지속되도록 while문을 작성하였고 그 안에 사용자 입력, 큐브조작, 종료조건을 작성하였습니다. 

메서드별 설명은 아래에 해놨습니다!


#### - 입력받은 orders 값 쪼개기 (UU'R -> ["U", "U'", "R"])

  ```swift 
    func divideOrders(_ orders: String) -> [String] {
        var dividiedOrders = [String]()
        let convertStrToCharArr = Array(orders)
        
        for index in 0..<convertStrToCharArr.count {
            if convertStrToCharArr[index] == "'" {
                continue
            }
            dividiedOrders.append(String(convertStrToCharArr[index]))
            if index < convertStrToCharArr.count-1 && convertStrToCharArr[index+1] == "'" {
                dividiedOrders[index] = dividiedOrders[index] + String(convertStrToCharArr[index+1])
            }
        }
        return dividiedOrders
    }
```
orders 매개변수 값에 "UU'R" 들어온다면 일단 ["U", "U", "\'", "R"] 로 바꿉니다.

그리고 for문을 돌면서 index 0부터 dividiedOrders에 담아줍니다. 대신 그 다음 값이 "\'" 일 경우 해당 index의 값에 "\'"을 더해주었습니다.


#### - 큐브 밀기
```swift 
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
```

push()에서 쪼개진 orders에 따라서 위,아래,왼쪽,오른쪽 중 어느곳으로 push 할지 switch case문을 작성하였습니다. 


#### - 현재 큐브의 상태 보여주기, 수행한 order가 있다면 order도 같이 print 
```swift 
    func showResult(_ flatCube: [[Character]], _ optionalOrder: String? = nil) {
        
        if let order = optionalOrder {
            print(order)
        }
        
        for row in 0..<flatCube[0].count {
            print("\(flatCube[row][0]) \(flatCube[row][1]) \(flatCube[row][2])")
        }
        print()
    }
```

옵셔널 바인딩으로 order가 있는지 없는지 판단 후 있으면 order을 print 해주고

flat cube의 상태를 보여주기 위해 1열 단위로 for문을 돌려서 큐브를 print 하였습니다.
