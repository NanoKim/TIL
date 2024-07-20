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
**다음은 Java 코드로 작성한 프로그램이다. 올바른 출력 결과를 작성하시오.**

```shell
public class main{
  public static void main(String[] args) {
    A b = new B();
    b.paint();
    b.draw();
  }
}

class A {
  public void paint() {
    System.out.print("A");
    draw();
  }
  public void draw() {
    System.out.print("B");
    draw();
  }
}

class B extends A {
  public void paint() {
    super.draw();
    System.out.print("C");
    this.draw();
  }
  public void draw() {
    System.out.print("D");
  }
}
```

```shell
A b = new B();                            // B클래스를 호출

=========================================================

b.paint();                                // 실행은 아래와 같음.

class B extends A {                       // B 클래스를 호출하였기 때문에 다음에서 실행

    public void paint(){

         super.draw();                    // A의 함수를 가져온다고 생각하면 쉽다. (풀이 아래)

         --------------------------------------------------------------------------------

        public void draw() {              // 가져온 A 의 함수
            System.out.print("B");        // B 가 출력된다.

            draw();                       // this.draw(); D가 출력된다.

        }

        --------------------------------------------------------------------------------

        System.out.print("C");            // C 가 출력된다.

        this.draw();                      // D 가 출력된다.

    }

}

=========================================================

b.draw();

class B extends A {

    public void draw(){

        System.out.print("D");              // D  가 출력된다.

}

=========================================================

따라서 답은 BDCDD 

print 를 사용하여 출력 하였으므로 일렬로 출력.
```

# 2
**다음 설명하는 용어를 보기에 맞게 골라 '기호'를 작성하시오.**

```shell
[보기]
ㄱ.NFT                          ㄴ.JWT                        
ㄷ.SAML                         ㄹ.accessToken             
ㅁ.SSO                          ㅂ.OIDC            
ㅅ.Autentication                ㅇ. OAuth             
ㅈ.Cookie                       ㅊ.Refresh Token

***************************************************************************************
- 사용자가 사용자 이름 및 암호와 같은 자격 증명을 공유하지 않고도 타사 애플리케이션이 데이터 또는 리소스에 액세스할 수 있도록 권한을 부여할 수 있는 개방형 표준 프로토콜이다.

- 사용자가 데이터에 대한 제어를 유지하면서 리소스에 대한 액세스 권한을 부여할 수 있는 안전하고 표준화된 방법을 제공하며, 액세스 토큰을 사용하여 타사 애플리케이션에 리소스에 대한 액세스 권한을 부여하는 메커니즘을 사용자에게 제공하는 방식으로 작동한다.

- 사용자가 응용 프로그램에 대한 액세스 권한을 부여하면 응용 프로그램은 사용자를 대신하여 사용자의 리소스 또는 데이터에 액세스하는 데 사용할 수 있는 액세스 토큰을 받는다.

- 암호와 같은 사용자의 자격 증명은 타사 응용 프로그램과 공유되지 않으며, 클라우드 스토리지 서비스, 온라인 마켓 플레이스 및 금융 서비스를 포함한 다른 많은 응용 프로그램 및 서비스에서도 사용된다.

- Facebook, Twitter 및 LinkedIn과 같은 소셜 미디어 플랫폼에서 널리 사용되어 사용자가 소셜 미디어 데이터에 대한 액세스 권한을 타사 애플리케이션에 부여할 수 있도록 한다.

- 타사 애플리케이션에 대한 사용자 자격 증명의 노출을 최소화하여 향상된 보안, 간소화된 애플리케이션 개발, 사용자가 리소스에 대한 액세스 권한을 쉽게 부여하거나 취소할 수 있도록 하여 향상된 사용자 환경 등 여러 가지 이점을 제공한다.
```

SSO(Single Sign On; 한번의 로그인으로 여러 애플리케이션을 이용할 수 있도록 하는 서비스)의 유형에는 SAML, OAuth, OIDC가 있다.

SAML : XML 형식의 Assertion, 브라우저에서만 사용 가능
OAuth : JWT(Json Web Token) 형식의 Access Token, 인가가 목표
OIDC (Open ID ~) : JWT(Json Web Token) 형식의 Access Token, 인증이 목표

ㅇ. OAuth

# 3
**리눅스(Linux)에서 사용자에게 읽기/쓰기/실행 권한을 부여하고, 그룹에게는 읽기/실행을 부여하고, 그 이외에는 실행 권한을 test.txt 파일에 부여하는 위한 명령어는 다음과 같다. 빈칸에 들어갈 답을 작성하시오. (8진법 사용)**

```shell
(    ①    ) (    ②    ) test.txt
```

모드변환 : Chmod / 권한변환 : Chown

읽기(4)/쓰기(2)/실행(1) = 4 + 2 + 1 = 7

읽기/실행 = 4 + 1

실행 = 1

① chmod
② 751

# 4
** 다음은 C 언어 코드이다. 알맞는 출력 결과를 작성하시오.**

```shell
#include <stdio.h>

int test(int n) {
  int i, sum = 0;

  for (i = 1; i <= n / 2; i++) {
    if (n % i == 0)
    sum += i;
  }

  if (n == sum)
      return 1;

  return 0;
}

int main(){
  int i, sum=0;

  for (i = 2; i <= 100; i++){
    if (test(i))
    sum += i;
  }

  printf("%d ", sum);
  return 0;
]
```

자기자신을 제외한 약수의 합이 자기자신이 되는 값 6,28,496,8128

6+28 = 34

# 5
**C언어에서 구조체의 멤버에 접근하기 위해 괄호안의 '기호'를 작성하시오.**

```shell
#include <stdio.h>
#include <stdlib.h>

typedef struct Date {
  char c;
  int *numPtr;
} Data;

int main() {
  int num = 10;
  Data d1;
  Data *d2 = malloc(sizeof(Data));

  d1.numPtr = &num;
  d2(      )numPtr = &num;

  printf("%d\n", *d1.numPtr);
  printf("%d\n", *d2(      )numPtr);

  free(d2);
  return 0;
}

[출력결과]
10
10
```

구조체 변수를 이용해서 직접적으로 원소에 접근할때는 .연산자를,

구조체 포인터를 이용해서 간접적으로 원소에 접근할때는 → 연산자를 사용.

d2→numptr는 (*d2).numPtr과 동일. (좀 더 간결하게 작성하기 위해 →가 등장)

# 6
**다음 빈칸에 들어갈 UNION 연산의 결과값을 작성하시오**

![image](https://github.com/user-attachments/assets/8ffc48d1-cc80-4901-8945-49e40f6f4d26)

```shell
[쿼리]
SELECT A FROM  T1
UNION
SELECT A FROM  T2
ORDER BY A DESC;
```

4
3
1

# 7
**다음 설명은 서버 접근 통제의 유형이다. 괄호 안에 들어갈 용어를 작성하시오. ('영어 약자'로 작성하시오.)**

```shell
- (   ①   )은/는 규칙 기반(Rule-Based) 접근통제 정책으로, 객체에 포함된 정보의 허용 등급과 접근 정보에 대하여 주체가 갖는 접근 허가 권한에 근거하여 객체에 대한 접근을 제한하는 방법이다.

- (   ②   )은/는 중앙 관리자가 사용자와 시스템의 상호관계를 통제하며 조직 내 맡은 역할(Role)에 기초하여 자원에 대한 접근을 제한하는 방법이다.

- (   ③   )은/는 신분 기반(Identity-Based) 접근통제 정책으로, 주체나 그룹의 신분에 근거하여 객체에 대한 접근을 제한하는 방법이다.
```

접근 통제 모델의 종류

- MAC(Mandatory; 강제적) : 변경 불가 - 규칙 기반 접근 통제
  - MLP(Multi Level) : 1급 기밀
- DAC(Discretionary; 임의적) : 변경 가능 - 신분 기반 접근 통제
  - IBP (Individual Based) : 특정 개인을 허용
  - GBP (Group Based) : 특정 그룹을 허용
- RBAC(Role Based) : 역할에 부여

# 8
**다음 C언어 코드에 알맞는 출력값을 작성하시오.**

```shell
#include

int f(int n) {
  if(n<=1) return 1;
  else return n*f(n-1);
}

int main() {
  printf("%d", f(7));
}
```

재귀 팩토리얼 : !7 = 7 * 6 * 5 * 4 * 3 * 2 * 1 = 5040

# 9
**다음 설명에 대해 괄호 안에 알맞는 용어를 작성하시오. ('영어 약자' 로 작성하시오.)**

```shell
- (     )은/는 자료를 일정한 크기로 정하여 순서대로 전송하는 자료의 전송 방식이다.

- 셀이라 부르는 고정 길이 패킷을 이용하여 처리가 단순하고 고속망에 적합하며, 연속적으로 셀을 보낼 때 다중화를 하지 않고 셀단위로 동기가 이루어지지만 경우에 따라 동기식 시간 분할 다중화를 사용하기도 한다.

- 가상 채널 (Virtual Channel) 기반의 연결 지향 서비스로 셀이라 부르는 고정 길이(53바이트) 패킷을 사용하며 통계적 다중화 방식을 이용한다.
```

ATM
(Asynchronous Transfer Mode)

# 10
**다음은 C언어의 포인터 문제이다. 알맞는 출력값을 작성하시오.**

```shell
int main() {
  char* p = "KOREA";
  printf("%s \n", p);
  printf("%s \n", p+1);
  printf("%c \n", *p);
  printf("%c \n", *(p+3));
  printf("%c ", *p+4);
}
```

```shell
int main() {
   char* p = "KOREA";
   printf("%s \n", p);       // s는 String p = KOREA
   printf("%s \n", p+1);     // O = 1 번째자리 부터 = OREA
   printf("%c \n", *p);      // Character, K = 0 번째 값 
   printf("%c \n", *(p+3));  // K = 0 , E = 3
   printf("%c \n", *p+4);    // 75(K) + 4 = 79(O)  K L M N O 순서.
}
```

# 11
**다음 Java 코드에 대한 알맞는 출력값을 작성하시오.**

```shell
class Parent {
  int compute(int num) {
    if(num <= 1)
      return num;
    return compute(num-1) + compute(num-2);
  }
}

class Child extends Parent {
  int compute(int num) {
    if(num <= 1)
      return num;
    return compute(num-1) + compute(num-3);
  }
}

public class main {
  public static void main(String args[]) {
    Parent obj = new Child();
    System.out.print(obj.compute(7));
  }
}
```

2

# 12
**IP 패킷에서 외부의 공인 IP주소와 포트 주소에 해당하는 내부 IP주소를 재기록하여 라우터를 통해 네트워크 트래픽을 주고받는 기술은 무엇인가?**

NAT(Network Address Translation) 방식

- 정적 NAT : 사설 IP와 공인 IP 1:1 대응
- 동적 NAT : 공인 IP 풀을 가지고 있음. 요청 시 1:1 대응
- PNAT(Port~) : 포트를 함께 저장함. 1:다 대응 가능

NAT(Network Address Translation)

# 13
**다음 자바 코드를 실행할 경우 에러가 발생이 된다. 에러가 발생하는 라인을 작성하시오.**

```shell
class Person {
  private String name;
  public Person(String val) {
    name = val;
  }
  public static String get() {
    return name;
  }
  public void print() {
    System.out.println(name);
  }
}
public class main {
  public static void main(String[] args) {
    Person obj = new Person("Kim");
    obj.print();
  }
}
```

get() 메서드는 static으로 정의되어 있습니다. static 메서드는 클래스 레벨에서 호출되며, 인스턴스 변수에 접근할 수 없습니다.
name 변수는 인스턴스 변수로, static 메서드 내에서는 직접 접근할 수 없습니다.

자바 컴파일러는 프로그램 실행 전에 코드를 컴파일할 때 모든 메서드를 분석합니다. 
따라서 get() 메서드를 실행하지 않더라도, 컴파일러는 static 메서드에서 인스턴스 변수 name에 접근하려는 시도를 보고 에러를 발생시킵니다. 
이 에러는 컴파일 시간에 발생하며, 이는 메서드가 실행되는지 여부와 관계없이 발생합니다.

6

# 14
**다음은 Python 프로그램에 대한 문제이다. 빨간색 박스로 가려진 '예약어' 를 알맞게 작성하시오. (단, 첫 번째 라인의 '5 10'은 사용자로 부터 입력받은 값에 해당한다.)**

![image](https://github.com/user-attachments/assets/209ea5d5-0c0c-405b-b035-84b84e0cb9a1)

```shell
#실행결과
x, y의 값을 공백으로 구분하여 입력: 5 10
x의 값: 5
y의 값: 10
```

```shell
x, y = input("x, y의 값을 공백으로 구분하여 입력: ").split()
print("x의 값:", int(x))
print("y의 값:", int(y))

#실행결과
x, y의 값을 공백으로 구분하여 입력: 5 10
x의 값: 5
y의 값: 10
```

# 15
**다음은 판매와 관련된 다이어그램이다. 해당 다이어그램의 명칭을 쓰시오.**

![image](https://github.com/user-attachments/assets/f939a1ee-3e83-4e4f-ba14-518e793e6dfd)

패키지(Package)

# 16
**다음 설명에 알맞는 답을 보기에서 골라 '기호' 를 작성하시오.**

![image](https://github.com/user-attachments/assets/29d9218f-04e2-4893-b0e1-4543bf4f126a)

```shell
- 시스템이나 시스템 구성요소(component) 또는 소프트웨어 프로그램의 입력값과 출력값이 특정 그룹으로 분류되며, 분류된 그룹내의 값들이 시스템에 의해 동일하게 취급된다는 특성을 이용하여 시험하는 기법

- 유사한 입력값들이 시스템을 거치면서 유사한 답변이 나온다는 것을 가정하여 테스트

- 하나의 값은 그 분할 내 모든 값을 대표하는 것으로 간주하는 기법

- 모든 입력 값을 시험할 필요가 없게 하여 시험을 효율적으로 수행하도록 지원

- 일반적으로 경계값 분석기법(boundary value analysis)과 함께 테스트 케이스 도출하는데 사용
```

프로그램 실행 여부에 따른 테스트 분류

- 정적 테스트 : 프로그램을 실행하지 않음. (ex. 코드 리뷰, 워크스루, 인스펙션)
- 동적 테스트 : 프로그램을 실행함. (ex. 화이트박스 테스트, 블랙박스 테스트)
- 화이트박스 테스트의 검증 기준(Coverage)

- 문장(Statement) : 모든 구문 실행해보기
- 분기(Branch) : 전체 조건 T/F 다 가보기
- 조건(Condition) : 개별 조건 T/F 다 가보기
- 화이트박스 테스트

- 기초 경로 검사(Base Path) : McCabe 제안
- 제어 구조 검사(Control Structure) : 조건 검사, 루프 검사, 데이터 흐름 검사(변수 정의 및 사용 위치 기준)
- 블랙박스 테스트

- 동치 분할 검사(Equivalence Partitioning) : 각 조건마다 대표 TC 개수를 동일하게 정함
- 경계값 분석(Boundary Value Analysis) : 경계값 TC를 많이 만듦
- 원인-효과 그래프 검사(Cause-Effect Graphing) : 출력에 미치는 영향 분석 후 효용이 높은 TC 선정
- 오류 예측 검사(Error Guessing) : 테스트 수행자의 경험과 감각
- 비교 검사(Comparison) : 여러 버전에 같은 TC를 돌려 같은 결과가 나오는지 확인

# 17
**다음은 클라우드에 대한 유형 문제이다. 괄호안에 알맞는 답을 보기에 골라 작성하시오.**

![image](https://github.com/user-attachments/assets/6d4f34bc-c068-4483-87a6-d7fdf6e6b9f6)

```shell
PaaS                 SaaS                  IaaS
```

IaaS(Infrastructure as a Service) : 
- 서비스로서의 인프라, 개발 및 테스트 환경의 구축 및 제거가 빠르고 유연, AWS, Azure, GC가 대표적,
- 사용자가 컨트롤할 수 있는 범위가 넓음
- os, middleware runtime, data, applications

PaaS : 
- 서비스로서의 플랫폼, 제공업체가 자체 인프라에서 하드웨어와 소프트웨어를 호스팅,
- Elastic Beanstalk, Heroku, Red Hat OpenShift, 사용자가 컨트롤할 수 있는 범위
- Applications, Data

SaaS : 
- 서비스로서의 소프트웨어, 모든 애플리케이션은 제공업체가 관리, 웹 브라우저를 통해 제공,
- 사용자는 대시보드 또는 API를 통해 애플리케이션에 연결, 개별 시스템에 소프트웨어를 설치할 필요가 없음,
- Dropbox, salesforce, google apps, red hat insights

사용자가 컨트롤할 수 있는 범위 기준 : 넓 I > P > S 좁

# 18
**다음은 프로토콜 종류에 관한 설명이다. 알맞는 답을 작성하시오.**

```shell
- 최소 Hop count를 파악하여 라우팅하는 프로토콜이다.

- 거리와 방향으로 길을 찾아가는 Distance Vector 다이나믹 프로토콜이다.

- 최단거리 즉, Hop count가 적은 경로를 택하여 라우팅하는 프로토콜로 Routing Table에 인접 라우터 정보를 저장하여 경로를 결정한다.

- 최대 Hop count는 15로 거리가 짧기 때문에 IGP로 많이 이용하는 프로토콜이다.
```

라우팅 프로토콜

IGP(Inner Gateway Protocol; AS 내)
- RIP(Routing Information Protocol) : 경로 벡터 알고리즘 (like 벨만-포드), 30초마다 갱신, 최대 홉수 15 → 컨버전스 타임이 길다
- OSPF(Open Shortest Path First) : 링크 상태 알고리즘(like 다익스트라)
EGP(Extenral Gateway Protocol; AS 간)
- BGP(Border Gateway Protocol) : 경로 벡터 알고리즘 (like 벨만-포드)

RIP

# 19
**다음은 관계 대수에 대한 내용이다. 보기에 알맞는 기호를 작성하시오.**

```shell
[보기]
ㄱ. σ              ㄴ.  π                   ㄷ.⋈                 ㄹ.÷
***************************************************************************************

1. JOIN :   (   ①   )

2. PROJECT :   (   ②   )

3. SELECT :   (   ③   )

4. DIVISION :   (   ④   )
```

관계 대수

셀렉션 → 시그마
프로젝션 → 파이
조인 → 모래시계
디비전 → 나누기

① ㄷ
② ㄴ
③ ㄱ
④ ㄹ

# 20
**다음은 데이터베이스에 관련된 문제이다. 괄호 안에 알맞는 답을 작성하시오.**

```shell
- (            ) 무결성은 관계 데이터베이스 관계 모델에서 2개의 관련 있던 관계 변수(테이블) 간의 
   일관성(데이터 무결성)을 말한다.

- 종종 기본 키 또는 키가 아닌 후보 키와 외래 키의 조합으로 강제 적용된다.
 
- 외래 키가 선언된 관계 변수의 외래 키를 구성하는 속성(열)의 값은 그 관계 변수의 부모가 되는 관계 변수의 기본 키 값 또는 기본 키가 아닌 후보 키 값으로 존재해야 한다.
```

무결성의 종류

엔터티 무결성 : PK 중복 금지, NOT NULL
참조 무결성 : 원본에 없는 FK 값 금지
도메인 무결성 : 속성 도메인에서 벗어난 값 금지
