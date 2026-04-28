# 목차

- [기본 선택자](#기본-선택자)
- [기타 선택자](#기타-선택자)
    - [속성 선택자](#속성-선택자)
    - [자손 선택자 & 후손 선택자](#자손-선택자--후손-선택자)
    - [동위 선택자](#동위-선택자)
    - [반응 선택자](#반응-선택자)
    - [상태 선택자](#상태-선택자)
- [선택자 우선순위](#선택자-우선순위)
- [글꼴 관련 스타일](#글꼴-관련-스타일)
- [텍스트 관련 스타일](#텍스트-관련-스타일)
- [목록 관련 스타일](#목록-관련-스타일)
- [영역 관련 스타일](#영역-관련-스타일)
- [테두리 관련 스타일](#테두리-관련-스타일)
- [배경 관련 스타일](#배경-관련-스타일)
- [레이아웃 관련 스타일](#레이아웃-관련-스타일)
- [배치 관련 스타일](#배치-관련-스타일)

# 기본 선택자

**CSS 영역** : 스타일을 기술할 수 있는 영역
- 내부 스타일 방식 : 스타일 정보들을 <style> 태그 내에 기입하는 방식
- 인라인 스타일 방식 : 요소 내에 style 속성을 이용해 직접 기입하는 방식
- 외부 스타일 방식 : 스타일 정보를 기술하는 .css 외부문서를 만들고, link 태그로 연결하는 방식

**선택자**

특정 HTML 요소를 선택하고자 할 때 사용하는 기능

→ 해당 요소를 선택해 원하는 "스타일"과 "기능"을 적용

|선택자|기능|
|---|---|
|전체 선택자 *|HTML 문서 상의 모든 요소 선택|
|태그 선택자 태그명|HTML 문서 상의 해당 태그 선택|
|아이디 선택자 #아이디명|HTML 문서 상의 고유 id값 하나 선택|
|클래스 선택자 .클래스명|HTML 문서 상의 여러 클래스값 선택|
*모든 태그내에 공통 사용가능한 속성 : id, class

# 기타 선택자

## 속성 선택자

선택하고자 하는 요소 내의 속성을 선택하는 방법

선택자 뒤에 []를 이용해 속성과 속성값을 제시하며 선택

|선택자|기능|
|---|---|
|선택자[속성=속성값]|"일치"하는 요소|
|선택자[속성~=속성값]|"일치" 하거나 "포함"하는 요소 (키워드 불가능, 공백으로 구분)|
|선택자[속성\|=속성값]|"일치" 하거나 "-으로 시작"하는 요소|
|선택자[속성^=속성값]|"시작" 하는 요소|
|선택자[속성$=속성값]|"끝" 나는 요소|
|선택자[속성*=속성값]|"포함" 하는 요소|

## 자손 선택자 & 후손 선택자

- 자손 : 바로 하위 요소들
- 후손 : 하위 요소들 전부

*즉, **자손조차도 후손**

```html
<div id="test1">
    <h4>div의 자손이면서 후손입니다.</h4>
    <h4>div의 자손이면서 후손입니다.</h4>

    <ul>div의 자손이면서 후손입니다.
        <li>ul의 자손이면서 div의 후손입니다.</li>
        <li>ul의 자손이면서 div의 후손입니다.</li>
    </ul>
</div>
```

|선택자|기능|
|---|---|
|자손 선택자 a>b|a요소의 자손 중 b요소들 선택|
|후손 선택자 a b|a요소의 후손 중 b요소들 선택|

## 동위 선택자

동위관계(같은레벨)에 있는 뒤에 위치한 특정 요소를 선택

|선택자|기능|
|---|---|
|동위관계 단일 선택 a+b|a요소 바로 뒤의 b요소 하나 선택|
|동위관계 전체 선택 a~b|a요소 바로 뒤의 b요소 모두 선택|

## 반응 선택자

사용자의 움직임에 따라 선택되는 선택자

|선택자|기능|
|---|---|
|클릭 선택자 :active|해당 요소가 클릭되었을 경우 스타일 부여|
|호버 선택자 :hover|해당 요소에 마우스가 올라가는 경우 스타일 부여|

## 상태 선택자

요소의 상태에 따라 선택되는 선택자

|선택자|기능|
|---|---|
|체크선택자 :checked|체크된 상태의 요소 선택|
|초점선택자 :focus|초점이 맞춰진 input 요소 선택|
|활성선택자 :enabled|활성화 되어 있는 요소 선택|
|비활성선택자 :disabled|비활성화 되어 있는 요소 선택|

# 선택자 우선순위

기본적으로 CSS는 위에서부터 아래로 적용

태그 선택자 → 클래스 선택자 → 아이디 선택자 → 인라인 스타일 방식 → !important(가장 강력하긴 하나, 권장x)

# 글꼴 관련 스타일

|속성|기능|
|---|---|
|font-family|글꼴 지정|
|font-size|글꼴 크기|
|font-weight|글꼴 굵기|
|font-style|글꼴 기울임|
|font-variant|영문 텍스트 문구를 작은 대문자로 변경|

```html
#ff1{font-family: 궁서체;}
#ff2{font-family: 고딕체;}
#ff3{font-family: 티몬체, 궁서체;}

<p id="ff1">글꼴 테스트1</p>
<p id="ff2">글꼴 테스트2</p>
<p id="ff3">글꼴 테스트3</p>
```
*font-family: 글꼴1, 글꼴2, ... → 없는 글꼴 제시할 경우 다음 글꼴 적용

![image](https://github.com/NanoKim/TIL/assets/151509995/0c9797bd-726d-48f5-993f-0321246700f1)

```html
#fs1{font-size: 35px;}
#fs2{font-size: 2.5em;}
#fs3{font-size: 150%;}

<ul>
    <li id="fs1">고정크기 px 테스트</li>
    <li id="fs2">가변크기 em 테스트</li>
    <li id="fs3">가변크기 % 테스트</li>
</ul>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/b331ce90-0dfc-458f-afb7-52d2833fde7f)

```html
#fw1{font-weight: bold;}
#fw2{font-weight: 900;} /*bolder*/
#fw3{font-weight: 100;} /*lighter*/

<ul>
    <li>원래 굵기</li>
    <li id="fw1">굵은 글꼴로 변경</li>
    <li id="fw2">원래 굵기보다 더 굵게</li>
    <li id="fw3">원래 굵기보다 더 가늘게</li>
</ul>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/a7ea1457-ebe2-4ab8-8d86-40c18c800038)

# 텍스트 관련 스타일

|속성|기능|
|---|---|
|color|텍스트 색상 지정|
|text-decoration|텍스트 줄 긋거나 제거|
|text-transform|영문 텍스트의 대소문자 변환|
|text-shadow|텍스트에 그림자 효과|
|text-align|텍스트 정렬|
|line-height|줄 간격 조절|

```html
#td1{text-decoration: underline;}
#td2{text-decoration: line-through;}
#td3{text-decoration: overline;}

<ul>
    <li id="td1">텍스트 영역 아래 줄 긋기</li> <br>
    <li id="td2">텍스트 영역 중간에 줄 긋기</li> <br>
    <li id="td3">텍스트 영역 위에 줄 긋기</li> <br>
</ul>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/93a66c32-bd71-4dec-b700-f846ddcbbb92)

```html
#ts1{
    color: orangered;
    text-shadow: 5px 5px; /* 번짐정도 생략시 기본적으로 선명한 그림자, 색상 생략시 글자색깔 */
    text-shadow: +5px -5px 5px green;
}

#ts2{
    color: white;
    text-shadow: 0px 0px 10px yellowgreen;
}

#ts3{
    text-shadow: 0px 0px 4px gray, 0px -5px 4px yellow
    , 0px -10px 8px orange, 0px -15px 15px orangered, 0px -22px 20px red;
}

<div>
    <span class="shadow" id="ts1">HTML</span> <br><br><br>
    <span class="shadow" id="ts2">HTML</span> <br><br><br>
    <span class="shadow" id="ts3">HTML</span> <br><br><br>
</div>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/2b00139c-278d-45c7-b17d-88c3cae86a6d)

# 목록 관련 스타일

|속성|기능|
|---|---|
|list-style-type|불릿기호 변경|
|list-style-image|불릿기호 이미지 적용|
|list-style-position|불릿기호 위치 조정|

# 영역 관련 스타일

요소 영역 = content(내용물) + padding(여백) + border(테두리)
![image](https://github.com/NanoKim/TIL/assets/151509995/e5873047-0fcf-4c78-b16c-caa0ea519a9f)

**padding**

내용물 영역(content)과 테두리 영역(border) 사이의 거리(여백)를 조절하는 스타일 속성
```html
#test1{
    padding: 100px;
}

#test2{
    padding-top: 100px;
    padding-right: 20px;
    padding-bottom: 30px;
    padding-left: 10px;
}

#test3{
    padding: 100px 20px 30px 10px; /* 위 아래 오른쪽 아래 (시계방향) */
    padding: 50px 30px; /* 위아래 좌우 */
}

<div class="test" id="test1">컨텐츠영역</div>
<div class="test" id="test2">컨텐츠영역</div>
<div class="test" id="test3">컨텐츠영역</div>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/6a615a24-f560-4c23-856e-ec8dbdc13363)

**margin**

타 요소들 간의 간격을 조정할 때 사용

```html
#test4{
    margin: 50px; /* 사방으로 50px */
}

#test5{
    margin-top: 100px;
    margin-left: 30px;
}

#test6{
    margin: auto; /* 좌우기준 가운데 배치 */
}

<div class="test" id="test4">컨텐츠영역</div><br>
<div class="test" id="test5">컨텐츠영역</div><br>
<div class="test" id="test6">컨텐츠영역</div><br>
```

![image](https://github.com/NanoKim/TIL/assets/151509995/6d85f3a1-0b74-4c20-b9f9-b86b43c106ec)

*h3과 p처럼 기본 마진이 있는 태그들이 존재

# 테두리 관련 스타일

|속성|기능|
|---|---|
|border[-위치]-style|테두리 스타일|
|border[-위치]-width|테두리 두께|
|border[-위치]-color|테두리 색상|
|border[-상하위치, 좌우위치]-radius|테두리 라운딩|
|box-shadow|박스에 그림자 효과|

# 배경 관련 스타일

|속성|기능|
|---|---|
|background-color|배경색 지정|
|background-clip|배경 적용 범위 지정|
|background-image:url("img경로")|이미지 배경|
|background-repeat|이미지 배경 반복|
|background-size|배경 사이즈 지정|
|background-position|배경 위치 지정|
|background-attachment|배경 고정\|스크롤 지정|

# 레이아웃 관련 스타일

**블럭요소** : 한 줄로 영역을 차지하는 요소 / 줄바꿈 발생(div, p, pre, h)

**인라인요소** : content 부분만 영역을 차지하는 요소 / 옆으로 배치(span, label, input, img, 글자관련태그들)

* 요소 영역 = content 영역 + padding 영역(안쪽 여백) + border 영역
  요소 바깥쪽 영역 == margin 영역 (바깥쪽 간격)

**width, height**

기본적으로는 내용을 차지하는 content 영역의 가로, 세로 길이를 조절하는 스타일 속성

**display**

화면 배치 방법 변경
```html
display : inline|block|inline-block;
```

**display : inline**
```html
.display-test{
    border: 1px solid black;
    width: 150px;
    height: 150px;
}

.inline{display: inline;} /* 이 순간, 위에서 지정한 가로 150px 세로 150px 지정이 무시 */

<div class="display-test inline red">첫번째</div>
<div class="display-test inline yellow">두번째</div>
<div class="display-test inline pink">세번째</div>
<div class="display-test inline green">네번째</div>
<div class="display-test inline purple">다섯번째</div>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/711333cd-42ef-409e-af71-7ac70f5feefd)

**inline 하게되면 width와 height 스타일 속성은 적용되지 않음**

**display : inline-block**
```html
.inline-block{display: inline-block;}

<div class="display-test inline-block red">첫번째</div>
<div class="display-test inline-block yellow">두번째</div>
<div class="display-test inline-block pink">세번째</div>
<div class="display-test inline-block green">네번째</div>
<div class="display-test inline-block purple">다섯번째</div>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/e3dcd27d-9d23-4ee4-8ea0-989c0972fd39)

**display : block**
```html
.block{display: block;}

<span class="display-test block red">첫번째</span>
<span class="display-test block yellow" >두번째</span>
<span class="display-test block pink">세번째</span>
<span class="display-test block green">네번째</span>
<span class="display-test block purple">다섯번째</span>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/03346726-75e7-48ac-8186-58482423d3b5)

# 배치 관련 스타일

**position : 상대위치(relative)와 절대위치(absolute)**
```html
.outer{position: relative;} /*outer 클래스가 기준이 된다는 뜻*/

#first{
    width: 300px;
    height: 300px;
    background-color: yellow;
}

#second{
    width: 200px;
    height: 200px;
    background-color: yellowgreen;
    position: absolute; /*내가 원하는 위치에 부여하기 위함*/
    top: 50px;
    left: 50px;
    /* position:relative로 세팅한 부모요소로부터 위쪽으로 50, 왼쪽으로 50px 떨어진 위치에 자리 */
}

#third{
    width: 100px;
    height: 100px;
    background-color: red;
    position: absolute;
    top: 100px;
    left: 100px;
}

<div class="outer">
    <div class="positioning" id="first">첫번째 자식</div>
    <div class="positioning" id="second">두번째 자식</div>
    <div class="positioning" id="third">세번째 자식</div>
</div>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/a032c2df-64ab-4262-89fb-19526267e0ab)

**position : 고정위치(fixed)**
```html
position: fixed;

<div class="positioning" id="fixed-area"></div>
```

**z-index : 요소들을 순서대로 위로 쌓는 속성**
```html
.z-test{
    border: 1px solid black;
    width: 150px;
    height: 100px;
    position: absolute; /*내가 원하는 위치에 부여하기 위함*/
}

#z1{
    background-color: yellow;
    top: 100px;
    left: 100px;
    z-index: 99999; /*z-index 를 강조하는 방법(아주 큰 숫자 제시해서 우선순위 강조)*/
}

#z2{
    background-color: green;
    top: 50px;
    left: 50px;
    z-index: 2;
}

#z3{
    background-color: red;
    z-index: 1;
}

<div class="outer">
    <div class="z-test" id="z1">요소1</div>
    <div class="z-test" id="z2">요소2</div>
    <div class="z-test" id="z3">요소3</div>
</div>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/adfdf280-4424-4c62-851e-37fe0a2915d3)

**etc**
- float : 페이지 내의 요소들을 화면으로부터 띄워서 왼쪽 or 오른쪽으로 배치하는 속성 (display:inline과 비슷하지만, float은 띄워지는 것)
- visivility : 특정 요소를 보이거나 보이지 않게 하는 스타일 속성
- visibility : hidden 은 공간을 차지하지만, display:non은 공간마저도 사라지게
    - 회원가입할 때, 정보를 전부 입력하기 전에는 안 보이지만, 다 입력하면 보이게 할 때
    - 아이디랑 비밀번호만 입력하면 회원가입 될 것 처럼 해 놓고, 비밀번호 입력하고 나면 비번확인 띄게 할 때 등 사용
