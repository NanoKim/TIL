
# Table of Contents

- [Thymeleaf](#thymeleaf)
- [Environment](#environment)
- [What is Thymeleaf?](#what-is-thymeleaf)
- [pros and cons](#pros-and-cons)
- [How can I start?](#how-can-i-start)
- [Expression](#expression)
  - [Simple](#simple)
  - [Literal](#literal)
  - [String Operations](#string-operations)
  - [Math Opertaions](#math-opertaions)
  - [Boolean Operations](#boolean-operations)
  - [Equivalent Operations](#equivalent-operations)
  - [Condition Operations](#condition-operations)
- [Escape](#escape)
- [Grammer](#grammer)
  - [Annotation](#annotation)
  - [Variable](#variable)
  - [SpringEL](#springel)
  - [Safe Navigation Operator](#safe-navigation-operator)
  - [Local Variable](#local-variable)
  - [Image](#image)
  - [Hyper Link](#hyper-link)
  - [Calculation](#calculation)
  - [Property](#property)
  - [Loof](#loof)
  - [Switch Case](#switch-case)
  - [If, Unless](#if-unless)
  - [Literal, Instead of Literal](#literal-instead-of-literal)
  - [Block](#block)
  - [Classappend](#classappend)
  - [Validation](#validation)
  - [Javascript Inline](#javascript-inline)
  - [Template](#template)
- [Thymeleaf Object](#thymeleaf-object)
  - [Under Spring Boot v 3.0](#under-spring-boot-v-30)
  - [Over Spring Boot v 3.0](#over-spring-boot-v-30)
  - [Convenience Object](#convenience-object)
  - [Utility Object](#utility-object)

## Thymeleaf

![Thymeleaf](https://img.shields.io/badge/-Thymeleaf-005F0F?style=flat-square&logo=Thymeleaf&logoColor=white)


## What is Thymeleaf?

타임리프는 현대적인 자바 웹 애플리케이션 개발에서 가장 많이 사용되는 서버 사이드 템플릿 엔진(Server-side Template Engine)입니다. 서버에서 데이터를 받아와 HTML 파일에 동적으로 녹여낸 뒤, 완성된 결과물을 클라이언트(브라우저)에게 전달합니다.

| 구분 | 템플릿 엔진 | 특징 |
| :--- | :--- | :--- |
| **SSR 방식** | `Thymeleaf`, `JSP`, `Freemarker`, `Velocity` | 서버에서 HTML을 완성하여 전송 |
| **동작 원리** | **서버 사이드 렌더링** | 서버의 리소스를 사용하여 화면 생성 |
| **타임리프 장점** | **내추럴 템플릿** | 서버 없이 HTML 파일을 열어도 웹 브라우저에서 정상 출력 |

2. SSR(Server Side Rendering)의 동작 흐름
타임리프가 브라우저 화면을 생성하는 과정은 다음과 같습니다.

- 클라이언트 요청: 사용자가 웹 브라우저를 통해 특정 페이지를 요청합니다.
- 컨트롤러 처리: 스프링 부트의 컨트롤러가 비즈니스 로직을 처리하고, 결과 데이터를 ```Model``` 객체에 담습니다.
- 뷰 렌더링: 타임리프 엔진이 HTML 템플릿 파일과 ```Model``` 데이터를 결합하여 최종 HTML을 생성합니다.
- 응답 전송: 서버는 완성된 HTML 파일을 클라이언트에게 전송하고, 브라우저는 이를 그대로 화면에 뿌려줍니다.

3. 상세 특징 및 예시
✅ 내추럴 템플릿 (Natural Templates)
타임리프의 가장 큰 특징은 순수 HTML 구조를 유지한다는 점입니다. JSP와 달리 파일 확장자가 ```.html```이며, 웹 브라우저에서 직접 열어도 깨지지 않고 보입니다.

```html
<!-- 서버를 통하지 않고 파일을 열면 "기본 이름"이 보임 -->
<!-- 서버(타임리프)를 통해 렌더링되면 ${userName} 값으로 대체됨 -->
<p th:text="${userName}">기본 이름</p>
```

✅ 스프링 부트와의 강력한 통합
스프링 부트가 공식적으로 권장하는 템플릿 엔진인 만큼, 다음과 같은 기능을 완벽하게 지원합니다.

- 스프링 빈 접근: ```${@myBean.doSomething()}```
- 폼 바인딩: ```th:object```, ```th:field```를 이용한 편리한 데이터 전송
- 보안: Spring Security와 연동하여 권한별 화면 제어 가능


## pros and cons

타임리프는 현대적인 자바 웹 개발 환경, 특히 스프링 부트(Spring Boot) 생태계에서 가장 선호되는 템플릿 엔진입니다. 하지만 모든 도구가 그렇듯 확실한 강점과 고려해야 할 약점이 존재합니다.

1. 타임리프 장단점 요약

| 구분 | 주요 내용 | 상세 설명 |
| :--- | :--- | :--- |
| **장점** | **내추럴 템플릿 (Natural Templates)** | 서버 없이 웹 브라우저에서 파일을 열어도 깨지지 않고 정상 출력됨 |
| **장점** | **스프링 부트와의 완벽한 통합** | 스프링 부트에서 공식 권장하며 설정이 매우 간편하고 강력함 |
| **장점** | **직관적인 문법** | HTML 속성(`th:`) 기반으로 작성되어 HTML 구조를 해치지 않음 |
| **단점** | **상대적으로 느린 렌더링 속도** | 매 요청마다 템플릿을 해석하므로 JSP 등에 비해 성능이 소폭 낮음 |
| **단점** | **높은 러닝 커브** | 표현식(`SpEL`)이 매우 다양하고 강력하여 숙달하는 데 시간이 필요함 |
| **단점** | **엄격한 문법 검사** | XML/HTML 규격을 엄격히 따져 태그가 닫히지 않으면 에러가 발생함 |

2. 상세 분석
✅ 주요 장점
- 내추럴 템플릿 (Natural Template):
  - 타임리프는 순수 HTML 속성을 사용합니다. 덕분에 백엔드 개발자가 로직을 짜기 전에도 프론트엔드 개발자가 브라우저에서 디자인을 바로 확인할 수 있어 협업 효율이 극대화됩니다.
- 독립적인 실행 가능:
  - 서버를 구동하지 않고 로컬 PC에서 ```.html``` 파일을 더블 클릭해도 마크업 구조를 확인할 수 있습니다.
- Spring EL 지원:
  - 스프링의 데이터에 접근하거나 스프링 빈을 직접 호출하는 등 강력한 표현 언어를 템플릿 안에서 그대로 사용할 수 있습니다.

❌ 주요 단점
- 성능 이슈:
  - 완전한 컴파일 방식이 아닌 런타임에 템플릿을 파싱하고 렌더링하는 구조입니다. 대규모 트래픽이 발생하는 환경에서는 프리마커(FreeMarker)나 다른 엔진에 비해 응답 속도가 느릴 수 있습니다.
- 복잡한 표현식:
  - 비즈니스 로직이 템플릿에 과도하게 들어가면 코드가 매우 복잡해집니다. 이는 유지보수를 어렵게 만드는 원인이 됩니다.
- 문법의 엄격함:
  - JSP는 다소 유연하게 태그를 생략해도 넘어가지만, 타임리프는 태그 하나만 잘못 닫아도 페이지 전체가 오류 화면으로 변하므로 주의가 필요합니다.


## How can I start?

타임리프를 프로젝트에 도입하기 위한 초기 설정 단계입니다. 스프링 부트는 타임리프와의 자동 구성(Auto Configuration)을 지원하므로, 의존성만 추가하면 복잡한 설정 없이도 바로 사용할 수 있는 것이 큰 장점입니다.

📌 타임리프 설치 및 설정 단계

| 단계 | 항목 | 주요 작업 내용 |
| :--- | :--- | :--- |
| **1단계** | **의존성 추가** | `Maven` 또는 `Gradle`에 타임리프 라이브러리 추가 |
| **2단계** | **환경 설정** | `application.properties`를 통한 경로 및 캐시 설정 |
| **3단계** | **네임스페이스 선언** | HTML 태그에 `xmlns:th` 속성을 추가하여 문법 활성화 |

1. 상세 가이드
✅ 1) 의존성 추가 (Dependency)
사용 중인 빌드 도구에 맞춰 아래 코드를 추가합니다. 스프링 부트 관리하에 있으므로 별도의 버전 명시 없이도 최적의 버전을 가져옵니다.
- Maven (```pom.xml```)
```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

- Gradle (```build.gradle```)
```
implementation 'org.springframework.boot:spring-boot-starter-thymeleaf'
```

✅ 2) 환경 설정 (application.properties)
개발 시에는 수정 사항이 즉시 반영되도록 캐시를 끄는 설정이 유용합니다.
```
# 타임리프 활성화 여부 (기본값 true)
spring.thymeleaf.enabled=true

# 개발 시 캐시 비활성화 (수정 후 새로고침 시 바로 반영)
spring.thymeleaf.cache=false

# 템플릿 파일 경로 설정 (기본값은 templates/)
spring.thymeleaf.prefix=classpath:templates/

# 파일 확장자 설정 (기본값 .html)
spring.thymeleaf.suffix=.html
```

✅ 3) 타임리프 네임스페이스 추가
HTML 파일 상단에 타임리프 전용 문법을 인식하기 위한 경로를 추가해야 합니다.

```html
<!DOCTYPE html>
<!-- xmlns:th를 추가해야 th:text 등의 속성을 사용할 수 있습니다 -->
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Thymeleaf Page</title>
</head>
<body>
    <h1 th:text="${name}">기본 텍스트(정적 화면용)</h1>
</body>
</html>
```


## Expression

### Simple

타임리프에서 가장 자주 사용되는 5가지 핵심 표현식입니다.

1. 주요 표현식 종류 요약

| 종류 | 문법 예시 | 상세 설명 |
| :--- | :--- | :--- |
| **변수 식** | `${...}` | 컨텍스트 변수(Model 담긴 데이터)에 접근 |
| **선택 변수 식** | `*{...}` | `th:object`로 지정된 객체 내부 속성에 접근 |
| **메시지 식** | `#{...}` | 외부 메시지 소스(properties 파일 등)의 값 출력 |
| **링크 URL 식** | `@{...}` | 애플리케이션 경로를 포함한 서버사이드 URL 생성 |
| **조각 표현식** | `~{...}` | 템플릿의 특정 부분(Fragment)을 포함하거나 참조 |

2. 상세 활용 예시
✅ 변수 식 ```${...}``` vs 선택 변수 식 ```*{...}```
```*{...}```은 ```th:object```와 함께 사용되어 코드를 간결하게 만들어 줍니다.

```html
<!-- 일반적인 변수 접근 -->
<p th:text="${user.name}"></p>

<!-- 선택 변수 식 활용 -->
<div th:object="${user}">
    <p th:text="*{name}"></p> <!-- ${user.name}과 동일 -->
    <p th:text="*{age}"></p>  <!-- ${user.age}와 동일 -->
</div>
```

✅ 메시지 식 ```#{...}```
국제화(i18n)나 공통 문구를 관리하는 ```messages.properties``` 파일의 키값을 가져옵니다.

```html
<!-- messages.properties에 home.welcome=어서오세요! 가 있다면 -->
<h2 th:text="#{home.welcome}">Welcome Message</h2>
```

✅ 링크 URL 식 ```@{...}```
컨텍스트 패스나 쿼리 파라미터를 자동으로 처리해 줍니다.

```html
<!-- 단순 경로 -->
<a th:href="@{/main}">홈으로</a>

<!-- 쿼리 파라미터 포함: /user/profile?id=admin -->
<a th:href="@{/user/profile(id=${user.id})}">프로필</a>

<!-- 경로 변수 포함: /order/10 -->
<a th:href="@{/order/{orderId}(orderId=${order.id})}">주문확인</a>
```

✅ 조각 표현식 ```~{...}```
공통 레이아웃(헤더, 푸터 등)을 불러올 때 사용합니다.

```html
<!-- footer.html 파일의 'copy'라는 조각을 가져옴 -->
<footer th:insert="~{template/footer :: copy}"></footer>
```


### Literal

타임리프에서 '리터럴'이란 소스 코드에 직접 고정된 값을 의미합니다. 타임리프는 문자, 숫자, 불린, 널뿐만 아니라 특정 조건에서 따옴표 없이 사용할 수 있는 '리터럴 토큰'이라는 독특한 개념을 제공합니다.

1. 리터럴 종류 요약

| 종류 | 문법 예시 | 상세 설명 |
| :--- | :--- | :--- |
| **텍스트** | `'one text'`, `'Another!'` | 반드시 작은따옴표(`'`)로 감싸야 함 |
| **숫자** | `10`, `3.14`, `123` | 일반적인 정수 및 실수형 데이터 |
| **불린** | `true`, `false` | 논리 판단에 사용되는 참/거짓 값 |
| **널 (Null)** | `null` | 값이 없음을 명시적으로 나타낼 때 사용 |
| **리터럴 토큰** | `main`, `sometext` | 공백이나 특수문자가 없는 경우 따옴표 생략 가능 |

2. 상세 활용 예시
✅ 텍스트 및 숫자 리터럴
텍스트 리터럴은 작은따옴표로 감싸는 것이 원칙입니다. 따옴표 자체를 출력하고 싶다면 \'와 같이 이스케이프 처리를 합니다.

```html
<!-- 텍스트 출력 -->
<span th:text="'hello world'"></span>

<!-- 숫자 연산 -->
<span th:text="100 + 200"></span>
```

✅ 리터럴 토큰 (Literal Tokens)
타임리프에서는 알파벳(A-Z, a-z), 숫자(0-9), 대괄호([, ]), 점(.), 밑줄(_), 하이픈(-)으로만 구성된 문자열은 따옴표 없이 사용할 수 있습니다.

```html
<!-- 리터럴 토큰: 따옴표 없이 문자 사용 가능 -->
<div th:class="main_container"></div>

<!-- 주의: 공백이 포함되면 반드시 따옴표 필요 -->
<!-- <div th:text="hello world"></div> (에러 발생) -->
<div th:text="'hello world'"></div> (정상)
```

✅ 불린 및 널
주로 조건식(th:if)이나 비교 연산에서 활용됩니다.

```html
<!-- 불린 리터럴 -->
<div th:if="${user.active == true}">활성 상태</div>

<!-- 널 체크 -->
<div th:if="${data != null}">데이터가 존재합니다.</div>
```


### String Operations

타임리프에서 텍스트와 변수를 조합하는 방법은 두 가지가 있습니다. 단순한 결합은 ```+``` 연산자를 사용하고, 문장이 복잡해질 때는 ```|...|``` (Literal Substitution) 문법을 사용하면 훨씬 깔끔합니다.

1. 문자열 처리 방식 요약

| 방식 | 문법 예시 | 상세 설명 |
| :--- | :--- | :--- |
| **문자 합치기 (+)** | `'문자' + ${data}` | 자바와 동일하게 문자열 리터럴과 변수를 더함 |
| **리터럴 대체 (\|...\|)** | `\|문자 ${data}\|` | 더하기 연산자 없이 공백과 문자를 포함하여 한 번에 작성 |

2. 상세 활용 예시
✅ 문자 합치기 (```+```)
문자 리터럴을 사용할 때는 반드시 작은따옴표(```'```)로 감싸야 합니다. 감싸지 않으면 타임리프가 이를 변수명으로 오인하여 에러가 발생할 수 있습니다.

```html
<!-- '님 반갑습니다.'를 변수와 결합 -->
<span th:text="${user.name} + '님 반갑습니다.'"></span>

<!-- 복잡해지면 따옴표와 더하기가 많아져 가독성이 떨어짐 -->
<span th:text="'안녕, ' + ${user.name} + '! 당신의 점수는 ' + ${score} + '점입니다.'"></span>
```

✅ 리터럴 대체 (```|...|```)
더하기 연산자와 작은따옴표를 일일이 쓸 필요가 없어 매우 편리합니다. 파이썬의 f-string이나 자바스크립트의 템플릿 리터럴과 유사한 역할을 합니다.

```html
<!-- 리터럴 대체 문법으로 훨씬 깔끔하게 작성 -->
<span th:text="|안녕, ${user.name}! 당신의 점수는 ${score}점입니다.|"></span>

<!-- 응용: 클래스명을 동적으로 조합할 때도 유용 -->
<div th:class="|item-priority-${item.priority}|">우선순위별 아이템</div>
```


### Math Opertaions

타임리프는 자바와 동일한 산술 연산 기능을 제공합니다. 단순한 수치 계산뿐만 아니라, ```+``` 연산자를 이용한 문자열 합치기 등 템플릿 내에서 데이터를 가공할 때 유용하게 사용됩니다.

1. 산술 연산자 종류 요약

| 구분 | 연산자 | 상세 설명 |
| :--- | :--- | :--- |
| **이항 연산** | `+`, `-`, `*` | 더하기, 빼기, 곱하기 |
| **이항 연산** | `/`, `%` | 나누기, 나머지(Modulo) |
| **단항 연산** | `-` | 부호 반전 (음수 처리) |

2. 상세 활용 예시
변수 간의 계산뿐만 아니라 리터럴 수치와의 직접 연산도 가능합니다.

```html
<!-- 1. 기본적인 사칙 연산 -->
<ul>
    <li>더하기: <span th:text="${stats.count + 10}"></span></li>
    <li>나누기: <span th:text="${item.price / 2}"></span></li>
    <li>나머지: <span th:text="${item.id % 2 == 0} ? '짝수' : '홀수'"></span></li>
</ul>

<!-- 2. 문자열 합치기 (Concatenation) -->
<!-- '총 가격: 10000원' 형태로 출력 -->
<p th:text="'총 가격: ' + ${item.price} + '원'"></p>

<!-- 3. 단항 연산자 (음수 처리) -->
<!-- 변수값 앞에 마이너스 부호를 붙여 출력 -->
<span th:text="-${data.discountPrice}"></span>
```


### Boolean Operations

여러 조건을 조합하거나 결과를 반전시킬 때 사용하는 논리 연산자입니다. 가독성을 위해 기호(```&&```, ```||```) 대신 영문 키워드(```and```, ```or```, ```not```)를 사용하는 것이 타임리프의 권장 스타일.

1. 논리 연산자 종류 요약

| 구분 | 연산자 | 별칭 (Alias) | 상세 설명 |
| :--- | :--- | :--- | :--- |
| **이항 연산 (AND)** | `&&` | `and` | 두 조건이 모두 참이어야 참 |
| **이항 연산 (OR)** | `||` | `or` | 두 조건 중 하나만 참이어야 참 |
| **단항 연산 (NOT)** | `!` | `not` | 조건의 결과를 반전 (참 ↔ 거짓) |

2. 실전 활용 예제
논리 연산자를 사용하면 복잡한 권한 체크나 상태 확인 로직을 템플릿 레이어에서 간결하게 처리 가능.

```html
<!-- 1. AND 연산: 두 조건을 모두 충족할 때 -->
<!-- 나이가 20세 이상이면서 회원 등급이 'GOLD'인 경우 -->
<div th:if="${user.age >= 20 and user.grade == 'GOLD'}">
    <p>우수 성인 회원 전용 혜택</p>
</div>

<!-- 2. OR 연산: 하나라도 충족할 때 -->
<!-- 관리자이거나 매니저 권한이 있는 경우 -->
<button th:if="${user.role == 'ADMIN' or user.role == 'MANAGER'}">
    설정 메뉴
</button>

<!-- 3. NOT 연산: 결과를 반전시킬 때 -->
<!-- 활성 사용자가 아닌 경우 (not 키워드 활용) -->
<span th:if="${not user.active}">휴면 계정입니다.</span>

<!-- 기호(!)를 사용한 부정 연산 -->
<span th:if="${!user.isValid}">유효하지 않은 데이터입니다.</span>
```


### Equivalent Operations

타임리프는 일반적인 자바 연산자와 동일한 기호를 지원하지만, HTML 안에서 사용할 때 발생할 수 있는 특수 문자(```>```) 충돌을 방지하기 위해 별칭(Alias) 문법도 함께 제공합니다.

1. 연산자 종류 및 별칭 요약

| 구분 | 연산자 | 별칭 (Alias) | 상세 설명 |
| :--- | :--- | :--- | :--- |
| **비교** | `>`, `<` | `gt`, `lt` | 크다(Greater Than), 작다(Less Than) |
| **비교** | `>=`, `<=` | `ge`, `le` | 크거나 같다(Greater Equal), 작거나 같다(Less Equal) |
| **동등** | `==`, `!=` | `eq`, `ne` | 같다(Equal), 같지 않다(Not Equal) |

2. 상세 활용 예시
HTML 내에서 직접 ```<```, ```>``` 기호를 쓰면 태그로 오인될 수 있으므로, 별칭을 사용하는 것이 안전할 때가 많습니다.

```html
<!-- 1. 비교 연산자 사용 (숫자 비교) -->
<div th:if="${user.age >= 20}">성인 권장</div>
<div th:if="${user.age ge 20}">성인 권장 (별칭 사용)</div>

<!-- 2. 동등 연산자 사용 (객체/값 비교) -->
<!-- 결과가 참이면 'VIP' 출력 -->
<span th:text="${user.grade == 'VIP'} ? 'VIP' : '일반'"></span>
<span th:text="${user.grade eq 'VIP'} ? 'VIP' : '일반'"></span>

<!-- 3. 부정 연산 (부정문) -->
<div th:if="${user.status != 'BLOCK'}">활동 중</div>
<div th:if="${user.status ne 'BLOCK'}">활동 중 (별칭 사용)</div>
```


### Condition Operations

타임리프는 자바의 삼항 연산자와 유사한 문법을 제공하며, 특히 ```null``` 처리에 특화된 Elvis 연산자를 통해 코드를 간결하게 작성할 수 있습니다.

1. 조건식 종류 요약

| 형식 | 문법 예시 | 상세 설명 |
| :--- | :--- | :--- |
| **If-then** | `(cond) ? 'A'` | 조건이 참이면 'A' 출력, 거짓이면 빈 값 |
| **If-then-else** | `(cond) ? 'A' : 'B'` | 조건이 참이면 'A', 거짓이면 'B' 출력 |
| **Default (Elvis)** | `${data} ?: 'Default'` | 데이터가 존재하면 해당 값, `null`이면 기본값 출력 |

2. 상세 활용 예시

```html
<!-- 1. If-then: 참일 때만 특정 문구 노출 -->
<span th:text="(10 > 5) ? '참입니다'"></span>

<!-- 2. If-then-else: 조건에 따른 분기 처리 -->
<span th:text="(${user.age} >= 20) ? '성인' : '미성년자'"></span>

<!-- 3. Elvis 연산자: null 체크 및 기본값 설정 -->
<!-- data가 있으면 출력, 없으면 '데이터가 없습니다.' 출력 -->
<div th:text="${data} ?: '데이터가 없습니다.'"></div>

<!-- 4. No-Operation 활용: 데이터가 없으면 HTML 태그 안의 텍스트 유지 -->
<div th:text="${data} ?: _">기본 플레이스홀더 텍스트</div>
```


### Escape

- <를 \&lt;로 이스케이프
- \>를 \&gt;로 이스케이프
- &를 \&amp;로 이스케이프
- "를 \&quot;로 이스케이프
- '를 \&#39;로 이스케이프


## Grammer

### Annotation

타임리프는 용도에 따라 주석을 세 가지 방식으로 처리합니다. 소스 코드에는 남기되 브라우저에서는 보이지 않게 하거나, 정적 페이지일 때만 주석 처리하는 등 유연한 관리가 가능합니다.

1. 주석 종류 및 특징 요약

| 종류 | 문법 예시 | 상세 설명 |
| :--- | :--- | :--- |
| **표준 HTML 주석** | `<!-- 내용 -->` | 타임리프가 관여하지 않음. 브라우저 소스 보기에서 노출됨 |
| **타임리프 파서 주석** | `<!--/* 내용 */-->` | **가장 많이 사용.** 렌더링 시 주석 내용이 완전히 제거됨 |
| **프로토타입 주석** | `<!--/*/ 내용 /*/-->` | 정적 파일에선 주석, 타임리프 렌더링 시에는 태그로 부활 |

2. 상세 활용 예시
✅ 타임리프 파서 주석 (Parser Comments)
서버에서 렌더링될 때 주석 부분이 아예 삭제되므로, 보안상 중요한 로직이나 불필요한 설명을 숨기기에 좋습니다.

```html
<!--/* 단일 라인 주석 예시 */-->

<!--/* 
  다중 라인 주석 예시:
  렌더링 시 이 영역은 HTML 소스에 남지 않습니다.
  [[${data}]] 같은 변수 식도 무시됩니다.
*/-->
```

✅ 타임리프 프로토타입 주석 (Prototype-only Comments)
HTML 파일을 브라우저에서 직접 열었을 때는 주석 처리되어 보이지 않지만, 서버를 통해 렌더링될 때만 정상적인 HTML 태그로 나타나게 하고 싶을 때 사용합니다.

```html
<!--/*/
<div th:text="${data}">
    타임리프 렌더링 시에만 보이는 문구
</div>
/*/-->
```

3. 비교 포인트
- 표준 HTML 주석: 타임리프 엔진은 이를 무시하고 통과시키기 때문에 클라이언트 브라우저의 '페이지 소스 보기'를 하면 내용이 그대로 보입니다.
- 파서 주석: 개발 단계에서 메모를 남길 때 유용하며, 결과물인 HTML 파일에는 흔적조차 남지 않아 깔끔합니다.
- 프로토타입 주석: '내추럴 템플릿(Natural Templates)'의 특징을 가장 잘 보여주는 기능으로, 정적 디자인 시안을 해치지 않으면서 동적 기능을 숨겨둘 수 있습니다.


### Variable

타임리프는 기본적으로 HTML의 특수 문자를 안전하게 변환하는 Escape 처리를 지원합니다. 하지만 상황에 따라 HTML 태그를 그대로 반영해야 할 때가 있습니다.

1. 출력 방식 비교 (Escape vs Unescape)
가장 핵심적인 차이는 HTML 태그를 '글자'로 볼 것인지, '태그'로 해석할 것인지입니다.

| 기능 | 문법 (속성 방식) | 문법 (콘텐츠 방식) | 상세 설명 |
| :--- | :--- | :--- | :--- |
| **Escape** | `th:text="${data}"` | `[[${data}]]` | 태그를 문자로 치환 (HTML 엔티티 처리) |
| **Unescape** | `th:utext="${data}"` | `[(${data})]` | 태그를 그대로 렌더링하여 스타일 적용 |

2. 상세 설명 및 예시
컨트롤러에서 다음과 같은 데이터를 보냈다고 가정합니다.
```model.addAttribute("data", "Hello <b>Spring</b>!");```

✅ Escape (th:text)
- 특징: 웹 브라우저는 ```<b>```를 태그가 아닌 일반 문자열로 인식합니다.
- 렌더링 결과: ```Hello <b>Spring</b>!``` (태그가 화면에 그대로 노출됨)
- 실제 변환: ```Hello &lt;b&gt;Spring&lt;/b&gt;!```

✅ Unescape (th:utext)
- 특징: ```u```는 Unescaped의 약자입니다. HTML 태그를 해석하여 브라우저에 반영합니다.
- 렌더링 결과: Hello Spring! ("Spring" 글자가 굵게 표시됨)

📌 텍스트 출력: Escape vs Unescape
타임리프는 기본적으로 HTML의 특수 문자를 안전하게 변환하는 Escape 처리를 지원합니다. 하지만 상황에 따라 HTML 태그를 그대로 반영해야 할 때가 있습니다.

1. 출력 방식 비교 (Escape vs Unescape)
가장 핵심적인 차이는 HTML 태그를 '글자'로 볼 것인지, '태그'로 해석할 것인지입니다.

Markdown
| 기능 | 문법 (속성 방식) | 문법 (콘텐츠 방식) | 상세 설명 |
| :--- | :--- | :--- | :--- |
| **Escape** | `th:text="${data}"` | `[[${data}]]` | 태그를 문자로 치환 (HTML 엔티티 처리) |
| **Unescape** | `th:utext="${data}"` | `[(${data})]` | 태그를 그대로 렌더링하여 스타일 적용 |
2. 상세 설명 및 예시
컨트롤러에서 다음과 같은 데이터를 보냈다고 가정합니다.
model.addAttribute("data", "Hello <b>Spring</b>!");

✅ Escape (th:text)
특징: 웹 브라우저는 <b>를 태그가 아닌 일반 문자열로 인식합니다.

렌더링 결과: Hello <b>Spring</b>! (태그가 화면에 그대로 노출됨)

실제 변환: Hello &lt;b&gt;Spring&lt;/b&gt;!

✅ Unescape (th:utext)
특징: u는 Unescaped의 약자입니다. HTML 태그를 해석하여 브라우저에 반영합니다.

렌더링 결과: Hello Spring! ("Spring" 글자가 굵게 표시됨)

3. 코드 활용 예제

```html
<ul>
    <!-- 1. 속성을 이용한 텍스트 교체 -->
    <!-- th:text는 태그 내부의 '기본값'을 ${data} 값으로 완전히 대체합니다. -->
    <li>기본 출력: <span th:text="${data}">기본 텍스트</span></li>
    <li>태그 반영: <span th:utext="${data}">기본 텍스트</span></li>

    <hr>

    <!-- 2. 인라인 출력 (HTML 콘텐츠 영역에서 직접 사용) -->
    <!-- [[...]]은 th:text와 동일하게 escape 기능을 가집니다. -->
    <li>인라인 Escape: [[${data}]]</li>
    
    <!-- [(...)]은 th:utext와 동일하게 unescape 기능을 가집니다. -->
    <li>인라인 Unescape: [(${data})]</li>
</ul>
```

⚠️ 주의사항 (Security)
실무에서는 Escape(```th:text```)를 기본으로 사용해야 합니다. 사용자로부터 입력받은 데이터를 ```th:utext```로 그대로 출력할 경우, 악의적인 사용자가 ```<script>``` 태그를 삽입하여 XSS(Cross-Site Scripting) 공격을 시도할 수 있기 때문입니다. 태그를 직접 출력해야 하는 신뢰할 수 있는 데이터에만 제한적으로 ```th:utext```를 사용


### SpringEL

Spring EL(SpEL)은 스프링 프레임워크 전반에서 사용되는 강력한 표현 언어입니다. 타임리프와 결합하면 컨트롤러에서 전달받은 객체, 리스트, 맵 데이터를 매우 유연하게 추출할 수 있습니다.

1. Spring EL 데이터 접근 방식 요약
타임리프는 자바의 Getter(getProperty) 메서드를 자동으로 호출하는 프로퍼티 접근 방식을 지원합니다.

| 데이터 타입 | 접근 문법 예시 | 상세 설명 |
| :--- | :--- | :--- |
| **Object** | `${user.name}`, `${user['name']}` | 객체의 프로퍼티나 메서드에 직접 접근 |
| **List** | `${list[0].name}` | 인덱스를 통해 요소에 접근 후 속성 추출 |
| **Map** | `${map['key'].name}` | 키(Key)를 사용하여 값에 접근 후 속성 추출 |

2. 실전 코드 예제
💻 Java Controller 구성
컨트롤러에서 단일 객체, 리스트, 맵 세 가지 형태의 데이터를 모델에 담아 전송하는 시나리오입니다.

```java
@Controller
public class BookController {

    @Data
    static class Book {
        private String title;
        public Book(String title) { this.title = title; }
    }

    @GetMapping("/el-test")
    public String elTest(Model model) {
        Book b1 = new Book("만화책");
        Book b2 = new Book("소설책");

        // 1. 단일 객체
        model.addAttribute("singleBook", b1);

        // 2. 리스트 구조
        List<Book> bookList = List.of(b1, b2);
        model.addAttribute("bookList", bookList);

        // 3. 맵 구조
        Map<String, Book> bookMap = Map.of("first", b1, "second", b2);
        model.addAttribute("bookMap", bookMap);

        return "view/study";
    }
}
```

🔗 Thymeleaf / HTML 표현식

```html
<!-- 1. 단일 객체 접근 (Object) -->
<ul>
    <li>점 표기법: <span th:text="${singleBook.title}"></span></li>
    <li>대괄호 표기법: <span th:text="${singleBook['title']}"></span></li>
    <li>메서드 직접 호출: <span th:text="${singleBook.getTitle()}"></span></li>
</ul>

<!-- 2. 리스트 접근 (List) -->
<ul>
    <li>첫 번째 요소: <span th:text="${bookList[0].title}"></span></li>
    <li>인덱스 + 대괄호: <span th:text="${bookList[0]['title']}"></span></li>
    <li>리스트 내 메서드 호출: <span th:text="${bookList[1].getTitle()}"></span></li>
</ul>

<!-- 3. 맵 접근 (Map) -->
<ul>
    <li>키값으로 찾기: <span th:text="${bookMap['first'].title}"></span></li>
    <li>키값 + 대괄호: <span th:text="${bookMap['first']['title']}"></span></li>
    <li>맵 데이터 메서드 호출: <span th:text="${bookMap['second'].getTitle()}"></span></li>
</ul>
```


### Safe Navigation Operator

타임리프에서 모델 데이터를 참조할 때, 객체가 ```null```인 상태에서 내부 메서드를 호출하면 NullPointerException(NPE)이 발생하여 페이지 렌더링이 중단될 수 있습니다. 이를 우아하게 방지하기 위해 SpringEL이 제공하는 ```?.``` 문법을 사용합니다.

1. 문제 상황과 해결책

<!-- 서버에서 넘어온 errors 맵이 null이어도 안전하게 처리 -->
<div th:if="${errors?.containsKey('globalError')}">
    <p class="field-error" th:text="${errors['globalError']}">전체 오류 메시지</p>
</div>

<!-- 응용: 객체 그래프 탐색 시에도 유용 -->
<!-- user가 null이면 에러 없이 통과, 존재하면 name 접근 -->
<span th:text="${user?.name}">기본 사용자</span>

2. 동작 원리
th:if 속성은 전달받은 값이 ```false``` 또는 ```null```일 경우 해당 태그를 렌더링하지 않습니다.

- ```errors```가 존재할 때: 정상적으로 ```containsKey()``` 결과(```true```/```false```)를 판단합니다.
- ```errors```가 ```null```일 때: ```?.``` 구문에 의해 뒷부분은 실행되지 않고 결과값으로 null이 전달됩니다. 타임리프는 이를 '조건 미충족'으로 간주하여 에러 발생 없이 해당 태그를 화면에서 제외합니다.

3. 코드 활용 예제

```html
<!-- 서버에서 넘어온 errors 맵이 null이어도 안전하게 처리 -->
<div th:if="${errors?.containsKey('globalError')}">
    <p class="field-error" th:text="${errors['globalError']}">전체 오류 메시지</p>
</div>

<!-- 응용: 객체 그래프 탐색 시에도 유용 -->
<!-- user가 null이면 에러 없이 통과, 존재하면 name 접근 -->
<span th:text="${user?.name}">기본 사용자</span>
```


### Local Variable

타임리프에서 특정 태그 범위 내에서만 사용할 수 있는 지역 변수를 정의할 때 ```th:with``` 속성을 사용합니다. 복잡한 식을 변수에 담아 가독성을 높이거나, 반복적으로 사용하는 데이터를 짧은 이름으로 치환할 때 유용합니다.

1. 주요 특징 및 규칙
- 변수 유효 범위(Scope): ```th:with```를 정의한 태그의 시작 태그부터 종료 태그까지만 유효합니다.
- 가독성 향상: ```${items[0].category.name}```처럼 긴 참조 식을 ```${catName}```과 같이 짧게 줄여서 코드를 깔끔하게 만듭니다.
- 다중 선언: 쉼표(```,```)를 구분자로 사용하여 한 번에 여러 변수를 정의할 수 있습니다.

2. 코드 활용 예시

```html
<!-- books 리스트의 첫 번째 요소를 'first'라는 별칭으로 정의 -->
<div th:with="first=${books[0]}">
    <h3>추천 도서 안내</h3>
    <p>오늘의 선정 도서명은 <span th:text="${first.name}">책 제목</span>입니다.</p>
    <p>저자: <span th:text="${first.author}">작가명</span></p>
</div>

<!-- 다중 변수 선언 예시 -->
<div th:with="user=${session.user}, isAdmin=${session.user.role == 'ADMIN'}">
    <p th:if="${isAdmin}">관리자 권한으로 접속 중입니다.</p>
    <p>사용자 아이디: <span th:text="${user.id}">ID</span></p>
</div>
```

3. 요약 및 주의사항

| 항목 | 상세 내용 |
| :--- | :--- |
| **정의** | 타임리프 전용 지역 변수 선언 문법 |
| **Scope** | 선언된 태그와 그 자식 요소 내에서만 사용 가능 |
| **활용** | 복잡한 객체 그래프 탐색 결과를 재사용할 때 권장 |


### Image

HTML에서 이미지를 불러올 때 사용하는 ```src``` 속성을 타임리프에서 동적으로 제어하려면 ```th:src```를 사용합니다. 데이터베이스에서 가져온 이미지 경로 처리에 필수적인 문법입니다.

1. 기본 사용법
주로 컨트롤러에서 넘겨준 객체나 맵(Map)에 담긴 URL 정보를 바인딩할 때 활용합니다.

| 속성 | 문법 예시 | 상세 설명 |
| :--- | :--- | :--- |
| **th:src** | `th:src="${data.imageUrl}"` | 서버 데이터로 이미지 경로를 동적으로 할당 |

2. 코드 활용 예시
서버에서 넘겨준 데이터 리스트(dataList) 안에 이미지 주소가 들어있을 때, 마운트하는 예제입니다.

```html
<!-- 1. 기본 객체 데이터 바인딩 -->
<img class="img-content" th:src="${dataList.IMG_URL}" alt="상품 이미지">

<!-- 2. URL 표현식(@)과 결합 (정적 리소스 경로 처리 시) -->
<img class="thumbnail" th:src="@{/images/logo.png}" alt="로고">

<!-- 3. 경로와 변수 결합 (리터럴 대체 문법 활용) -->
<img class="user-profile" th:src="|/upload/profile/${user.id}.jpg|" alt="프로필">
```


### Hyper Link

타임리프에서 URL을 생성할 때는 ```@{...}``` 구문을 사용합니다. 이 방식의 가장 큰 장점은 서블릿 컨텍스트 경로(Context Path)를 자동으로 계산해서 붙여준다는 점입니다.

💡 서블릿 컨텍스트(Servlet Context)란?
톰캣(Tomcat) 같은 WAS에서 웹 애플리케이션이 실행되는 환경을 의미합니다. 애플리케이션 전체에서 공유되는 설정이나 정보를 담고 있으며, 배포 환경에 따라 변하는 컨텍스트 경로를 타임리프가 알아서 처리해 주므로 링크 깨짐을 방지할 수 있습니다.

1. URL 생성 기본 규칙
타임리프는 경로 변수(PathVariable)와 쿼리 파라미터를 아주 직관적인 문법으로 지원합니다.

| 생성 방식 | 문법 예시 | 결과 URL 예시 |
| :--- | :--- | :--- |
| **단순 경로** | `@{/hello}` | `/hello` |
| **쿼리 파라미터** | `@{/hello(p1=${v1})}` | `/hello?p1=v1` |
| **경로 변수** | `@{/hello/{p1}(p1=${v1})}` | `/hello/v1` |
| **혼합 방식** | `@{/hello/{p1}(p1=${v1}, p2=${v2})}` | `/hello/v1?p2=v2` |

2. 상세 활용 예시
서버(Controller)에서 아래와 같은 데이터를 모델에 담아 보냈다고 가정했을 때의 활용법

```java
// Controller 데이터 세팅
model.addAttribute("param1", "data1");
model.addAttribute("param2", "data2");
```

```html
<ul>
  <!-- 1. 가장 기본적인 절대 경로 생성 -->
  <li><a th:href="@{/hello}">기본 URL</a></li>

  <!-- 2. 쿼리 파라미터 추가: (key=value) 형식을 사용 -->
  <!-- 결과: /hello?param1=data1&param2=data2 -->
  <li><a th:href="@{/hello(param1=${param1}, param2=${param2})}">쿼리 파라미터 방식</a></li>

  <!-- 3. 경로 변수(PathVariable) 활용: URL 내에 {변수명}을 넣고 괄호 안에서 매핑 -->
  <!-- 결과: /hello/data1/data2 -->
  <li><a th:href="@{/hello/{param1}/{param2}(param1=${param1}, param2=${param2})}">경로 변수 방식</a></li>

  <!-- 4. 경로 변수와 쿼리 파라미터 혼용: 괄호 안에서 매핑되지 않은 값은 자동으로 쿼리 파라미터가 됨 -->
  <!-- 결과: /hello/data1?param2=data2 -->
  <li><a th:href="@{/hello/{param1}(param1=${param1}, param2=${param2})}">혼합 방식</a></li>
</ul>
```


### Calculation

타임리프의 연산 체계는 자바 문법과 유사하지만, HTML 파일 내에서 작성되므로 태그 기호(```<```, ```>```)와의 충돌을 방지하기 위한 HTML 엔티티 또는 약어 사용에 주의해야 합니다.

1. 산술 및 비교 연산
비교 연산의 경우 HTML 특수문자 처리를 위해 약어(```gt```, ```lt``` 등)를 사용하는 것이 가장 안전하고 가독성이 좋습니다.

| 구분 | 연산자 / 약어 | 예시 | 결과 |
| :--- | :--- | :--- | :--- |
| **산술** | `+`, `-`, `*`, `/`, `%` | `th:text="10 + 2"` | `12` |
| **비교 (>)** | `>`, `&gt;`, `gt` | `th:text="1 gt 10"` | `false` |
| **비교 (<)** | `<`, `&lt;`, `lt` | `th:text="1 lt 10"` | `true` |
| **비교 (>=)** | `>=`, `ge` | `th:text="1 ge 10"` | `false` |
| **비교 (<=)** | `<=`, `le` | `th:text="1 le 10"` | `true` |
| **동등/부정** | `==` (eq), `!=` (ne) | `th:text="1 == 10"` | `false` |

2. 조건식과 Elvis 연산자
자바의 삼항 연산자와 유사한 방식부터, null 데이터를 우아하게 처리하는 Elvis 연산자까지 지원합니다.

👉 삼항 연산자
조건에 따라 다른 텍스트를 출력할 때 사용합니다.
- 코드: ```<span th:text="(10 % 2 == 0)? '짝수':'홀수'"></span>```
- 결과: ```짝수```

👉 Elvis 연산자 (```?:```)
데이터가 존재하면 해당 값을 출력하고, ```null```일 경우에만 지정한 기본값을 출력합니다.
- 데이터가 있을 때: ```${data} ?: '기본값'``` → ```Spring!```
- 데이터가 null일 때: ```${nullData} ?: '기본값'``` → ```기본값```

3. No-Operation (```_```)
타임리프의 특수 기호인 ```_```은 "아무 작업도 하지 않음"을 의미합니다. 이를 활용하면 데이터가 없을 때 타임리프의 실행을 무시하고 HTML에 작성된 기본 텍스트를 그대로 유지할 수 있습니다.

```html
<ul>
  <!-- 데이터가 있으면 Spring!, 없으면 '데이터가 없습니다.' 출력 -->
  <li>Elvis: <span th:text="${nullData} ?: '데이터가 없습니다.'"></span></li>

  <!-- 데이터가 null이면 th:text 자체를 무시하고 태그 안의 '기본 텍스트'를 노출 -->
  <li>No-Op: <span th:text="${nullData} ?: _">기본 텍스트</span></li>
</ul>
```

- 결과 (nullData일 때): ```기본 텍스트```가 그대로 화면에 렌더링됩니다.

💡 정리 및 팁
1. 비교 연산: HTML 엔티티(```&gt;```)보다는 직관적인 약어(```gt```, ```lt``` 등) 사용을 적극 권장합니다.
2. Elvis vs No-Op:
- 서버에서 정의한 특정 문구를 보여주고 싶다면 Elvis(```?: '문구'```)를 사용.
- HTML에 미리 작성해둔 정적 디자인(Placeholder 등)을 유지하고 싶다면 No-Op(```?: _```)이 유리합니다.


### Property

타임리프는 HTML 태그 내부에 ```th:*``` 속성을 삽입하여 기존의 정적 속성을 동적으로 제어합니다. 서버 렌더링 시 타임리프 속성이 기존 속성을 대체하거나 새롭게 생성하며 화면을 구성합니다.

1. 속성 설정 (Attribute Setting)
타임리프 속성이 선언되어 있으면, 렌더링 시 기존 HTML 속성을 밀어내고 ```th:``` 뒤에 붙은 이름의 속성으로 값을 치환합니다.

- 코드: ```<input type="text" name="original" th:name="changedUser" />```
- 결과: ```<input type="text" name="changedUser" />```
- 특징: 기존 ```name``` 속성값이 서버 데이터로 교체됩니다.

2. 속성 추가 (Attribute Addition)
기존에 설정된 클래스나 속성값에 내용을 덧붙여야 할 때 유용한 기능들입니다.

| 구분 | 코드 예시 | 렌더링 결과 | 상세 설명 |
| :--- | :--- | :--- | :--- |
| **attrappend** | `th:attrappend="class=' active'"` | `class="btn active"` | 기존 값 **뒤**에 공백을 포함해 추가 |
| **attrprepend** | `th:attrprepend="class='important '"` | `class="important btn"` | 기존 값 **앞**에 공백을 포함해 추가 |
| **classappend** | `th:classappend="active"` | `class="btn active"` | **가장 권장됨.** 공백을 신경 쓰지 않아도 자연스럽게 클래스 추가 |

3. 체크박스 처리 (Checked Handling)
HTML 표준에서는 ```checked="false"```라고 적어도 ```checked```라는 단어가 속성에 포함되어 있으면 무조건 체크된 상태로 표시되는 불편함이 있습니다. 타임리프는 이를 논리적인 방식(```boolean```)으로 해결합니다.

- 일반 HTML: ```<input type="checkbox" checked="false" />``` → 체크됨 (브라우저 오류 아님, HTML 표준 명세)
- 타임리프 활용: ```<input type="checkbox" th:checked="${isActive}" />```
  - ```${isActive}```가 ```false```일 경우: ```<input type="checkbox" />``` (속성 자체가 삭제되어 체크 해제)
  - ```${isActive}```가 `true```일 경우: ```<input type="checkbox" checked="checked" />``` (체크 유지)


### Loof

타임리프에서 컬렉션(List, Map, Array 등)의 데이터를 순회하며 출력할 때는 ```th:each``` 속성을 사용합니다. 자바의 ```for-each``` 문과 유사한 구조로, 지정한 요소의 개수만큼 태그를 반복해서 생성합니다.

1. 기본 사용법
반복하고자 하는 태그에 ```th:each="변수명 : ${컬렉션명}"``` 형식을 선언합니다.

```html
<!-- items 리스트를 순회하며 행(tr)을 생성 -->
<tr th:each="item : ${items}">
    <td th:text="${item.id}">아이디</td>
    <td th:text="${item.itemName}">상품명</td>
    <td th:text="${item.price}">가격</td>
</tr>
```

2. 반복 상태 확인 (Status)
반복의 현재 순서, 전체 개수, 홀수/짝수 여부 등 메타 데이터가 필요할 때는 두 번째 파라미터를 추가하여 상태 객체를 활용할 수 있습니다.

- 선언 방식: ```th:each="user, userStat : ${users}"```
- 생략 규칙: 두 번째 파라미터를 적지 않으면, 기본 변수명에 ```Stat```을 붙인 이름(```userStat```)으로 자동 생성되어 사용할 수 있습니다.

👉 상태 유지 기능 활용 예시

```html
<table border="1">
    <thead>
        <tr>
            <th>번호(count)</th>
            <th>인덱스(index)</th>
            <th>이름</th>
            <th>나이</th>
            <th>총합(size)</th>
            <th>홀짝(even/odd)</th>
            <th>처음/끝(first/last)</th>
        </tr>
    </thead>
    <tbody>
        <tr th:each="user, userStat : ${users}">
            <!-- 1부터 시작하는 번호 -->
            <td th:text="${userStat.count}">1</td>
            <!-- 0부터 시작하는 인덱스 -->
            <td th:text="${userStat.index}">0</td>
            <td th:text="${user.username}">유저명</td>
            <td th:text="${user.age}">20</td>
            <!-- 전체 데이터 개수 -->
            <td th:text="${userStat.size}">5</td>
            <!-- 짝수/홀수 여부 (boolean) -->
            <td>
                <span th:if="${userStat.even}">짝수행</span>
                <span th:if="${userStat.odd}">홀수행</span>
            </td>
            <!-- 처음과 마지막 요소 체크 -->
            <td>
                <span th:if="${userStat.first}">시작</span>
                <span th:if="${userStat.last}">종료</span>
            </td>
        </tr>
    </tbody>
</table>
```

3. 주요 상태 속성 정리

| 속성명 | 설명 | 비고 |
| :--- | :--- | :--- |
| **index** | 0부터 시작하는 현재 인덱스 | |
| **count** | 1부터 시작하는 순번 | 주로 게시판 번호 출력에 사용 |
| **size** | 전체 요소의 개수 | |
| **even / odd** | 현재 행이 짝수인지 홀수인지 여부 | `boolean` (count 기준) |
| **first / last** | 현재 행이 첫 번째 혹은 마지막인지 여부 | `boolean` |
| **current** | 현재 순회 중인 객체 그 자체 | `${user}`와 동일 |


### Switch Case

하나의 변수 값에 따라 여러 가지 케이스 중 하나를 선택해 출력해야 할 때는 ```th:switch```와 ```th:case``` 문법을 사용합니다. 자바의 ```switch-case``` 문과 구조가 매우 유사하여 직관적으로 조건부 렌더링을 처리할 수 있습니다.

1. 주요 속성 및 규칙
- ```th:switch```: 기준이 되는 변수나 식을 정의합니다. 부모 태그에 선언하여 하위 케이스들을 제어합니다.
- ```th:case```: ```th:switch```에서 지정한 값과 일치할 경우 해당 태그를 렌더링합니다.
- ```th:case="*"```: 앞선 모든 케이스에 해당하지 않을 때 노출되는 기본값(default) 설정입니다.

2. 코드 활용 예시

```html
<div th:switch="${userType}">
    <p th:case="'admin'">시스템 관리자 권한으로 접속 중입니다.</p>
    <p th:case="'user'">일반 회원 페이지입니다.</p>
    <p th:case="'guest'">방문자 모드입니다. 로그인이 필요합니다.</p>
    
    <!-- 모든 조건이 일치하지 않을 때 실행되는 Default 섹션 -->
    <p th:case="*">등록되지 않은 사용자 유형입니다.</p>
</div>
```

3. 동작 특징
- 배타적 선택: 여러 케이스 중 일치하는 단 하나의 태그만 화면에 나타납니다.
- Default 처리: ```*``` 기호를 활용하면 예상치 못한 데이터가 들어왔을 때의 예외 처리를 HTML 수준에서 간편하게 해결할 수 있습니다.


### If, Unless

타임리프에서 특정 조건에 따라 태그를 화면에 노출하거나 숨겨야 할 때 ```th:if```와 ```th:unless```를 사용합니다. 만약 조건이 맞지 않으면 해당 태그는 서버 렌더링 단계에서 완전히 제거됩니다.

1. 주요 속성 설명
- ```th:if```: 지정한 조건이 참(true)일 때만 해당 태그를 렌더링합니다.
- ```th:unless```: ```th:if```의 반대 개념으로, 지정한 조건이 거짓(false)일 때만 해당 태그를 렌더링합니다. (Java의 ```if (!condition)```과 동일)

2. 코드 활용 예시

```html
<!-- 나이가 20세 미만(lt)일 때만 출력 -->
<span th:text="'미성년자'" th:if="${user.age lt 20}"></span>

<!-- 나이가 20세 이상(ge)이 아닐 때만 출력 (위와 동일한 결과) -->
<span th:text="'미성년자'" th:unless="${user.age ge 20}"></span>
```

3. 렌더링 동작 방식

- 조건 만족 시 (```user.age = 15```):
  - ```<span>미성년자</span>```가 정상적으로 브라우저에 전달됩니다.
- 조건 불만족 시 (```user.age = 25```):
  - 해당 ```<span>``` 태그 자체가 DOM에서 삭제되어 아무것도 출력되지 않습니다.

💡 비교 연산자 가이드

타임리프에서는 HTML 특수문자(```>```)와의 혼동을 피하기 위해 다음과 같은 약어 사용을 권장합니다.

- ```lt``` (<) : Lower Than
- ```le``` (<=) : Lower or Equal
- ```gt``` (>) : Greater Than
- ```ge``` (>=) : Greater or Equal
- ```eq``` (==) : Equal
- ```ne``` (!=) : Not Equal


### Literal, Instead of Literal

타임리프에서 리터럴이란 코드에 직접 작성한 값을 의미합니다. 문자, 숫자, 불린 등 다양한 타입이 존재하지만, 특히 문자 리터럴을 다룰 때는 규칙을 정확히 지켜야 오류를 방지할 수 있습니다.

1. 문자 리터럴 사용 규칙
타임리프에서 문자는 원칙적으로 작은따옴표(```'```)로 감싸야 합니다.

- 표준 방식: ```<span th:text="'hello'">```

2. 작은따옴표 생략 조건 (Token)
문자가 공백 없이 이어진 '토큰' 형태(```A-Z```, ```a-z```, ```0-9```, ```[]```, ```.```, ```-```, ```_```로 구성)라면 예외적으로 따옴표를 생략할 수 있습니다.

- 생략 가능: ```<span th:text="hello">```
- 생략 불가 (오류 발생): ```<span th:text="hello world!">```
  - 중간에 공백이 포함되어 있으므로 반드시 ``'hello world!'```와 같이 감싸야 합니다.

3. 리터럴 대체 문법: ```|...|```
문자 리터럴과 변수 식(```${~}```)을 혼합해서 사용할 때, 더하기(```+```) 연산자를 계속 사용하는 것은 매우 번거롭습니다. 이때 리터럴 대체(Literal Substitutions) 문법을 사용하면 마치 하나의 문장을 쓰듯 편리하게 작성할 수 있습니다.

👉 활용 예시 비교

```html
<ul>
  <!-- 1. 더하기 연산자 활용: 따옴표와 + 기호를 일일이 작성해야 함 -->
  <li>연산자 방식: <span th:text="'hello' + ' world!'"></span></li>
  <li>변수 결합: <span th:text="'Welcome, ' + ${data} + '!'"></span></li>

  <!-- 2. 리터럴 대체 방식: | 기호 내부에 자유롭게 작성 -->
  <li>리터럴 대체: <span th:text="|hello world!|"></span></li>
  <li>변수 결합(간결): <span th:text="|Welcome, ${data}!|"></span></li>
</ul>
```


### Block

타임리프는 기본적으로 HTML 태그 내부에 속성(th:attr)을 추가하여 기능을 구현하는 방식을 지향합니다. 하지만 루프를 돌리거나 조건문을 적용할 때 적절한 HTML 태그가 마땅치 않거나, 특정 태그로 감싸기 애매한 상황이 발생합니다. 이때 유용하게 사용할 수 있는 유일한 자체 태그가 바로 ```th:block```입니다.

1. 주요 특징
- 태그 없는 로직 처리: HTML 구조를 깨뜨리지 않고 타임리프의 제어 문법(반복문, 조건문 등)만 적용하고 싶을 때 사용합니다.
- 렌더링 후 소멸: 서버에서 결과물을 생성할 때 ```th:block``` 태그 자체는 완전히 사라지고, 그 안의 내용만 브라우저에 전달됩니다.
- 사용 예시: 두 개 이상의 ```<div>``` 태그를 한꺼번에 ```th:each```로 반복해야 할 때 유용합니다.

2. 코드 활용 예시

```html
<!-- 두 개의 div를 하나의 묶음으로 반복하고 싶을 때 -->
<th:block th:each="user : ${users}">
    <div>사용자 이름: <span th:text="${user.username}">유저A</span></div>
    <div>사용자 나이: <span th:text="${user.age}">20</span></div>
</th:block>
```

3. 렌더링 결과 (브라우저 확인 시)
서버 렌더링이 완료되면 ```<th:block>``` 태그는 흔적도 없이 사라지고 내부의 HTML만 남게 됩니다.

```html
<!-- 실제 브라우저에 전달되는 소스 -->
<div>사용자 이름: <span>유저A</span></div>
<div>사용자 나이: <span>20</span></div>

<div>사용자 이름: <span>유저B</span></div>
<div>사용자 나이: <span>22</span></div>
```


### Classappend

타임리프에서 조건에 따라 CSS 클래스를 추가하거나 유지해야 할 때, 기존의 ```th:class```를 이용한 if-else 방식보다 훨씬 영리하고 간결한 방법이 있습니다. 바로 ```th:classappend```와 타임리프의 특수 기호인 No-Operation(```_```)을 조합하는 것입니다.

1. 기존 방식: ```th:class```를 이용한 전체 교체
기존에는 클래스 전체를 조건식에 넣어 제어했습니다. 이 방식은 조건이 맞지 않을 때 기본적으로 유지해야 하는 클래스(```form-control```)까지 매번 명시해야 하므로 코드가 중복되고 길어집니다.

```html
<!-- AS-IS: 전체 클래스를 조건부로 렌더링 -->
<input type="text" id="itemName" th:field="*{itemName}"
       th:class="${errors?.containsKey('itemName')} ? 'form-control field-error' : 'form-control'"
       class="form-control" placeholder="이름을 입력하세요">
```

2. 개선 방식: ```th:classappend```와 ```_``` (No-Op) 활용
```th:classappend```를 사용하면 기존 ```class``` 속성에 정의된 값은 그대로 두고, 필요한 클래스만 뒤에 덧붙이는 방식으로 동작합니다. 여기에 ```_```(언더스코어)를 사용하면 "아무것도 하지 않음"을 의미하여 코드가 매우 깔끔해집니다.

```html
<!-- TO-BE: 기존 클래스는 유지하고 에러 시에만 추가 -->
<input type="text" id="itemName" th:field="*{itemName}"
       th:classappend="${errors?.containsKey('itemName')} ? 'field-error' : _"
       class="form-control" placeholder="이름을 입력하세요">
```

💡 왜 이 방식이 더 좋은가?
- 코드의 간결성: 공통 클래스인 ```form-control```을 조건식마다 반복해서 적을 필요가 없습니다.
- No-Operation (```_```)의 활용: 조건이 거짓(```false```)일 때 타임리프가 해당 속성 실행을 무시하도록 설정하여, HTML에 불필요한 공백이나 속성이 남지 않게 합니다.
- 가독성 향상: 어떤 클래스가 '고정'이고 어떤 클래스가 '동적(에러 상태)'인지 한눈에 파악할 수 있습니다.

렌더링 결과 비교
- 에러가 있을 때 (```containsKey```가 true):
  - ```class="form-control field-error"```
- 에러가 없을 때 (```containsKey```가 false):
  - ```class="form-control"``` (기존 클래스만 깔끔하게 유지)


### Validation

BindingResult를 활용한 검증과 타임리프 통합

스프링 프레임워크는 BindingResult를 통해 폼 데이터의 유효성 검증 결과를 관리합니다. 타임리프는 이 BindingResult와 긴밀하게 통합되어, 서버에서 발생한 검증 오류를 화면에 간단하게 뿌려줄 수 있는 전용 기능을 제공합니다.

서버가 담아주는 에러는 크게 두 가지 범주로 나뉩니다.
- FieldError: 아이디, 비밀번호 등 특정 입력 필드에서 발생한 오류
- ObjectError (Global Error): 특정 필드를 넘어선 복합적인 조건(예: 아이디/비번 불일치)에서 발생한 전역 오류

1. 글로벌 오류(ObjectError) 처리
특정 필드에 귀속되지 않는 전체 시스템 오류는 ```#fields.hasGlobalErrors()```를 사용하여 체크합니다. 글로벌 오류는 여러 개가 발생할 수 있으므로 ```th:each```로 반복 출력하는 것이 정석입니다.

```html
<!-- 글로벌 에러 메시지 출력 영역 -->
<div th:if="${#fields.hasGlobalErrors()}">
    <p class="field-error" 
       th:each="err : ${#fields.globalErrors()}" 
       th:text="${err}">전체 에러 메시지 서빙</p>
</div>
```
- ```#fields.hasGlobalErrors()```: 전역 오류가 하나라도 존재하면 해당 블록을 활성화합니다.
- ```#fields.globalErrors()```: ```BindingResult```에 담긴 모든 ```ObjectError``` 목록을 반환합니다.

2. 필드 오류(FieldError) 처리
특정 입력창에 대한 에러는 ```th:errors```와 ```th:errorclass```를 사용하면 코드가 획기적으로 줄어듭니다.

```html
<label for="itemName" th:text="#{label.item.itemName}">상품명</label>
<input type="text" id="itemName" th:field="*{itemName}"
       th:errorclass="field-error" 
       class="form-control" 
       placeholder="상품명을 입력하세요">

<!-- 에러가 있을 때만 노출되는 영역 -->
<div class="field-error" th:errors="*{itemName}">상품명 검증 오류</div>
```

핵심 기능 설명
- ```th:errorclass```:
  - 기존에는 ```th:classappend="${#fields.hasErrors('itemName')} ? 'field-error' : ''"```와 같이 복잡한 삼항 연산자를 써야 했습니다.
  - ```th:errorclass```를 쓰면 ```th:field```에 지정된 필드에 에러가 감지되는 순간 설정된 클래스(```field-error```)를 자동으로 추가해 줍니다.
- ```th:errors```:
  - 해당 필드에 에러가 있으면 태그를 노출하고, ```BindingResult```에 등록된 ```defaultMessage```를 텍스트로 치환합니다. 에러가 없으면 태그 자체가 렌더링되지 않습니다.

요약 및 정리
스프링과 타임리프의 협업을 통해 검증 로직을 구현할 때의 이점은 다음과 같습니다.

- ```#fields ```객체: ```BindingResult```가 제공하는 모든 검증 정보에 접근하는 창구 역할을 합니다.
- ```th:errors```: 조건문(if)을 직접 작성하지 않아도 에러가 있을 때만 해당 메시지를 출력해 줍니다.
- ```th:errorclass```: 에러 발생 시 입력창의 스타일(테두리 색상 등)을 변경하는 로직을 직관적으로 만들어 줍니다.

이를 통해 복잡한 제어문 없이도 사용자에게 친절한 검증 피드백 화면을 구성할 수 있습니다.


### Javascript Inline

타임리프는 자바스크립트 내에서 타임리프 변수를 훨씬 안전하고 편리하게 다룰 수 있도록 자바스크립트 인라인(Javascript Inline) 기능을 제공합니다. 이 기능을 활성화하면 단순히 변수 값을 치환하는 것을 넘어, 자바스크립트 문법에 맞는 자동 이스케이프와 JSON 변환 등을 지원합니다.
- 선언 방식: ```<script th:inline="javascript">```

👉 적용 전 (Standard Script)
인라인 기능을 사용하지 않으면 개발자가 직접 따옴표를 관리해야 하며, 객체 출력 시 데이터가 깨지는 현상이 발생할 수 있습니다.

```html
<script>
  // 문자 타입의 경우 직접 따옴표를 감싸지 않으면 에러 발생 위험
  var username = "[[${user.username}]]";
  var age = [[${user.age}]];

  // 내추럴 템플릿 처리 미흡
  var username2 = /*[[${user.username}]]*/ "test username";

  // 객체 출력 시 toString() 결과가 그대로 노출됨
  var user = [[${user}]];
</script>
```

👉 적용 후 (Javascript Inline)
인라인 모드를 활성화하면 타임리프가 자바스크립트 문법 맥락을 지능적으로 이해합니다.

 ```html
<script th:inline="javascript">
  // 자동으로 따옴표 추가 및 이스케이프 처리
  var username = [[${user.username}]];
  var age = [[${user.age}]];

  // 자바스크립트 내추럴 템플릿 기능 활성화
  var username2 = /*[[${user.username}]]*/ "test username";

  // 객체를 자동으로 JSON 포맷으로 변환
  var user = [[${user}]];
</script>
 ```

1. 텍스트 렌더링 최적화
인라인 기능을 사용하면 문자열 데이터를 다룰 때 발생할 수 있는 문법 오류를 원천 차단합니다.
  - 사용 전: ```var username = userA```(변수명이 아닌 값으로 인식되어 스크립트 오류 발생)
  - 사용 후: ```var username = "userA"```
  - 특징: 문자 타입일 경우 자동으로 쌍따옴표(")를 입혀주며, 자바스크립트 특수문자가 포함된 경우 안전하게 이스케이프 처리를 수행합니다.
 
2. 자바스크립트 내추럴 템플릿 (Natural Template)
HTML 파일을 서버를 거치지 않고 웹 브라우저에서 직접 열었을 때도 동작하도록 만드는 기능입니다. 주석 문법을 활용하여 서버 렌더링 시에는 타임리프 값이, 로컬 실행 시에는 기본값이 할당되도록 처리합니다.
  - 사용 전: ```var username2 = /*userA*/ "test username";``` (주석 그대로 출력됨)
  - 사용 후: ```var username2 = "userA";``` (서버 실행 시 주석 안의 값이 "test username"을 대체)

3. 객체의 JSON 자동 변환
서버의 자바스크립트 객체를 프론트엔드 스크립트에서 사용하고자 할 때 가장 유용한 기능입니다.
  - 사용 전: ```var user = BasicController.User(username=userA, age=10)```
    - 객체의 ```toString()``` 메서드가 호출된 결과물이 찍히므로 스크립트에서 활용이 불가능합니다.
  - 사용 후: ```var user = {"username":"userA", "age":10}```
    - 타임리프가 객체를 자동으로 JSON 구조로 직렬화하여 할당해 줍니다.

4. 자바스크립트 인라인 반복문
스크립트 영역 내에서도 타임리프의 반복문(```th:each```)을 사용할 수 있습니다. ```[# ...]``` 구문을 사용하여 자바스크립트 배열이나 리스트 데이터를 동적으로 생성할 때 유용합니다.

 ```HTML
<script th:inline="javascript">

  // 인라인 반복문을 활용한 변수 동적 생성
  [# th:each="user, stat : ${users}"]
  var user[[${stat.count}]] = [[${user}]];
  [/]

</script>
 ```

💡 추가 팁: 인라인 반복문은 자바스크립트 코드 흐름 내에서 동적으로 변수를 선언하거나 특정 로직을 여러 번 반복해서 작성해야 할 때 매우 강력한 도구가 됩니다. 다만, 스크립트 자체가 길어질 수 있으므로 가급적 필요한 데이터만 추출하여 사용하는 것이 좋습니다.


### Template

웹 애플리케이션을 개발할 때는 공통으로 사용하는 영역이 매우 많습니다. 상단 헤더, 하단 푸터, 좌측 메뉴 바 등 여러 페이지에서 중복되는 요소들을 매번 코드로 복사해서 사용한다면, 변경 사항이 생길 때마다 모든 페이지를 일일이 수정해야 하므로 관리 효율이 매우 떨어집니다. 타임리프는 이러한 문제를 방지하기 위해 템플릿 조각(Fragment)과 레이아웃 기능을 제공합니다.

👉 footer.html

반복되는 공통 영역은 별도의 파일로 분리하여 관리합니다. th:fragment 속성이 선언된 태그는 외부 파일에서 호출하여 삽입할 수 있는 '코드 조각'이 됩니다.

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<body>

<footer th:fragment="copy">
  푸터 영역입니다.
</footer>

<footer th:fragment="copyParam (param1, param2)">
  <p>파라미터 전달 구간</p>
  <p th:text="${param1}"></p>
  <p th:text="${param2}"></p>
</footer>

</body>
</html>
```

👉 fragmentMain.html

정의된 푸터 조각을 실제로 불러와서 사용하는 메인 파일입니다.

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Thymeleaf Fragment Study</title>
</head>
<body>

<h1>코드 조각 포함 방식</h1>

<h2>1. th:insert</h2>
<div th:insert="~{template/fragment/footer :: copy}"></div>

<h2>2. th:replace</h2>
<div th:replace="~{template/fragment/footer :: copy}"></div>

<h2>3. 단순 표현식 (Short syntax)</h2>
<div th:replace="template/fragment/footer :: copy"></div>

<h1>파라미터 사용 예시</h1>
<div th:replace="~{template/fragment/footer :: copyParam ('데이터1', '데이터2')}"></div>

</body>
</html>
```

- ``` template/fragment/footer :: copy ``` : ```footer.html``` 파일 내에서 ```th:fragment="copy"``` 정의된 부분을 템플릿 조각으로 가져온다는 의미입니다.
- 부분 포함 insert
   - ```th:insert``` 는 현재 태그(div)를 유지하면서 그 내부에 조각 코드를 삽입합니다.
   - 렌더링 결과: ```<div><footer> 푸터 영역입니다. </footer></div>```
- 부분 포함 replace
   - ```th:replace``` 는 현재 태그(div)를 제거하고 조각 태그로 완전히 대체합니다.
   - 렌더링 결과: ```<footer> 푸터 영역입니다. </footer>```
- 부분 포함 단순 표현식
   - 원래는 ```~{...}```를 사용하는 것이 정석이나, 조각 경로가 단순할 경우 이를 생략하고 경로만 적을 수 있습니다.
- 파라미터 사용
   - 조각 호출 시 인자를 전달하여 동적으로 렌더링할 수 있습니다. 전달된 데이터들은 조각 내부의 변수에 매핑되어 출력됩니다.


## Thymeleaf Object

### Under Spring Boot v 3.0

- 기본 제공 객체: request, response, session, servletContext, locale
- 사용법 : ```${#request}```, ```${#response}```, ```${#session}```, ```${#servletContext}```, ```${#locale}```

### Over Spring Boot v 3.0

- 기본 제공 객체 : locale
- 사용법 : ```${#locale}```
- 참고: 스프링 부트 3.0 이상부터는 보안 문제로 인해 ```locale```을 제외한 서블릿 기반 내장 객체의 직접 접근을 지원하지 않습니다. 호출 시 아래와 같은 예외가 발생합니다.
```java
Caused by: java.lang.IllegalArgumentException: The 
'request','session','servletContext' and 'response' expression utility objects 
are no longer available by default for template expressions and their use is not 
recommended...
```
- 따라서 해당 데이터가 필요한 경우에는 컨트롤러에서 직접 Model에 담아 전달해야 합니다.

### Convenience Object

- HTTP 요청 파라미터 접근 : ```${param.paramData}```
- HTTP 세션 접근 : ```${session.sessionData}``` (세션에 저장된 key 값으로 접근)
- 스프링 빈 접근: ```${@helloBean.hello('Spring!')}``` (```@```기호를 사용하여 빈 이름으로 직접 메서드 호출)

### Utility Object

타임리프는 문자, 숫자, 날짜, URI 등을 간편하게 제어할 수 있는 다양한 유틸리티 객체들을 제공합니다. 상세 내용은 공식 문서를 참조하세요.

➡ 타임리프 유틸리티 객체 https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#expression-utility-objects

➡ 타임리프 유틸리티 객체 예시 https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#appendix-b-expressionutility-objects