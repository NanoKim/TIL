# 목차

- [1](#1)
- [2](#2)
- [3](#3)
- [4](#4)
- [5](#5)
- [6](#6)
- [7](#7)
- [8](#8)
- [9](#9)
- [10](#10)
- [11](#11)
- [12](#12)
- [13](#13)
- [14](#14)
- [15](#15)
- [16](#16)
- [17](#17)
- [18](#18)
- [19](#19)
- [20](#20)

# 1
**네트워크 장치를 필요로하지 않고 네트워크 토폴로지가 동적으로 변화되는 특징이 있으며 응용 분야로는 긴급 구조, 긴급 회의, 전쟁터에서의 군사 네트워크에 활용되는 네트워크는?**

애드혹 네트워크(Ad-hoc Network)

# 2
**다음에서 설명하는 개념을 각각 쓰시오.**

```shell
(1) 시스템을 사용하는 사용자의 일반적인 감정이나 경험을 시스템 설계에 나타내는 개념
(2) 사용자가 시스템을 사용하는 화면과 이용방법, 입출력 과정 등을 표현적인 시스템 구성에 나타내는 개념
```

(1) UX(User Experience)
(2) UI(User Interface)

# 3
**트랜잭션의 특징 중, 원자성(Atomicity)에 대해 약술하시오.**

모두 반영되거나 아니면 전혀 반영되지 않아야 하는 특성

# 4
**다음은 제 ( ) 정규형으로 부분 함수적 종속성 제거하여 완전 함수적 종속을 만족하는 정규형이다. 괄호안에 들어갈 답안을 쓰시오.**

![image](https://github.com/user-attachments/assets/9a326484-6bd6-49ed-addf-f5e1d1aa4164)

제2정규형

# 5
**테이블의 튜플을 수정하고자 한다. 올바른 SQL을 작성하기 위해 빈칸을 채우시오.**

```shell
(    A   ) 테이블명  (     B    )  컬럼 = 값 WHRE 점수 >= 90;
```

A: UPDATE
B: SET

# 6
**다음은 Inner Join을 하기 위한 SQL이다. 빈칸에 들어갈 문구를 적으시오.**

```shell
SELECT .... FROM 학생정보 a JOIN 학과정보 b (   A   ) a.학과 = b.(   B   )
```

A: ON
B: 학과

# 7
**다음 파이썬 코드의 결과를 적으시오.**

```shell
a = 100
result = 0
for i in range(1,3):
   result = a >> i
   result = result + 1
print(result)
```

26

# 8
**미국 국립 표준 기술연구소 (NIST), DES를 대체하며, 128 비트 블록 크기와 128,192,256비트 키 크기의 대칭 키 암호화 방식은?**

AES (Advanced Encryption Standard)

# 9
**다음은 화이트 박스 테스트 검증 기준에 대한 설명이다. 다음에서 설명하는 알맞은 용어를 보기에서 찾아 쓰시오.**

```shell
(1) 최소 한 번은 모든 문장을 수행한다.
(2) 결정(Decision) 검증 기준이라고도 하며 조건 별로 True/False일 때 수행한다.
(3) (2)와 달리 전체 조건식에 상관없이 개별 조건식의 True/False에 대해 수행한다.

[보기] 다중 조건 커버리지, 변형 조건 / 결정 커버리지, 조건 커버리지, 결정 커버리지, 구조 커버리지, 구문 커버리지
```

(1) 구문 커버리지
(2) 결정 커버리지
(3) 조건 커버리지

# 10
**다음은 '이'씨 성을 가진 사람의 이름을 내림차순으로 출력하기 위한 SQL문이다. 괄호안에 들어갈 알맞은 답안을 작성하시오.**

```shell
SELECT ... FROM ... WHERE 이름 LIKE (    A    ) ORDER  BY (    B     )
```

A: '이%'
B: 이름 DESC

# 11
**다음 각 번호에 해당하는 응집도를 보기에서 찾아 쓰시오.**

```shell
(1) 입출력 간 연관성은 없으나, 순서에 따라 수행할 필요가 있다.
(2) 동일한 입출력을 사용한다.
(3) 하나의 기능에 모두 기여하고 밀접하게 관련되어 있다. 

[보기] 기능적(functional), 시간적(temporal), 교환적(communication), 절차적(procedural), 순차적(sequential), 우연적(coincidental), 논리적(logical)
```

(1) 절차적 응집도
(2) 교환적 응집도
(3) 기능적 응집도

# 12
**다음에서 설명하는 패킷 교환 방식을 작성하시오.**

```shell
(1) 목적지 호스트와 미리 연결한 후, 통신하는 연결형 교환 방식
(2) 헤더에 붙어서 개별적으로 전달하는 비연결형 교환 방식
```

(1) 가상 회선 방식
(2) 데이터그램 방식

# 13
**다음 괄호 안에 들어갈 디자인 패턴의 명을 적으시오.**

```shell
디자인 패턴 중 (    ) 패턴은 반복적으로 사용되는 객체들의 상호작용을 패턴화한 것으로 클래스나 객체들이 상호작용하는 방법이다. 알고리즘 등과 관련된 패턴으로 그 예는 Interpreter, Observer, Command 가 있다.
```

행위(behavioral)

# 14
**병행제어기법 중, 접근한 데이터에 대한 연산을 모두 마칠때까지 상호배제하는 기법을 무엇이라 하는지 작성하시오.**

로킹

# 15
**럼바우 데이터 모델링에 관한 설명으로써, 각 번호에서 설명하는 모델링 기법을 보기에서 찾아서 작성하시오.**

```shell
(1) 입력값이 출력값일 때 - 예) 자료 흐름도(DFD)
(2) 시간에 따라 변하는 것 - 예) 상태 변화도(DFD)
(3) 구조 - 예) ER다이어그램(ERD)

[보기] Operation, Sequence, Information, Transaction, Function, I/O, Dynamic, Architecture, Cause-Effect, Constraint, Rebuilding, Duration
```

(1) Function Modeling
(2) Dynamic Modeling
(3) Object Modeling

# 16
**다음은 C언어에 관한 소스코드이다. 실행 결과값을 작성하시오.**

```shell
int mp(int base, int exp);
int main(){
   int res;
   res = mp(2,10);
   printf("%d",res);
   return 0;
}

int mp(int base, int exp) {
   int res = 1;
   for(int i=0; i < exp; i++){
      res = res * base;
   }
   
   return res;
}
```

1024

# 17
**이것은 클래스 내에서 객체 생성 없이 사용할 수 있는 메소드이다. 다음의 출력 결과를 보고 괄호안에 알맞은 답안을 작성하시오.**

```shell
public class Test {
   public static void main(String[] args){
      system.out.print(Test.check(1));
   }
   
   (  괄호  )  String check (int num) {
      return (num >= 0) ? "positive" : "negative";
   }
}


[출력결과]
positive
```

static

# 18
**다음은 C언어 코드의 실행 결과를 적으시오.**

```shell
int main() {
	int ary[3];
	int s = 0;
	*(ary + 0) = 1;
	ary[1] = *(ary + 0) + 2;
	ary[2] = *ary + 3;
	for(int i = 0; i < 3; i++) {
		s = s + ary[i];
	}
	printf("%d", s);
}
```

8

# 19
**다음 JAVA 코드의 실행 결과를 적으시오.**

```shell
public class ovr1 {
	public static void main(String[] args){
    	ovr a1 = new ovr1();
        ovr a2 = new ovr2();
        System.out.println(a1.sun(3,2) + a2.sun(3,2));
    }
    
    int sun(int x, int y){
    	return x + y;
    }
}

class ovr2 extends ovr1 {
	int sun(int x, int y){
    	return x - y + super.sun(x,y);
    }
}
```

11

# 20
**다음 괄호 안에 들어갈 알맞은 답안을 작성하시오.**

```shell
테스트 하네스의 도구 구성 요소 중, 상향식 테스트시, 상위 모듈 역할을 대신하는 테스트 드라이버와 하향식 테스트 시, 하위 모듈 역할을 대신하는 테스트 (       ) 이 있다.
```

상드하스

스텁
