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
**리팩토링의 목적에 대한 설명을 작성하시오.**

- 소프트웨어를 보다 이해하기 쉽고, 수정하기 쉽도록 개선함
- 결과의 변경없이 코드의 구조를 재조정하는 것으로 가독성을 높이고, 유지보수를 쉽게하기 위한 목적
- 코드의 외부 행위는 바꾸지 않고 내부 구조를 개선시켜 소프트웨어를 보다 이해하기 쉽고, 수정하기 쉽도록 만드는 것

# 2
**다음의 출력 결과를 쓰시오.**

```shell
#include <stdio.h>
void main() {
    int c=0;
    int i=0;
        while(i<10) {
    	i++;
        c *= i;
    }
    printf("%d", c);
}
```

```shell
void main() {    

int c=0;    int i=0;         // c와 i에 0으로 할당

while(i<10) {

i++;       // i 는 10보다 작을 때까지 계속 증가

 c *= i;      // c*=i →  c=c*i  // c에 c랑i랑 곱한값을 넣어라

}     // c에 c랑i랑 곱한값을 넣는데 i는 0부터 10보다 작은 9까지 증가하면서 넣기때문에

c=c*i → c=(0*0) (c*1) (c*2) (c*3) (c*4) (c*5) (c*6) (c*7) (c*8) (c*9) 

//0에 어떤수를 곱하던 0이 됨

printf("%d", c); } //  c값을 출력 0
```

0 (숫자 0)

# 3
**다음 학생 테이블에서 이름이 민수인 튜플을 삭제하도록 결과를 작성하시오.**

```shell
- 테이블명: 학생
- 필드명: 이름
```

DELETE FROM 학생 WHERE 이름 = '민수'

# 4
**TCP/IP에서 신뢰성없는 IP를 대신하여 송신측으로 네트워크의 IP 상태 및 에러 메시지를 전달해주는 프로토콜을 ( )이라 한다.**

ICMP

# 5
**다음의 출력 결과를 쓰시오.**

```shell
public class Test{
    public static void main(String []args){
        int i=0;
        int sum=0;
        while (i<10){
            i++;
            if(i%2==1)
              continue;
        sum += i;
        }
    System.out.print(sum);
    }
}
```

30

# 6
**심리학자 톰 마릴은 컴퓨터가 메시지를 전달하고 메시지가 제대로 도착했는지 확인하며 도착하지 않았을 경우 메시지를 재전송하는 일련의 방법을 '기술적 은어'를 뜻하는 ( )이라는 용어로 정의하였다. ( )안에 들어갈 용어는?**

프로토콜

# 7
**다음 아래 제어 흐름 그래프가 분기 커버리지를 만족하기 위한 테스팅 순서를 쓰시오.**

![image](https://github.com/user-attachments/assets/55fcd82d-e870-4260-a01f-a9ffe5ceae54)

1234561, 124567 또는 1234567, 124561

# 8
**다음 조건을 만족하면서, 과목별 점수의 평균이 90이 상인 과목이름, 최소점수, 최대점수를 구하는 SQL문을 작성하시오.**

```shell
- 대소문자를 구분하지 않는다.
- WHERE 구분을 사용하지 않는다.
- GROUP BY, HAVING구문을 반드시 사용한다.
- 세미콜론(;)은 생략 가능하다.
- 별칭(AS)을 사용해야 한다.
```

![image](https://github.com/user-attachments/assets/550b1fbe-0033-4f60-be69-34f744788639)

SELECT 과목이름, MIN(점수) AS 최소점수, MAX(점수) AS 최대점수 FROM 성적 GROUP BY 과목이름 HAVING AVG(점수) >= 90;

# 9
**학생 테이블에서 이름이 민수인 튜플을 삭제하는 SQL문을 작성하시오**

![image](https://github.com/user-attachments/assets/464e951d-9c5c-481a-9e8a-c66d7f75ef36)

DELETE FROM 학생 WHERE 이름 = '민수';

# 10
**릴레이션 A, B가 있을 때 릴레이션 B 조건에 맞는 것들만 릴레이션 A에서 튜플을 꺼내 프로젝션하는 관계대수의 기호는 무엇인가?**

π Project(추출) : 속성들의 부분 집합, 중복 제거 (수직연산)

÷ Division(나누기) : A의 속성이 B의 속성 값을 모두 가진 튜플에서 B가 가진 속성을 제외한 나머지 속성들만 추출

÷

# 11
**다음 중 헝가리안 표기법(Hungarian Notation)에 대해서 서술하시오.**

식별자 표기 시 접두어에 자료형을 붙이는 표기법

# 12
**테스트의 종류 중, 동치 분할 테스트, 경계값 분석 테스트 등의 종류가 있는 테스트 기법을 쓰시오.**

블랙박스 테스트 (명세 기반 테스트)

# 13
**다음은 C언어 소스 코드이다. 출력 결과를 쓰시오.**

```shell
#include <studio.h>
int r1(){
	return 4;
}
int r10(){
	return (30+r1());
}
int r100(){
	return (200+r10());
}
int main(){
	printf("%dn", r100());
    return 0;
}
```

234

# 14
**데이터베이스에서 스키마(Schema)에 대해 간략히 설명하시오.**

데이터베이스의 전체적인 구조와 제약조건에 대한 명세로, 내부 스키마와 개념 스키마, 외부 스키마로 나뉜다.

# 15
**다음은 자바(Java) 코드이다. 출력 결과를 쓰시오.**

```shell
abstract class vehicle{
    private String name;
    abstract public String getName(String val);
    public String getName(){
    	return "vehicle name:" + name;
    }
	public void setName(String val){
    	name = val;
    }
}

class Car extends Vehicle{
	public Car(String val){
    	setName(val);
   }
public String getName(String val){
	return "Car name : " + val;
   }
public String getName(byte val[]){
	return "Car name : " + val;
   }
}

public class good {
	public Static void main(String[] args){
    Vehicle obj = new Car("Spark");
    System.out.print(obj.getName());
    }
}
```

vehicle name : Spark

# 16
**UI 설계 원칙 중 직관성에 대해 설명하시오.**

누구나 쉽게 이해하고, 쉽게 사용할 수 있어야 한다는 원칙

# 17
**다음은 자바(Java) 코드이다. 출력 결과를 쓰시오.**

```shell
public class Test{
    public static void main(String []args){
        int i=0;
        int sum=0;
        while (i＜10){
            i++;
            if(i%2==1)
              continue;
        sum += i;
        }
    System.out.print(sum);
    }
}
```

30

# 18
**EAI 유형에는 메세지 버스(Message bus) 유형, 하이브리드(Hybrid) 유형, ( A ) 유형, ( B ) 유형이 있다. 괄호안에 들어갈 말을 적으시오.**

A. 포인트 투 포인트(Point-to-point)
B. 허브 앤 스포크(Hub & Spoke)

# 19
**C++에서 생성자란 무엇인지 쓰시오.**

해당 클래스의 객체가 생성될 때 자동으로 호출되는 특수한 종류의 메서드

# 20
**학생 테이블에 주소 속성을 추가하는 SQL문을 작성하려고 한다. 빈 칸을 채우시오.**

```shell
(    A    ) TABLE 학생   (   B   ) 주소 VARCHAR(20);
```

A. ALTER
B. ADD
