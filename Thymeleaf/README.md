
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
  - [Etc](#etc)
- [HTML Entity & Escape vs Unescape](#html-entity--escape-vs-unescape)
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


## pros and cons


## How can I start?


## Expression

### Simple

### Literal

### String Operations

### Math Opertaions

### Boolean Operations

### Equivalent Operations

### Condition Operations

### Etc


## HTML Entity & Escape vs Unescape

### Escape

- <를 \&lt;로 이스케이프
- \>를 \&gt;로 이스케이프
- &를 \&amp;로 이스케이프
- "를 \&quot;로 이스케이프
- '를 \&#39;로 이스케이프


## Grammer

### Annotation

### Variable

### SpringEL

### Safe Navigation Operator

### Local Variable

### Image

### Hyper Link

### Calculation

### Property

### Loof

### Switch Case

### If, Unless

### Literal, Instead of Literal

### Block

### Classappend

### Validation

### Javascript Inline

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
- 사용법 : ${#request}, ${#response}, ${#session}, ${#servletContext}, ${#locale}

### Over Spring Boot v 3.0

- 기본 제공 객체 : locale
- 사용법 : ${#locale}
- 참고: 스프링 부트 3.0 이상부터는 보안 문제로 인해 locale을 제외한 서블릿 기반 내장 객체의 직접 접근을 지원하지 않습니다. 호출 시 아래와 같은 예외가 발생합니다.
```java
Caused by: java.lang.IllegalArgumentException: The 
'request','session','servletContext' and 'response' expression utility objects 
are no longer available by default for template expressions and their use is not 
recommended...
```
- 따라서 해당 데이터가 필요한 경우에는 컨트롤러에서 직접 Model에 담아 전달해야 합니다.

### Convenience Object

- HTTP 요청 파라미터 접근 : ${param.paramData}
- HTTP 세션 접근 : ${session.sessionData} (세션에 저장된 key 값으로 접근)
- 스프링 빈 접근: ${@helloBean.hello('Spring!')} (@ 기호를 사용하여 빈 이름으로 직접 메서드 호출)

### Utility Object

타임리프는 문자, 숫자, 날짜, URI 등을 간편하게 제어할 수 있는 다양한 유틸리티 객체들을 제공합니다. 상세 내용은 공식 문서를 참조하세요.

➡ 타임리프 유틸리티 객체 https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#expression-utility-objects

➡ 타임리프 유틸리티 객체 예시 https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#appendix-b-expressionutility-objects