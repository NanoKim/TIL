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
**아래 자바 코드에서 출력되는 값을 작성하시오.**

```shell
class Static{
    public int a = 20;
    static int b = 0;   
}
 
public class Test{
    public static void main(String[] args) {
        int  a = 10;
        Static.b = a;
        Static st = new Static();

        System.out.println(Static.b++);
        System.out.println(st.b);
        System.out.println(a);
        System.out.print(st.a);
    }
}
```

10
11
10
20

# 2
**다음 C언어의 출력값을 작성하시오.**

```shell
#include 
 
int main(){

    char a[] = "Art";
    char* p = NULL;
    p = a;
 
    printf("%sn", a);
    printf("%cn", *p);
    printf("%cn", *a);
    printf("%sn", p);
 
    for(int i = 0; a[i] != ''; i++)
    printf("%c", a[i]);
 
}
```

char a[] = “Art”;   ← a[] : {‘A’, ‘r’, ‘t’, ‘\0’}

%s : 해당 포인터부터 문자열 출력. char * 형

%c : 해당 포인터의 문자 하나 출력. char 형

Art
A
A
Art
Art

# 3
**다음 C언어의 출력값을 작성하시오.**

```shell
#include 
 
int main(){
 
    char* a = "qwer";
    char* b = "qwtety";
 
    for(int i = 0; a[i] != '' ; i++){
        for(int j = 0; b[j] != ''; j++){
            if(a[i] == b[j]) printf("%c", a[i]);
        }
    }
 
}
```

배열a	q	w	e	r	\0	 	 
배열b	q	w	t	e	t	y	\0

qwe

# 4
**다음 괄호안에 들어가는 용어의 Full Name 또는 약자를 작성하시오.**

```shell
(   )은/는 비동기적인 웹 애플리케이션의 제작을 위해 JavaScript와 XML을 이용한 비동기적 정보 교환 기법이다.

(   )은/는 필요한 데이터만을 웹서버에 요청해서 받은 후 클라이언트에서 데이터에 대한 처리를 할 수 있다. 
보통 SOAP이나 XML 기반의 웹 서비스 프로토콜이 사용되며, 웹 서버의 응답을 처리하기 위해 클라이언트 쪽에서는 자바스크립트를 쓴다.

(   )은/는 Google Map과 Google pages에서 사용한 기술에 기반하여 제작되었다.
```

XML과 JAVA 는 AJAX

XML과 언어는 WSDL

XML과 프로토콜은 SOAP

# 5
**아래 내용을 확인하여 괄호 안에 용어를 표안에 알맞는 값을 고르시오.**

![image](https://github.com/user-attachments/assets/827b7c9d-e49d-42a1-9a2d-6c01d8c66651)

데이터 교환 방식

- 회선 교환(Circuit Switching) (ex. 전화)
- 패킷 교환(Packet Switching)
  - 가상회선 패킷 교환 : 연결 지향형 (ex. TCP)
  - 데이터그램 패킷 교환 : 비연결 지향형 (ex. UDP)

데이터 통신 다중화(Multiplexing) 기법

- 주파수 분할 다중화(FDM; Frequency)
- 시분할 다중화(TDM; Time)
- 부호분할 다중화(CDM; Code)

# 6
**아래 내용을 확인하여 알맞는 답을 작성하시오.**

```shell
○ 2 계층(데이터링크 계층)에서 구현되는 터널링 기술 중 하나
○ L2F와 PPTP가 결합된 프로토콜로 VPN과 인터넷 서비스 제공자(ISP)가 이용
○ IPsec을 함께 사용하면 PPTP보다 훨씬 안전하지만 보안보다 익명화에 더 적합
```

L2TP

# 7
**다음 설명에 해당하는 알맞은 용어를 영문 3글자로 쓰시오.**

```shell
○ 다른 컴퓨터에 로그인, 원격 명령 실행, 파일 복사 등을 수행할 수 있도록 다양한 기능을 지원하는 프로토콜 또는 이를 이용한 응용 프로그램이다.

○ 데이터 암호화와 강력한 인증 방법으로 보안성이 낮은 네트워크에서도 안전하게 통신할 수 있다.

○ 키(Key)를 통한 인증 방법으로 사용하려면 사전에  클라이언트의 공개키를 서버에 등록해야 한다.

○기본적으로는 22번 포트를 사용한다.
```

- SSH : 22, 암호화하여
- telnet : 23, 평문으로

SSH

# 8
**를 참고하여 아래 설명에 대한 (1) ~ (3)의 알맞는 답을 작성하시오.**

![image](https://github.com/user-attachments/assets/c60bad62-adfa-454c-a8fd-e6370685445c)

```shell
- 트로이 목마
- 웜
- 바이러스
```

1. 웜
2. 트로이 목마
3. 바이러스

# 9
**다음 아래 코드에서 이진수를 십진수로 변환하는 코드에 대해 괄호 (a) (b)의 적합한 답을 작성하시오.**

```shell
#include 
 
int main() { 
    int input = 101110;
    int di = 1;
    int sum = 0;
 
    while (1) {
 
        if (input == 0) break;
        else {
 
          sum = sum + (input (a)(b)) * di;
             di = di * 2;
             input = input / 10; 
        }
    }
 
    printf("%d", sum);
 
    return 0;
}
```

sum = sum + (input % 10) * di;    // (input % 10) 가장 오른쪽 자릿수를 십진수로 변환하여 누적 

di = di * 2;                      // 2의 거듭제곱 수 업데이트 

input = input / 10;               // 다음 자릿수로 이동

(a) % , (b) 10 or 5 or 2
또는
(a) & , (b) 1

# 10
**다음 보안 관련 설명으로 괄호안에 알맞는 용어를 작성하시오.**

```shell
(    )은/는 TCP/IP에서 IP 패킷을 처리할 때 발생되는 문제를 알려주는 프로토콜이다.

(    ) 프로토콜은 보통 다른 호스트나 게이트웨이 와 연결된 네트웍에 문제가 있는지 확인하기 위한 목적으로 주로 사용된다.

(    ) 을/를 이용한 공격에는 (    ) Flooding가 있는데 ping 명령어를 통한 (     ) 패킷을 연속적으로 계속 보내어 서버의 요청에 응답으로 인한 다른작업을 하지 못하도록 하는 공격이다.
```

Internet
Control 
Message 
Protocol

ICMP : 인터넷 제어 메세지 프로토콜(오류메세지 전송)

# 11
**다음은 디자인 패턴에 관한 설명이다. 설명에 내용에 알맞는 답을 고르시오.**

![image](https://github.com/user-attachments/assets/d791f83a-fcab-40a9-b417-c64089b60a3b)

```shell
(   )은/는 복잡한 시스템을 개발하기 쉽도록 클래스나 객체을 조합하는 패턴에 속하며,
대리라는 이름으로도 불린다. 내부에서는 객체 간의 복잡한 관계를 단순하게 정리해 주고,
외부에서는 객체의 세부인 내용을 숨기는 역할을 한다.
```

프록시 패턴 (Proxy Pattern) : 직접 참조하지 않고 중간에 대리인을 거친다
 - 생성, 구조, 행위 중 구조 패턴에 해당

# 12
**릴레이션의 구성하는 용어들에 대한 다음 설명에서 괄호(① ~ ③)에 들어갈 알맞은 답을 에서 찾아 쓰시오.**

![image](https://github.com/user-attachments/assets/547c5e37-5c5f-4ae2-9a96-cbd00de836db)

```shell
○도메인  ○차수  ○속성  ○튜플
○디그리  ○카디널리티  ○릴레이션 스키마  ○릴레이션 인스턴스
```

열 = 세로 = 차수 = 속성 = 애드리뷰트
행 = 가로 = 기수 = 튜플 = 카디널리티

① 튜플
② 릴레이션 인스턴스
③ 카디널리티

# 13
**[학생] 테이블에서 학생 이름이 '민수'인 튜플을 삭제하는 쿼리를 작성하시오.**

![image](https://github.com/user-attachments/assets/a2bd2163-6703-4b03-88f0-3827262105c4)

```shell
조건
- 컬럼의 값이 문자열일 경우 작은 따옴표 ('  ')를 표시하시오.
- SQL 마지막에 세미콜론(;)은 표기하지 않아도 관계 없습니다.
```

DELETE FROM 학생 WHERE 이름 = '민수';

# 14
**다음 코드에서 괄호안에 알맞는 값을 변수명으로 작성하시오.**

```shell
#include 
void swap(int *a, int idx1, int idx2) {
 int t= a[idx1];
 a[idx1] = a[idx2];
 a[(    ①    )] = t;
}

void  Usort(int *a, int len) {
  for(int i = 0; i < len - 1; i++) 
     for(int j = 0; j < len - 1 - i; j++)
        if(a[j] > a[j+1])
            swap(a,j,j+1);
}

void main(){
 int a[] = {85, 75, 50, 100, 95};
 int nx = 5;
 Usort(a, (    ②    ));
}
```

(1) idx2
(2) nx

# 15
**다음 파이썬 코드의 알맞는 출력값을 작성하시오.**

```shell
a = {'한국', '중국', '일본'}
a.add('베트남')
a.add('중국')
a.remove('일본')
a.update({'홍콩', '한국', '태국'})
print(a)
```

{'한국', '중국', '베트남', '홍콩', '태국'}

파이썬 딕셔너리형으로 "출력 결과의 순서는 상관 없습니다."
값이 중복되지 않아야 하며, 출력 결과는 중괄호 {} 및 , 와 ‘ ’ 을 생략 시 오답 처리

# 16
**다음 성적 테이블에서 과목별 점수의 평균이 90점 이상인 '과목이름', '최소점수', '최대점수' 를 검색하고자 한다. [조건]을 참고하여 적합한 SQL문을 작성하시오.**

![image](https://github.com/user-attachments/assets/b0737e8f-c488-46e4-a0e7-df4676de43d7)

```shell
[조건] 
- WHERE사용하지 말아야 한다.
- SELECT절에 별칭을 사용하여 작성해야 한다.
- SQL 구문 마지막에 세미콜론(;)은 생락 가능하다.
- 반드시 GROUP BY와 HAVING 을 사용해야 한다.
- 집계 함수를 사용해야 한다.
```

```shell
SELECT 과목이름 ,MIN(점수) AS 최소점수 ,MAX(점수) AS 최대점수
FROM 성적
GROUP BY 과목이름 HAVING AVG(점수) >= 90
```

# 17
**다음 JAVA 코드에서 알맞는 출력 값을 작성하시오.**

```shell
abstact class Vehicle {
    String name;
    abstract public String getName(String val);
 
    public String getName() {
            return "Vehicle name: " + name;
    }
}
 
class Car extends Vehicle {
    public Car(String val) {
            name=super.name=val;
    }
 
    public String getName(String val) {
            return "Car name:" + val;
    }
 
    public String getName(byte val[]) {
            return "Car name:" + val;
    }
}
 
 
public class Main {
    public static void main(String[] args) {
    Vehicle obj = new Car("Spark");
    System.out.println(obj.getName());
    }
}
```

Vehicle name: Spark

# 18
**다음은 스키마와 관련된 내용이다. 각 괄호안에 알맞는 답을 작성하시오.**

![image](https://github.com/user-attachments/assets/ea1f7157-09b2-4f3a-ab45-df0f359fd8f1)

(데이터베이스) 스키마 는 한마디로 데이터의 구조, 데이터베이스의 설계 라고 할 수 있다. 스키마는 개체, 속성, 관계, 제약 조건 등에 관해 전반적으로 정의한다

스키마는 총 세가지로 나뉜다

1) 외부 스키마 - 사용자, 응용프로그램 관점/ 각 개인의 입장에서 필요로 하는, DB의 일부분의 논리적인 구조를 정의/서브스키마 또는 사용자 뷰 라고도 불림/여러개가 존재할 수 있음

2) 개념 스키마 - 기관, 조직체 관점/모든 응용시스템과 사용자들이 필요로 하는 DB의 구조를 정의/사람이 이해하는 논리 구조/단 하나만 존재

3) 내부 스키마 - 컴퓨터(DB), 물리적 저장장치 관점/실제 DB에 저장될 레코드의 물리적인 구조를 정의/컴퓨터가 이해하는 물리 구조

# 19
**다음 아래 제어 흐름 그래프가 분기 커버리지를 만족하기 위한 테스팅 순서를 쓰시오.**

![image](https://github.com/user-attachments/assets/319d9856-beb0-4d55-9485-542eb99673a5)

분기 커버리지를 만족하기 위한 테스팅이므로, 모든 분기점을 최소 한번씩은 실행하는 테스팅 알고리즘을 서술한다

1234561, 124567
또는
1234567, 124561

# 20
**다음 Java 코드에 대한 출력 값을 작성하시오.**

```shell
class Parent {
    int x = 100;
    Parent() {
        this(500);
    }
 
    Parent(int x) {
        this.x = x;
    }
 
    int getX() {
        return x;
    }
}
 
class Child extends Parent {
    int x = 4000;
    Child() {
        this(5000);
    }
 
    Child(int x) {
        this.x = x;
    }
}
 
public class Main {
    public static void main(String[] args) {
        Child obj = new Child();
        System.out.println(obj.getX());
    }
}
```

```shell
1) Child obj = new Child();  에서 생성자 호출

→  [class Child] Child() { this(5000); } →  Child(int x) { this.x = x; } → [class Parent] Parent() { this(500); } → Parent(int x) { this.x = x; } → Parent의 x값 : 500 → Child의 x값 : 5000

=> obj 객체 내 Parent 클래스의 x값은 500, Child 클래스의 x값은 5000이 된다

 

2) obj.getX();

→ [class Parent] int getX() { return x; }  (Child에서 getX() 메소드를 오버라이드 하지 않았으므로 Parent의 getX() 메소드를 호출한다)

=> obj 객체 내 Parent 클래스의 x값인 500을 리턴
```
