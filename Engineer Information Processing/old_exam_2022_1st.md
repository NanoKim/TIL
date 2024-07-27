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
**다음 설명에 맞는 RAID 단계를 쓰시오**

```shell
ㅇ 두 개 이상의 하드디스크를 병렬로 연결해, 하나의 디스크처럼 이용하는 기술이다.
ㅇ 스트라이프(Stripe) 방식으로 구현하여 I/O 속도가 빠르다.
ㅇ 데이터를 블럭단위로 분할하고 나누어 저장하기 때문에 하나의 디스크에 문제가 생기면 데이터 사용이 불가능해진다.
```

RAID-0

# 2
**다음은 로그 기반 회복기법에서 사용되는 명령어이다. 각 지문에 해당하는 명령을 적으시오.**

```shell
1. 오류가 발생하기 전까지의 사항을 로그(log)로 기록해 놓고, 이전 상태로 되돌아간 후 실패가 발생하기 전까지의 과정을 재실행한다.
2. 로그를 이용하여 오류와 관련된 내용을 취소하여 복구한다.
```

redo : 이전으로돌아가 실패전까지의과정 재실행
undo : 로그를 이용해 오류내용취소하여 복구

1. redo
2. undo

# 3
**데이터베이스의 이상현상 중, 삭제 이상에 대해 간략히 설명하시오.**

데이터를 삭제할 경우 원하지 않는 다른 데이터도 삭제되어버리는 이상

# 4
**아래에서 설명하는 임시 키 무결성 프로토콜의 영문 약어를 쓰시오.**

```shell
ㅇ IEEE 802.11 무성 네트워킹 표준에 사용되는 보안 프로토콜
ㅇ IEEE 802.11i의 작업 그룹과 WiFi 얼라이언스에서 WEP를 하으뒈어 교체 없이 대체하기 위해 고안
```

TKIP (Temporal Key Integrity Protocol)

# 5
**아래에서 설명하는 내용을 영문 약자로 쓰시오.**

```shell
키보드나 마우스와 같은 장치 없이 말이나 행동 그리고 감정과 같은 인간의 자연스러운 표현으로 컴퓨터나 장치를 제어할 수 있는 환경
```

NUI

# 6
**다음은 소스코드 분석도구에 대한 설명이다. 각 지문이 설명하는 분석 기법의 명칭을 쓰시오.**

```shell
1. 소스 코드의 실행 없이, 코드의 의미를 분석해 결함을 찾아내는 원시적 코드 분석 기법
2. 소스 코드를 실행하여 프로그램 동작이나 반응을 추적하고 코드에 존재하는 메모리 누수, 스레드 결함 등을 분석하는 기법
```

1. 정적 분석 기법
2. 동적 분석 기법

# 7
**아래에서 설명하는 테스트 도구를 쓰시오.**

```shell
자바 프로그래밍 언어를 이용한 xUnit의 테스트 기법으로써 숨겨진 단위 테스트를 끌어내어 정형화시켜 단위 테스트를 쉽게 해주는 테스트용 프레임워크이다.
```

JUnit

# 8
**다음 보기 중에서 블랙박스 테스트 기법을 3가지 골라 작성하시오.**

```shell
a. Equivalence Partitioning
b. Boundary Value Analysis
c. Base Path Test
d. Loop Test
e. Cause-effect Graph
f. Decision Coverage
g. Statement Coverage
```

a. Equivalence Partitioning (동등 분할): 입력 데이터를 동등한 부분으로 나누어, 각 부분의 대표값으로 테스트를 수행한다. 이 기법은 모든 가능한 입력 값들을 효율적으로 테스트하고자 할 때 사용된다.
b. Boundary Value Analysis (경계값 분석): 입력 데이터의 경계값 주변에 오류가 발생할 확률이 높다는 가정 하에, 경계값과 그 바로 옆의 값을 테스트하는 기법이다. 이는 동등 분할 기법과 함께 사용되어 더 효과적인 테스트를 가능하게 한다.
e. Cause-effect Graph (원인-결과 그래프): 입력과 그에 따른 출력 결과의 관계를 그래프 형태로 표현하여 테스트 케이스를 도출하는 방법이다. 복잡한 비즈니스 로직을 가진 시스템의 테스트에 유용하다.

# 9
**다음 설명에 대한 답을 영어 약자로 작성하시오.**

```shell
정부에서 정한 인증기관 및 심사기관에서 기업이 주요 정보자산을 보호하기 위해 수립·관리·운영하는 정보보호 관리체계가 인증 기준에 적합한지를 심사하여 인증을 부여하는 제도
```

ISMS

# 10
**다음은 데이터베이스 키에 대한 설명이다. 빈 칸에 들어갈 내용을 내용을 쓰시오.**

```shell
1. 슈퍼키는 ( A )의 속성을 갖는다.
2. 후보키는 ( A )와(과) ( B )의 속성을 갖는다.

```

1. 유일성
2. 최소성

# 11
**다음에서 설명하는 공격 기법을 쓰시오.**

```shell
이 공격은 APT 공격에서 주로 쓰이는 공격으로, 공격 대상이 방문할 가능성이 있는 합법적인 웹 사이트를 미리 감염시킨 뒤, 잠복하고 있다가 공격 대상이 방문하면 대상의 컴퓨터에 악성코드를 설치하는 방식이다.
```

워터링 홀(Watering Hole)

# 12
**다음은 V&V 모델을 형상화한 V다이어그램이다. 빈칸에 들어갈 말을 쓰시오.**

![image](https://github.com/user-attachments/assets/88d5921e-bbfa-4601-9ea4-5e3125a64876)

a. 단위 테스트 b.통합 테스트 c. 시스템 테스트 d.인수 테스트

# 13
**다음 SQL 결과에 알맞는 쿼리을 작성하시오.**

![image](https://github.com/user-attachments/assets/906d8899-9b4e-47c5-927c-c2f95d2aecf6)

```shell
SELECT 번호, 이름, 점수 FROM 성적 ( 1 ) BY ( 2 ) ( 3 )
```

ORDER, 점수, DESC

# 14
**다음에서 설명하는 파이썬 함수를 작성하시오.**

```shell
1. 요소를 확장해준다는 의미를 가지고 있으며, 모든 항목을 하나의 요소로 추가
2. 리스트 내부 요소를 꺼내주는 함수로써, 그 요소는 리스트 안에서 삭제하고 그 값을 반환
3. 리스트 내부의 요소의 순서는 뒤집는 역할
```

1. extend
2. pop
3. reverse

# 15
**다음은 파이썬 코드에서 출력되는 a와 b의 값을 작성하시오.**

```shell
def exam(num1, num2=2):
  print('a=', num1, 'b=', num2)
exam(20)
```

a= 20 b= 2

# 16
**다음 Java 코드 중에서 밑줄에 들어갈 알맞는 코드를 작성하시오.**

```shell
class Car implements Runnable{
  int a;
  
  public void run(){
     system.out.println("Hello")
  }
}
  
public class Main{
  public static void main(String[] args){
    Thread t1 = new Thread(new ___());
    t1.start();
  }
}
```

Car

# 17
**다음 Java 코드의 출력 결과를 작성하시오.**

```shell
class A {
  int a;
  int b;
}
  
public class Main {
  
  static void func1(A m) {
    m.a *= 10;
  }
  
  static void func2(A m) {
    m.a += m.b;
  }
  
  public static void main(String args[]){
  
  A m = new A();
  
  m.a = 100;
  func1(m);
  m.b = m.a;
  func2(m);
  
  System.out.printf("%d", m.a);
  }
}
```

2000

# 18
**다음 소스코드에서 입력값이 5가 들어왔을때 출력되는 값을 작성하시오.**

```shell
#include ＜stdio.h＞
int func(int a) {
  if (a ＜= 1) return 1;
  return a * func(a - 1);
}
 
int main() {
  int a;
  scanf("%d", &a);
  printf("%d", func(a));
}
```

120

# 19
**다음 C언어 프로그램의 괄호 안에 들어갈 알맞은 연산자를 작성하시오.**

```shell
#include ＜stdio.h＞
int main() {
  int number = 1234;
  int div = 10;
  int result = 0;
 
  while (number ( 1 ) 0) {
    result = result * div;
    result = result + number ( 2 ) div;
    number = number ( 3 ) div;
  }
 
  printf("%d", result);
  return 0;
}


결과: 4321
```

1. ＞
2. %
3. /

# 20
**다음 C언어 프로그램의 결과를 쓰시오.**

```shell
#include ＜stdio.h＞
int isPrime(int number) { 
  int i; 
  for (i=2; i＜number; i++) { 
    if (number % i == 0) return 0; 
  } 
  return 1; 
} 
 
int main(void) { 
  int number = 13195, max_div=0, i; 
  for (i=2; i＜number; i++) 
  if (isPrime(i) == 1 && number % i == 0) max_div = i; 
  printf("%d", max_div); 
  return 0; 
}
```

29
