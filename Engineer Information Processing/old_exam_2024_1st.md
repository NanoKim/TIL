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

# 1
**아래 자바 코드에서 출력되는 값을 작성하시오.**

```shell
class Connection {
	private static Connection _inst = null;
	private int count = 0;
	static public Connection get() {
		if(_inst == null) {
			_inst = new Connection();
			return _inst;
		}
		return _inst;
	}
	public void count() { count++; };
	public int getCount() { return count; }
}
public class SingleTon {  
	public static void main(String[] args) {
		Connection conn1 = Connection.get();
		conn1.count();
		Connection conn2 = Connection.get();
		conn2.count();
		Connection conn3 = Connection.get();
		conn3.count();
		conn1.count();
		System.out.print(conn1.getCount());
	}
}
```

이 문제는 connection 클래스를 싱글톤 패턴으로 구현한 것. 

싱글톤(singleton) 패턴은 클래스에 대해 단 하나의 인스턴스만 존재하도록 보장하는 디자인 패턴이다. (_inst 변수를 이용하여 구현)
처음 _inst=null 이고, 첫 번째 호출 시에만 새로운 인스턴스를 생성하고, 이후 호출 시에는 계속 기존에 생성된 인스턴스를 반환. 

conn1.count();, conn2.count();, conn3.count();, conn1.count(); 순서대로 호출이 이루어졌고, 
총 4번의 count가 증가했으니 count의 값은 4. 
Connection.get() 메서드는 Connection conn1에서 생성된 인스턴스를 반환하기 때문에 conn1, conn2, conn3 모두 같은 인스턴스를 참조. 


# 2
**아래 코드에서 출력되는 값을 작성하시오.**

```shell
int main() {
  int v1 = 0, v2 = 35, v3 = 29;
  if(v1 > v2 ? v2 : v1) {
    v2 = v2 << 2;
  }
  else {
    v3 = v3 << 2;
  }
  printf("%d", v2+v3);
}
```

if (v1 > v2 ? v2 : v1) v1과 v2를 비교해서 참이면 v2, 거짓이면 v1 반환
0(v1) > 35(v2) 의 결과는 ‘거짓’ 이라서 
v2: v1 부분에서 v1인 0 값을 반환 
조건문은 if(0) 이 되기 때문에 거짓이 된다.

따라서 else 문을 실행. 


v3= v3 <<2;
v3값을 왼쪽으로 2번 시프트 연산을 해준다. 
29를 이진수로 바꾸면 11101
여기에 왼쪽으로 2번 시프트하면 값은 1110100 
10 진수로는 116이다. 

v2=35, v3=116

둘이 더하면 정답은 151

# 3
**응집도가 높은 순으로 기호를 나열하시오.**

```shell
[보기]
㉠ 기능  
㉡ 교환  
㉢ 우연  
㉣ 시간

(       ) -> (       ) -> (       ) -> (       )
```

응집도가 약한 순서
우논시절교순기

(1) 우연적 응집도(Coincidental Cohesion)
서로 관련 없는 요소로만 구성된 경우

(2) 논리적 응집도(Logical Cohesion)
논리적으로 유사한 기능을 수행하지만 서로의 관계는 밀접하지 않은 경우

(3) 시간적 응집도(Temporal Cohesion)
특정 시간에 처리되는 기능들을 모아 모듈이 작성된 경우

(4) 절차적 응집도(Procedural Cohesion) 
모듈이 다수의 관련 기능을 가질 때 모듈 내의 구성 요소들이 기능을 순차적으로 수행할 경우

(5) 교환적 응집도(Communication Cohesion)
모듈 내의 요소들이 동일한 입출력을 사용하여, 서로 다른 기능을 수행하는 경우

(6) 순차적 응집도(Sequential Cohesion)
모듈 내의 한 요소의 출력 자료가 다음 요소이 입력 자료로 사용할 경우

(7) 기능적 응집도(Functional Cohesion)
모듈 내의 모든 요소들이 단일 기능을 수행될 경우


# 4
**다음 릴레이션이 몇 정규화인지 작성하시오**

![image](https://github.com/user-attachments/assets/9e9fba75-084d-44c1-ae0c-32fd550197ce)

```shell
[보기]

제 1정규형, 제 2정규형, 제3 정규형, BCNF 정규형
제 4 정규형 제 5정규형
```

데이터 베이스 정규형
도부이결다조

1정규형: 도메인이 원자값

2정규형: 부분적 함수 종속 제거

3정규형: 이행적 함수 종속

BCNF: 결정자이면서 후보키가 아닌 것 제거

4정규형: 다치 종속 제거

5정규형: 조인 종속성 이용

기본키는 (고객아이디, 인터넷강좌)이고 유일한 결정자여야 하는데
담당강사번호가  인터넷강좌를 결정하는 결정자가 되어 모든 결정자가 후보키가 아닌게 되어버림. (BCNF를 만족하지 못함)
원자성, 부분함수종속, 이행적함수종속이 완료된 상태라서 3정규형


# 5
**다음으로 알맞은 용어를 작성하시오**

```shell
1. 내부 라우팅 알고리즘 프로토콜이다.
2. 링크 상태를 벡터로 나타낸다.
3. 다익스트라 알고리즘을 사용한다.
4. 대규모 네트워크에 사용된다.
```
라우팅 프로토콜 (Routing Protocol)
- 라우팅을 '하는' 프로토콜을 의미
- BDP, EIGRP, OSPF 등이 해당 (라우팅 알고리즘)

라우티드 프로토콜 (Routed Protocol)
- 라우팅을 '당하는' 프로토콜을 의미
- TCP, IPX 등이 해당

# 6
**다음으로 알맞은 용어를 작성하시오**

```shell
[보기] 세미 조인, 세타 조인, 외부 조인, 동등 조인, 자연조인

① 조인에 참여하는 두 릴레이션의 속성 값을 비교하여 조건을 만족하는 튜플만 반환한다.

② 조건이 정확하게 '=' 등호로 일치하는 결과를 반환한다. 

③ ( ② ) 조인에서 조인에 참여한 속성이 두 번 나오지 않도록 중복된 속성을 제거한 결과를 반환한다.
```

① : 세타 조인
② : 동등 조인
③ : 자연 조인

# 7
**다음 자바 프로그램의 실행 순서를 작성하시오.**

```shell
class ClassOne {
	int x, y;
	ClassOne(int x, int y) {  // ①
		this.x = x;
		this.y = y;
	}
	int getArea() {  // ②
		return x * y;
	}
}
class ClassTwo extends ClassOne {
	int x;
	ClassTwo(int x) {  // ③
		super(x, x); 
	}
	int getArea(int x) {  // ④
		return x;
	}
}
public class ProcessFlow {  
	public static void main(String[] args) {  // ⑤
		ClassOne one = new ClassTwo(10);  // ⑥
		System.out.println(one.getArea());  // ⑦
	}
}

⑤ →
```

⑤ → ⑥ → ③ → ① → ⑦ → ②

# 8
**아래 코드에서 출력되는 값을 작성하시오.**

```shell
a = ["Seoul", "Kyeonggi", "Incheon", "Daejun", "Daegu", "Pusan"]
str01 = "S"
for i in a:
  str01 = str01 + i[1]
print(str01)
```

파이썬 리스트 문제

str01 = “S" String 변수 선언
for문으로 a 리스트 변수 호출

str01 String 변수를 str01 (S) + i[1] 값으로 조회되도록 재정의
i[1]은 a 리스트에서 1번째 자리의 문자열 호출

Seynaau

# 9
**아래 자바 코드에 맞는 출력을 작성하시오.**

```shell
class classOne {
	int a, b;
	public classOne(int a, int b) {
		this.a = a;
		this.b = b;
	}
	public int getP() {
		return a + b;
	}
}
class classTwo extends classOne {
	int po = 3;
	public classTwo(int i) {
		super(i, i+1);
	}
	public int getP() {
		return po * po;
	}
}
public class OverRiding {  
	public static void main(String[] args) {
		classOne a = new classTwo(10);
		System.out.println(a.getP());
	}
}
```

getP를 오버라이딩 했기 때문에 부모에서 선언한 메소드가 아닌 자식 메소드를 봐야함

오버라이딩 문제 상속받은 classTwo의 getP 값을 출력하는게 목표
getP는 po * po 값을 리턴받았으므로

3 * 3 = 9


# 10
**아래 그림에 맞는 답을 작성하시오.**

![image](https://github.com/user-attachments/assets/8ec30de4-21b7-4ae5-b76b-006c3e1ea501)

```shell
SELECT COUNT(*) FROM TABLE1 WHERE EMPNO > 100 AND SAL >= 3000 OR EMPNO = 200

COUNT = (    )
```

WHERE 에서 논리연산자 우선순위 : NOT > AND > OR

1(200)


# 11
**아래 설명에 맞는 디자인 패턴을 보기를 통해 작성하시오.**

![image](https://github.com/user-attachments/assets/f5b54bef-6f32-4708-92aa-ae49e3bede38)

```shell
구체적인 클래스에 의존하지 않으며 인터페이스를 통해 연관하거나 의존하는 객체들을 그룹으로 추상적으로 표현합니다. 연관된 클래스를 한번에 교체하는 것이 가능하다. 여러개의

(           )
```

Absteract Factory (추상 팩토리)
