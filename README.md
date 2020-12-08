# 코드스쿼드 마스터즈 테스트
---
 * 1단계 : 단어 밀어내기 구현하기
 * 2단계 : 평면 큐브 구현하기
 * 3단계 : 루빅스 큐브 구현하기
---
## - 1단계 : 단어 밀어내기 -

### 1. main.swift
#### - 테스트코드 작성하기
  ```swift 
//MARK:- Step1 Test Code
func testStep1() {
    print(pushWord("apple 3 L") == "leapp" ? "PASS":"FAILED")
    print(pushWord("banana 6 R") == "banana" ? "PASS":"FAILED")
    print(pushWord("carrot -1 r") == "arrotc" ? "PASS":"FAILED")
    print(pushWord("cat -4 R") == "atc" ? "PASS":"FAILED")
}
testStep1()

//User input Test Code
//let input = readLine() ?? ""
//pushWord(input)
```

readLine으로 하나씩 테스트하기 어려우므로 testStep1()을 만들어 놓았습니다. 😀

main.swift에서 User input Test Code 아래의 주석을 해제시킨 후 실행하면 Step-1.swift의 pushWord function이 호출됩니다.


### 2. Step-1.swift
#### - 입력받은 String 값 쪼개기

  ```swift 
func pushWord(_ input: String) -> String {
    let inputArr = input.components(separatedBy: " ")
    var outWord = Array(inputArr[0])
    guard var count = Int(inputArr[1]) else {
        return "push 반복할 숫자가 잘못되었습니다."
    }
    var direction = inputArr[2]
```
예를 들어 input 매개변수 값에 "apple 3 l" 들어온다면 components 메서드에 의해 '공백'을 기준으로 배열이 만들어 지게 됩니다. // [apple, 3 ,l]

그리고 outWord, count, direction의 변수들에 각각 담아줍니다. word의 이름을 outWord로 지은 이유는 return값으로 이 변수를 이용할 것이기 때문입니다. 


#### - push 반복할 숫자(count)가 음수인지 아닌지 판별 후 count, direction 다시 초기화
```swift 
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
```

#### - direction 오른쪽 Or 왼쪽 판별 후 direction 방향으로 count번 push 기능 수행
```swift 
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
```
direction이 'R','r' 이라면 입력받은 배열에서 마지막 요소를 제거 후 다시 index 0번째에 추가시킨다.

direction이 'L','l' 이라면 입력받은 배열에서 첫번째 요소를 제거후 다시 index 마지막번째에 추가시킨다.

