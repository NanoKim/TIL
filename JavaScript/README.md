# 목차

- [개요](#개요)
- [데이터 입출력](#데이터-입출력)
  - [데이터를 출력하는 구문](#데이터를-출력하는-구문)
  - [데이터를 입력받는 구문](#데이터를-입력받는-구문)
- [요소 접근하기](#요소-접근하기)
  - [아이디를 이용해서 요소 가져오기](#아이디를-이용해서-요소-가져오기)
  - [태그명을 이용해서 요소 가져오기](#태그명을-이용해서-요소-가져오기)
  - [name 속성값을 이용해서 요소 가져오기](#name-속성값을-이용해서-요소-가져오기)
  - [클래스를 이용해서 요소 가져오기](#클래스를-이용해서-요소-가져오기)
  - [선택자를 활용해서 자유롭게 요소 가져오기](#선택자를-활용해서-자유롭게-요소-가져오기)
- [변수와 자료형](#변수와-자료형)
- [문자열과 숫자](#문자열과-숫자)
  - [문자열 관련 기본 메소드](#문자열-관련-기본-메소드)
  - [문자열 관련 html 메소드](#문자열-관련-html-메소드)
  - [숫자(수학) 관련 메소드](#숫자수학-관련-메소드)
  - [문자들과 숫자간의 산술연산 / 형변환](#문자들과-숫자간의-산술연산--형변환)
- [배열](#배열)
- [함수](#함수)
- [객체](#객체)
  - [객체 선언 및 사용](#객체-선언-및-사용)
  - [생성자 함수](#생성자-함수)
  - [Date 내장 객체](#date-내장-객체)
- [window용 객체](#window용-객체)
  - [BOM(Browser Object Model)](#bombrowser-object-model)
  - [DOM(Document Object Model)](#domdocument-object-model)
  - [노드(요소) 생성과 관련된 메소드](#노드요소-생성과-관련된-메소드)
- [이벤트](#이벤트)
  - [현재 이벤트가 발생한 요소객체에 접근하는 방법](#현재-이벤트가-발생한-요소객체에-접근하는-방법)
  - [태그가 기본적으로 지니는 이벤트 제거](#태그가-기본적으로-지니는-이벤트-제거)
- [정규표현식](#정규표현식)

# 개요

웹은 크게 3요소
- html : 웹 문서의 큰 틀
- CSS : 스타일(색상, 디자인, 간격, 배치 등)
- javascript : 웹 문서에서 이벤트가 발생했을 때 실행해야 되는 동작들 처리

**자바스크립트 개요**

스크립트 언어란?

프로그램의 동작을 사용자의 요구에 맞게 수행되도록 해주는 용도 → 매우 빠르게 배우고, 짧은 소스코드로 상호작용 되도록 고안

**자바스크립트**

웹 브라우저에서 많이 사용되는 "인터프리터 방식"의 스크립트 언어
\* 인터프리터 방식
- 코드를 한 줄씩 읽어가며 바로 실행하는 방식
- 실시간으로 텍스트 분석해서 실행
- 코드에 문법 오류가 있으면 실행 시점에서 알림

**장단점**

\* 장점
- 컴파일 과정 없이 인터프리터로 코드를 한 줄씩 읽어가며 바로 실행되기에 수행속도 빠르고, 코드 작성이 간단 (단순한 구조, 원칙)

\* 단점
- 웹에 특화된 기술 → 내부에서 제공하는 기능이 제한적
- html 소스코드에서 같이 작성하면 외부에 공개 → 보안의 취약점 발생

**자바스크립트 사용법**

inline(인라인) : 태그 내에 간단하게 소스코드를 작성해서 실행되게 하는 방법
```html
<button onclick="window.alert('알람창 출력 버튼 클릭')">알람창 출력</button>
<button onclick="console.log('콘솔 출력 버튼 클릭')">콘솔 출력</button>
```

internal(내부) : html문서 내에 소스코드를 작성해서 실행되게 하는 방법
```html
<button id="btn">알람창 출력</button>
<button onclick="btnClick()">콘솔 출력</button>

<script>
  var btn = document.getElementById("btn");

  // 익명함수
  btn.onclick = function(){ 
      window.alert('버튼 클릭');
  }
          
  // 이름있는 함수 정의해보기
  function btnClick(){
      console.log('콘솔 버튼 클릭');
  }
</script>
```

external(외부) : 별도의 .js 파일로 소스코드를 작성해서 실행되게 하는 방법

# 데이터 입출력

\* window
- 자바스크립트 내장 객체로 브라우저 창이 열릴때 마다 하나씩 만들어지는 객체
- 브라우저 창 안에 존재하는 모든 요소들의 최상위 객체(생략가능)

\* document
- 웹 문서마다 하나씩 만들어지는 객체 (html 문서에 대한 정보들을 지님)

위 두 객체들은 별도로 객체를 생성하지 않아도 자동으로 만들어짐

## 데이터를 출력하는 구문
1) [window.]alert("알람창에 출력할 문구");
2) [window.]console.log("콘솔창에 출력할 문구");
3) document.write("화면상에 출력할 문구");
4) 선택한 요소.innerHTML | innerText = "요소에 출력할 문구";

## 데이터를 입력받는 구문
1) 변수 = [window.]confirm("질문내용");
  - confirm 호출 시 "질문내용"과 확인|취소 버튼이 존재하는 알람창 발생
  - 확인버튼 클릭시 true, 취소버튼 클릭시 false 반환
2) 변수 = [window.]prompt("질문내용");
  - prompt 호출 시 "질문내용"과 입력할 수 있는 "텍스트 상자"와 "확인/취소" 버튼이 보여지는 알람창 발생
  - 확인 버튼 클릭시 텍스트 상자에 입력되어 있는 값이 문자열로 반환 (숫자가 있어도 문자열로 넘어옴)
  - 취소 버튼 클릭시 (글자 입력을 했어도 취소를 누르면 무조건) null 반환
3) 변수 = 선택한요소.속성(id, className, innerHTML, innerText, ...);
4) 변수 = 선택한 input 요소.value;

# 요소 접근하기

## 아이디를 이용해서 요소 가져오기
```html
<h3>1) 아이디를 이용해서 요소 가져오기</h3>
<div id="area1" class="area"></div>
<button onclick="accessId();">아이디로 접근</button>

<script>
    function accessId(){
        var area1 = document.getElementById("area1");

        area1.innerHTML += "아이디로 접근 성공 <br>";

        area1.style.backgroundColor = "pink";
        area1.style.color = "red";
        area1.style.width = "200px";
        area1.style.height = "200px";
    }
</script>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/b52c79a2-89cf-4203-bc8b-960f6c5a44ee)

## 태그명을 이용해서 요소 가져오기
```html
<ul>
    <li>목록1</li>
    <li>목록2</li>
    <li>목록3</li>
    <li>목록4</li>
    <li>목록5</li>
</ul>

<button onclick="accessTagName();">태그명으로 접근</button>

<script>
    function accessTagName(){
        // 단, 해당 HTML 문서의 모든 해당 태그들이 다 선택
        // 선택된 요소객체들이 배열에 담겨서 반환
        var list = document.getElementsByTagName("li"); // [li요소객체, li요소객체, ...]

        console.log(list);
        console.log("배열의 크기(선택된 li 요소 개수) : " + list.length);

        console.log(list[0]);

        list[0].innerHTML = "안녕하세요";

        var blueColor = 50;
        for(var i = 0; i < list.length; i++){
            list[i].innerHTML = "안녕하세요";
            // list[i].style.backgroundColor = "yellow";
            list[i].style.backgroundColor = "rgb(130, 220," + blueColor + ")";
            blueColor += 50;
        }
    }
</script>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/c5749929-5551-4539-8788-b2ef87d7acfd) ![image](https://github.com/NanoKim/TIL/assets/151509995/9db41345-158d-4a58-857e-ae1b5c526bd6)

## name 속성값을 이용해서 요소 가져오기
```html
<form action="#">
    <fieldset>
        <legend>취미</legend>

        <input type="checkbox" name="hobby" value="game" id="game">
        <label for="game">게임</label>

        <input type="checkbox" name="hobby" value="movie" id="movie">
        <label for="movie">영화감상</label>

        <input type="checkbox" name="hobby" value="reading" id="reading">
        <label for="reading">독서</label>

        <input type="checkbox" name="hobby" value="sports" id="sports">
        <label for="sports">운동</label>
    </fieldset>
</form>

<br>
<div class="area" id="area3"></div>
<button onclick="accessName();">name으로 접근</button>

<script>
    function accessName(){
        // 선택된 요소들이 배열에 담겨 반환

        var hobby = document.getElementsByName("hobby"); // [input요소 객체, input요소 객체, ...]

        for(var i = 0; i < hobby.length; i++){
            if(hobby[i].checked){
                area3.innerHTML += hobby[i].value + "<br>";
                // 이렇게 area3 이라고 해도 ok
            }
        }
    }
</script>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/87af325e-04ca-4159-a27f-83ed7ff53ac2)

## 클래스를 이용해서 요소 가져오기
```html
<div class="test"></div>
<p class="test"></p>
<ul class="test">
    <li></li>
    <li></li>
</ul>
<pre class="test test1"></pre>

<button onclick="accessClass();">클래스로 접근</button>

<script>
    function accessClass(){
        // 선택된 요소들이 배열에 담겨 반환
        var arr = document.getElementsByClassName("test");
    }
</script>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/32002ca6-7214-4781-a88b-3fd3c9b8c811)

## 선택자를 활용해서 자유롭게 요소 가져오기
```html
<div id="test1">테스트입니다.</div>
<div class="test">
    <h2>ㅎㅇ</h2>
    <h2>ㅂㅇ</h2>
</div>
<span>ㅋㅋㅋ</span>
<h2>ㅃㅃ</h2>

<br>

<button onclick="accessSelector();">클릭</button>

<script>
    function accessSelector(){
        // document.querySelector("선택자") → 선택된 요소객체 하나만 반환
        // document.querySelectorAll("선택자") → 선택된 요소객체들을 배열에 담아 반환

        var divEl = document.querySelector("#test1"); // div 요소 객체
        var h2El = document.querySelectorAll(".test>h2"); // [h2요소객체, h2요소객체]
        var spanEl = document.querySelector(".test+span"); // span 요소 객체

        for(var i = 0; i < h2El.length; i++){
            console.log(h2El[i].innerHTML);
        }
    }
</script>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/119eeea9-f036-4a6a-afa0-1a79ee25a0e9)

# 변수와 자료형

**var, let, const의 차이점**
- var : 중복선언 및 재할당 가능
- let : 중복선언 불가능 및 재할당 가능
- const : 중복선언 및 재할당 불가능

**변수 선언 위치에 따른 전역변수 / 지역변수**
```html
<script>
    var declareVar = "var로 전역변수";
    let declareLet = "lef로 전역변수";
    const declareConst = "const로 전역변수";

    declareNone = "그냥 전역변수"; // 이렇게도 되긴 하지만 사용은 잘 하지 않는다

    // 윈도우가 onload 되었을 때
    // window.onload = function(){이 문서가 로딩된 직후에 실행시킬 코드};
    window.onload = function(){
        console.log("문서 로딩 완료");

        // 전역변수와 동일한 이름으로 지역변수 선언
        var declareVar = "var로 지역변수";
        let declareLet = "lef로 지역변수";
        const declareConst = "const로 지역변수";

        console.log(declareVar);
        console.log(declareLet);
        console.log(declareConst);
        console.log(declareNone);
        // 기본적으로 지역변수명이랑 전역변수명이 중복될 경우 → 지역변수를 우선시

        //==============================================================

        // 이 때 무조건 전역변수에 접근하고자 한다면? window. 또는 this. 으로 접근
        console.log(window.declareVar);
        console.log(this.declareVar);

        // let, const 는 불가능
        console.log(window.declareLet); // undefined
        console.log(this.declareConst); // undefined

        //==============================================================

        declareNone1 = "얘는 뭘까";
        console.log(declareNone1);          // 얘는 뭘까 출력
        console.log(window.declareNone1);   // 얘는 뭘까 출력
        console.log(this.declareNone1);     // 얘는 뭘까 출력

        // 앞에 전역변수 declareNone1 이 없으니 window 와 this 는 undefined 가 떠야하나,
        // → 특정 함수 내에 var let const 를 사용않고 선언된 변수는 전역변수
        test();
    }

    function test(){
        console.log(declareNone1);
        // declareNone1 은 위의 함수 내에서 사용된 지역변수였으나,
        // var let const 를 사용않고 선언됐기에 전역변수로 잡혀 undefined가 아닌 얘는 뭘까 출력
    }
</script>
```

**자료형**

변수 선언시 자료형을 별도로 지정하지 않음 (자료형의 개념이 없는 건 아님) → 변수에 대입되는 값(리터럴)에 따라 자료형이 결정
- string(문자열)
- number(숫자)
- boolean(논리값)
- object(객체)
- function(함수)
- undefined(초기화가 되지 않은 변수)

# 문자열과 숫자

## 문자열 관련 기본 메소드

|메소드|기능|
|---|---|
|str.toUpperCase()|대문자로 변환|
|str.toLowerCase()|소문자로 변환|
|str.length|문자열의 길이|
|str.charAt(index)|index 문자 추출|
|str.indexOf("c")|앞에서부터 첫 c의 위치 (없을 시 -1)|
|str.lastIndexOf("c"|뒤에서부터 첫 c의 위치 (없을 시 -1)|
|str.substring(시작인덱스[, 끝인덱스])|문자열 추출|
|str.split("구분자")|구분자 기준 문자열 나눠 배열 반환|

## 문자열 관련 html 메소드

|메소드|기능|
|---|---|
|str.bold()|문자열 굵게|
|str.italics()|문자열 눕히기|
|str.small()|문자열 작게|
|str.big()|문자열 크게|
|str.sup()|윗첨자|
|str.sub()|아랫첨자|
|str.link("link")|문자열 link 연결|

## 숫자(수학) 관련 메소드

|메소드|기능|
|---|---|
|Math.abs(num)|절대값|
|Math.random()|랜덤값|
|Math.round(num)|반올림|
|Math.floor(num)|버림|
|Math.ceil(num)|올림|

## 문자들과 숫자간의 산술연산 / 형변환

```html
const test1 = 7 + 7;            // 14
const test2 = 7 + "7";          // "77"
const test3 = "7" + 7;          // "77"
const test4 = "7" + 7 + 7;      // "77" + 7 = "777"
const test5 = "7" + (7 + 7);    // "7" + 14 = "714"
```

js 에서는 + 연산자 외의 산술연산 가능
- 문자열이 자동형변환(문자열 > 숫자형) 돼서 숫자로 산술연산 가능
- 단, 문자열에는 숫자만 존재

```html
const test6 = "7" - 7;          // 7 - 7 = 0
const test7 = "7" * 7;          // 7 * 7 = 49
const test8 = "7" / 7;          // 7 / 7 = 1

const area4 = document.querySelector("#area4");
area4.innerHTML = "test6 : " + test6 + "<br>";
area4.innerHTML += "test7 : " + test7 + "<br>";
area4.innerHTML += "test8 : " + test8 + "<br>" + "<br>";
```

덧셈연산을 할 때는 자동 형변환이 되지 않아 연이어서 한 문자열

**강제형변환 (문자열 > 숫자형)**
1) Number(문자열)
2) parseInt(문자열)   → 문자열 정수일 때 주로 사용
3) parseFloat(문자열) → 문자열 실수일 때 주로 사용

```html
// 2, "3" 덧셈연산
const test9 = 2 + "3";                       // 23
const test10 = 2 + Number("3");              // 5
const test11 = 2 + parseInt("3");            // 5
const test12 = 2 + parseFloat("3");          // 5

// 2, "1.234" 덧셈연산
const test13 = 2 + "1.234"                   // "21.234"
const test14 = 2 + Number("1.234");          // 2 + 1.234 = 3.234
const test15 = 2 + parseInt("1.234");        // 2 + 1 = 3
const test16 = 2 + parseFloat("1.234");      // 2 + 1.234 = 3.234
```

# 배열

변수 선언시 별도의 자료형 지정이 없기에 어떤 자료형의 값들이든 다 하나의 배열 공간에 담을 수 있고, 크기의 제약도 없다. (자바에서의 Collection 과 유사)

```html
<script>
    function arrayTest1(){
        const arr = ["문동은", '서울', 20, true, [1,2,3]]; // 배열객체 (type == object)

        console.log(arr);
        console.log(arr[2]);
        console.log(arr[4]);
        console.log(arr[4][2]);

        const area1 = document.getElementById("area1");

        // 일반 for문
        for(let i = 0; i < arr.length; i++){
            area1.innerHTML += arr[i] + "<br>";
        }

        // for in문(향상된 for문)
        for(변수 in 순차적으로 접근할 배열){}

        for(let v in arr){
            area1.innerHTML += arr[v] + "<br>";
        }
    }
</script>
```

**배열의 선언**

```html
<script>
    function arrayTest2(){
        // 배열 선언
        const arr1 = new Array();   // 빈 배열 []
        const arr2 = new Array(3);  // 크기가 3인 빈 배열 [empty × 3]
        const arr3 = [];            // 빈 배열 []

        // 배열에 값 대입
        arr1[0] = "바나나";
        arr1[1] = "사과";
        arr1[9] = "키위";            // 크기가 10빈 배열 ['바나나', '사과', empty × 7, '키위']

        arr2[0] = "자동차";
        arr2[1] = "기차";
        arr2[2] = "오토바이";
        arr2[6] = "제트기";          // ['자동차', '기차', '오토바이', empty × 3, '제트기']    

        // 배열 선언과 동시에 초기화
        const arr4 = new Array("문동은", "이사라", "박연진");
        const arr5 = ["java", "oracle", "front"];
    }
</script>
```

**배열 관련 메소드**

|메소드|기능|
|---|---|
|indexOf(찾고자하는요소)|배열에서 해당 요소가 위치해있는 인덱스 반환|
|배열.concat(배열, 배열, ...)|배열에 여러개의 배열을 결합|
|배열.reverse()|배열에 담긴 값들을 역순으로|
|배열.sort()|배열안에 담긴 값들을 오름차순 정렬|
|배열.push(추가할요소)|배열의 맨 뒤에 요소 추가시키고 배열의 크기 반환|
|배열.pop()|배열의 맨 뒤 요소 제거시키고 제거된 요소 반환|
|배열.unshift(추가할요소)|배열의 맨 앞에 요소 추가시키고 배열의 크기 반환|
|배열.shift()|배열의 맨 앞 요소 제거시키고 제거된 요소 반환|
|배열.slice(시작인덱스, 끝인덱스)|배열로부터 시작인덱스~끝인덱스 까지 추출 메소드|
|배열.splice(시작인덱스, 제거개수[, 추가할값])|배열의 요소 추출해서 제거 및 추가|
|배열.toString() / 배열.join([구분자])|배열의 각 인덱스에 담긴 값들을 하나의 "문자열"로 합쳐서 반환|

# 함수

**선언적 함수**

```html
function 함수명([매개변수, 매개변수, ...]){
    함수 호출 시 실행할 소스코드;

    [return 결과값;]
}
```

**익명 함수**

특정 변수나 속성에 대입되는 함수 제시 시 주로 사용 (이벤트 핸들러 작성 시 주로 사용)

```html
변수|속성 = function([매개변수, 매개변수, ...]){
    함수 호출 시 실행할 소스코드;

    [return 결과값;]
}
```

**매개변수 관련 arguments 배열**

함수 호출 시 전달되는 값은 내부적으로 arguments 배열에 담김 <br>
\* arguments : 모든 함수마다 내부적으로 하나씩 존재하는 배열 객체

```html
<button onclick="test3(11,12,1,5,7);">실행확인</button>

<script>
  function test3(){
    console.log(arguments[0]);
  }
</script>
```

**매개변수에 this 관련 전달하기**

this : 현재 (이벤트가 일어나는) 요소 객체

**함수의 리턴**

\* 일반적인 값 리턴

```html
<button onclick="test6();">실행확인</button>

<script>
    function ran(){
        const random = parseInt(Math.random()*100 + 1);
        return random;
    }

    function test6(){
        const area5 = document.querySelector("#area5");
        area5.innerHTML += "랜덤값 : " + ran() + "<br>";
    }
</script>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/80bf8014-ed32-4325-a0d3-5b0949dc096a)

\* 익명함수를 리턴

```html
이름 : <input type="text" id="userName">
<button onclick="test7()();">실행확인</button> <!-- 이렇게 괄호 추가해야 실행 가능 -->

<script>
    function test7(){
        let inputEl = document.getElementById("userName");
        return function(){
            alert(inputEl.value);
        }
    }
</script>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/c974ad07-1257-4a04-98e9-4227f62b55c1)

# 객체

## 객체 선언 및 사용

객체는 중괄호{}를 사용해서 생성하는 게 원칙, 중괄호안에 해당 객체에서 필요한 속성(property)들을 정의 <br>
속성값으로는 모든 자료형의 값을 담을 수 있다는 것이 객체를 쓰는 가장 큰 이유

속성명 : 속성값의 형태로 정의(키:벨류)

```html
변수 = {
    속성명 : 속성값,
    속성명 : 속성값,
    속성명 : 속성값,
    ...
}
```
\* 속성명에 공백이나 특문이 포함될 경우 속성명을 "" 로

순서가 중요하다면? 배열 []
순서가 필요없다면? 객체 {}

**객체의 속성에 접근하는 방법**

방법1. <b>대괄호를 이용하는 방법 : 객체명["속성명"]</b> <br>
방법2. .을 이용하는 방법 : 객체명.속성명 <br>

**객체에서의 반복문**
객체가 가지고 있는 모든 속성들에 순차적으로 접근하고자 한다면 반복문 제시 가능 <br>
단, 단순한 for loop 문 으로는 불가능 / for in 문 으로 가능 <br>
- in 뒤에 객체 제시할 경우 : 반복문 돌 때 마다 해당 객체의 속성명(key)이 담김
- in 뒤에 배열 제시할 경우 : 반복문 돌 때 마다 해당 배열의 인덱스가 담김

**in과 with 키워드**

in : 객체 내에 해당 속성이 있는지 확인해주는 키워드 (존재하면 true, 아니면 false 반환) <br>
with : 객체의 속성 접근 시 객체명 제시하는 걸 생략할 수 있도록 함(코드를 줄여주는 메소드)

**객체의 속성 추가 및 제거**

객체의 속성 추가
```html
<script>
  const student = {};

  student.name = "나노킴";
  student.hobby = ["게임","개발"];
  student.dream = "바둑왕";
  student.age = 20;
</script>
```

객체의 속성 제거
```html
delete(student.hobby);
```

## 생성자 함수

new 키워드를 통해 객체를 생성할 수 있는 함수를 의미 (함수명 제시 시, 첫글자 대문자)

```html
<script>
    function test(){
        const student0 = new Student("피카츄", 100, 70, 60, 80, 90);
        const student1 = new Student("라이츄", 90, 60, 100, 70, 90);
        const student2 = new Student("파이리", 80, 90, 50, 80, 80);
    
        const students = [student0, student1, student2];
    
        for(let v in students){
            document.getElementById("area2").innerHTML += "이름 : " + students[v].name
                                                       + ", 총점 : " + students[v].getSum()
                                                       + ", 평균 : " + students[v].getAvg() + "<br>";
        }
    }
    
    function Student(name, java, oracle, html, css, javascript){
        this.name = name; // {name:"피카츄"}
        this.java = java; // {name:"피카츄",java:100}
        this.oracle = oracle;
        this.html = html;
        this.css = css;
        this.javascript = javascript;
    
        this.getSum = function(){
            return this.java + this.oracle + this.html + this.css + this.javascript;
        };
    
        this.getAvg = function(){
            return this.getSum() / 5;
        };
    }
</script>
```

## Date 내장 객체
|객체|기능|
|---|---|
|new Date()|요일 월 일 년도 시:분:초 GMT+0900(한국 표준시)|
|new Date(년도,월,일)|요일 월 일 년도 시:분:초 GMT+0900(한국 표준시)|
|new Date(년도,월,일,시,분,초)|요일 월 일 년도 시:분:초 GMT+0900(한국표준시)|
|new Date().getFullYear()|년도|
|new Date().getMonth()|월|
|new Date().getDate()|일|
|new Date().getDay()|1~7(몇번째 요일인지) \*월요일(1), 화요일(2)|
|new Date().getHours()|시|
|new Date().getMinutes()|분|
|new Date().getSeconds()|초|

**d-day 구하기**
```html
<script>
  // 오늘날짜
  const today = new Date();

  // 특정날짜
  const end = new Date(2024, 5-1, 2);

  const dDay = (end - now) / (24*60*60*1000);
</script>
```

1s == 1000ms <br>
1m = 60s == 60*1000ms <br>
1h = 60m = 60*60s = 60*60*1000ms <br>
1d = 24h = 24*60m = 24*60*60s = 24*60*60*1000ms

# window용 객체

window 객체는 자바스크립트의 최상위 객체이며 크게 BOM, DOM 으로 나뉨
- BOM(Browser Object Model) : location 객체 (주소창 관련), screen 객체 (창 관련), navigator 객체 (브라우저 관련), ...
- DOM(Document Object Model) : document 객체

[window.]open(["url", "창이름", "창의특성"])
- window.open() : 새 창 열기
- url : 새 창에서 열고자 하는 url 주소
- 창이름 : 이미 같은 이름의 창이 열려있을 경우 해당 창 새로고침

|창의특성|기능|
|---|---|
|width=500|창의 너비 500px|
|height=500|창의 높이 500px|
|resizable=yes\|no|창크기 조절 가능 여부|
|location=yes\|no|주소창|
|scrollbars=yes\|no|스크롤바|
|toolbar=yes\|no|도구모음|
|menubar=yes\|no|메뉴바|
|status=yes\|no|상태표시줄|

**window 객체의 timer 관련 메소드**

window.setTimeOut(함수, 일정시간ms단위) : 제시한 일정 시간 후 해당 함수 "단 한번만 실행"

```html
<script>
    function test2(){
        const myWindow = window.open(); // 창이 열리면서 새로운 윈도우 객체가 생김 (윈도우 객체는 창마다 하나 존재)

        myWindow.alert("3초 후에 이 페이지 닫힘"); // 확인 누르는 순간 다음 코드로
        
        setTimeout(function(){
            myWindow.close();
        }, 3000);
        // setTimeout : 내가 
    }
</script>
```

window.setInterval(함수, 일정시간ms단위) : 내가 제시한 일정 시간마다 해당 함수 "매번 실행"

```html
<script>
    function test3(){
        const area1 = document.getElementById("area1");
        let count = 1;
        setInterval(function(){
            const now = new Date();

            let hour = now.getHours();
            let min = now.getMinutes();
            let sec = now.getSeconds();

            if(hour < 10){
                hour = "0" + hour;
            }
            if(min < 10){
                min = "0" + min;
            }
            if(sec < 10){
                sec = "0" + sec;
            }

            area1.innerHTML = hour + " : " + min + " : " + sec;
        }, 1000);
    }
</script>
```

## BOM(Browser Object Model)

location 객체 : 브라우저 주소창과 관련된 객체
- assign : document 부터 새로 만들어주기에 안정적이지만, 조금 느리다
- replace : 뒤로가기 불가능

```html
<button onclick="location.href='http://www.naver.com'";>네이버로 이동</button>
<button onclick="location.assign('http://www.google.com');">구글로 이동</button> 
<button onclick="location.replace('http://www.google.com');">구글로 이동</button>

<button onclick="location.href=location.href">새로고침</button> <!-- 새로고침 되긴 하나, 위로 감 -->
<button onclick="location.reload();">새로고침</button> <!-- 새로고침 되며, 현위치 유지 -->
```

기타 BOM 객체
- screen
- navigator
- history : 이전 페이지에 대한 기록이 length에 누적

## DOM(Document Object Model)

HTML에 있는 각각의 요소들을 노드(Node)라고 함 <br>
\> 요소노드(Element Node) : 태그들이 이에 해당 <br>
\> 텍스트노드(Text Node) : 태그 사이에 있는 텍스트들이 이에 해당

텍스트노드가 존재하는 요소 (시작태그와 종료태그가 한 쌍) : div, h1, li, p, a, ... <br>
텍스트노드가 존재하지 않는 요소 (시작태그로만 이루어짐) : input, hr, br, img, ...

\* <b>Document : DOM 은 가장 최상위에 위치, 모든 태그의 조상격</b>
        - html 태그
            - head 태그
                - title 태그
            - body 태그
                - div 태그
                - input 태그
                - ul 태그
                    - li 태그 등등

## 노드(요소) 생성과 관련된 메소드

- 텍스트 노드가 존재하는 노드 생성 (시작태그 + 종료태그)

```html
<script>
    function test(){
        // 동적으로 document 에서 제공하는 메소드를 통해 "요소객체" 만드는 방법

        // 1) ElementNode 객체 생성 : document.createElement("태그");
        let elementNode = document.createElement("h3"); // <h3></h3>

        // 2) TextNode 객체 생성 : document.createTextNode("문구");
        let textNode = document.createTextNode("ㅎㅇ");

        // 3) 2개의 노드 결합(요소노드의 하위로 텍스트노드 추가)
        elementNode.appendChild(textNode); // <h3>ㅎㅇ</h3>

        // 2-4) div 요소노드의 하위로 elementNod 추가
        document.querySelector("#area2").appendChild(elementNode);
    }
</script>
```

- 텍스트 노드가 존재하지 않는 노드 생성 (시작태그만 존재)

```html
<script>
    function test(){
        // 1) img 요소노드 생성
        let img = document.createElement("img");

        // 2) 속성추가
        img.src = "https://kh-academy.co.kr/resources/images/main/logo.svg";
        img.width = "100";
        img.height = "30";

        // 3) 자식으로 결합
        document.getElementById("area3").appendChild(img);
    }
</script>
```

- 노드(요소) 삭제와 관련된 메소드

지우고자하는 요소객체.remove();
```html
<script>
    function test6(){
        document.getElementById("area3").firstChild.remove(); // 마지막이 아닌 첫번째부터 삭제
    }
</script>
```

# 이벤트

**이벤트 모델 종류**
- 고전 이벤트 모델(기본 이벤트 모델)
  - 특정 요소 객체의 이벤트 속성에 접근 후, 이벤트핸들러를 연결
  - 이벤트 제거도 가능
- 인라인 이벤트 모델
  - 요소 내부에 직접적으로 이벤트 속성 제시해서 실행할 내용을 정의하는 방식
  - 주로 script 태그 내에 정의돼있는 함수 호출하는 방식을 선호
- 표준 이벤트 모델 (addEventListener)
  - w3c에서 공식적으로 지정한 이벤트 모델 (IE는 9버전부터 지원)
  - 이벤트를 걸고자 하는 요소 객체.addEventListener("이벤트명",이벤트 핸들러);

```html
<script>
    const btn3 = document.getElementById("btn3");

    btn3.addEventListener("click", function(){
        alert("표준이벤트 모델 테스트");
    });

    btn3.addEventListener("mouseenter", function(){
        btn3.style.backgroundColor = "red";
    });

    btn3.addEventListener("mouseout", function(){
        btn3.style.backgroundColor = "yellow";
    });
</script>
```

## 현재 이벤트가 발생한 요소객체에 접근하는 방법

자바스크립트 내부적으로 이벤트를 발생시키면 이벤트에 대한 정보가 담긴 요소객체 매개변수를 1개 받는다

```html
<button id="btn4">고전이벤트방식</button>
<button id="btn5">표준이벤트방식</button>
<button onclick="test2();">인라인이벤트방식</button>
<button onclick="test3(this);">인라인이벤트방식2</button>

<script>
    // 고전이벤트 방식
    document.getElementById("btn4").onclick = function(e){
       // 현재 이벤트가 발생한 요소객체에 접근하고자 한다면 e.target 속성 사용
       console.log(e.target); 
       console.log(window.event.target);
       console.log(this); // this = 지금 이벤트가 발생한 것을 의미

       e.target.innerHTML = "버튼클릭됨";
       window.event.target.style.backgroundColor = "red";
       this.style.color = "white";
    };

    // 표준이벤트 방식
    document.getElementById("btn5").addEventListener("click",function(e){
        console.log(e.target);
        console.log(window.event.target);
        console.log(this);
    });

    // 인라인이벤트 방식
    function test2(e){ // test2() 는 이벤트핸들러가 아닌 단순 함수이기에 event 정보가 담긴 매개변수를 넘겨받은 적이 없음
        console.log(window.event.target);
        console.log(this); // 인라인이벤트 방식에서는 this를 쓸 경우 event 가 아닌 window 객체를 가리킴
        window.event.target.innerHTML = "버튼변경";
    }

    // 인라인이벤트 방식2
    function test3(el){
        el.style.backgroundColor = "red";
    }
</script>
```

## 태그가 기본적으로 지니는 이벤트 제거

기본적으로 이벤트를 가지고 있는 요소 <br>
- a 태그 : 클릭시 href 에 제시되어 있는 url로 요청하는 기본이벤트 보유
- form 내의 submit 버튼 : 클릭시 사용자가 입력한 값들을 action에 제시된 url로 제출하면서 요청하는 기본이벤트 보유


태그내에 기본적으로 설정된 이벤트가 실행 안 되게끔 막고 싶다면 <br>
→ 이벤트 핸들러의 return 값을 false로 하면 기본이벤트 미 실행

```html
<a href="http://www.naver.com" onclick="alert('ㅋㅋㅋ'); return false">네이버로 이동</a>
```

# 정규표현식

정규표현식 (REGEX / REGEXP : Regular Expression)
- 특정 패턴을 가진 문자열을 찾거나 찾아서 변경(치환)할 때 사용하는 언어
- 정규표현식을 이용하면 문자열에 대한 특정 패턴 조건 검사시 복잡한 조건을 제시할 필요없이 간단하게 처리 가능

**정규표현식 객체 생성**
```html
const regExp = new RegExp("script"); // 방법1. script 패턴을 가진 정규표현식 객체
const regExp2 = /script/;            // 방법2
```

**정규표현식과 관련된 메소드**

* RegExp 객체에서 제공하는 메소드 (정규식.xxx(문자열))
- 정규식.test(문자열) : 문자열에서 정규식값과 일치하는 값이 있으면 true, 없으면 false 반환
- 정규식.exec(문자열) : 문자열에서 정규식값과 일치하는 값이 있으면 처음매칭된 문자열, 없으면 null 반환

* string 객체에서 제공하는 메소드 (문자열.xxx(정규식))
- 문자열.match(정규식) : 문자열에서 정규식과 일치하는 값 찾아서 반환
- 문자열.search(정규식) : 문자열에서 정규식값과 일치하는 값의 시작인덱스 값 반환, 없으면 01 반환
- 문자열.replace(정규식, 바꿀값) : 문자열에서 정규식값과 일치하는 첫번째부분을 바꿀값으로 변경해서 반환
- 문자열.split(정규식) : 정규식에 지정된 값을 구분자로 나눠진 값들이 담겨있는 배열 반환

**메타문자**

메타문자를 이용해서 정규식으로 검색조건으로 삼을 "특정패턴"을 제시가능 <br>
문자열이 해당 정규식으로 제시한 특정 패턴에 만족하는지 test()을 통해 검사하거나 replace() 이용해서 치환 가능

|메타문자|기능|
|---|---|
|^|시작을 의미|
|[]|[] 내에 여러 문자들을 목록처럼 나열 가능|
|[a-z]|영소문자|
|[A-Z]|영대문자|
|[ㄱ-ㅎ]|한글자음|
|[ㅏ-ㅣ]|한글모음|
|[가-힣]|한글결합|
|$|끝을 의미|
|.|줄바꿈 개행문자를 제외한 모든 문자 한 글자|
|+|한글자 이상(0글자 불가)|
|.+|개행문자 제외한 어떤 문자든 한글자 이상|

**플래그 문자**
- i : 대소문자 가리지 않고 비교를 수행
- g : 전역으로 비교를 수행
- m : 여러줄 비교를 수행
