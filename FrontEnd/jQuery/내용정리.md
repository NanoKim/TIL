# 목차

- [개요](#개요)
- [요소선택](#요소선택)
  - [기본 선택자](#기본-선택자)
  - [추가적인 선택자](#추가적인-선택자)
  - [필터링 관련 선택](#필터링-관련-선택)
- [요소탐색(순회)메소드_조상](#요소탐색순회메소드_조상)

# 개요

**JavaScript 기반 라이브러리**
- DOM요소 → HTML 태그들..과 관련된 스크립트를 보다 쉽게 구현 가능
- AJAX(비동기식 통신), 이벤트 처리 등 폭넓게 지원
- jQuery와 관련된 확장형 플러그인, 오픈 api 등을 지원

**jQuery 라이브러리 연결 방법**

head 태그 내에 script 태그로 외부 jQuery 관련 .js 파일 연결하기 <br>
- 오프라인 : jQuery 라이브러리 직접 다운로드 받은 후 경로 지정
- 온라인 : CDN (Content Delivery Network) 방식

**jQuery 구문 작성하기**

```html
// 방법 1)
jQuery(document).ready(function(){
 실행내용;
});

// 방법 2)
$(document).ready(function(){
 실행내용;
});

// 방법 3)
$(function(){
 실행내용;
});
```

해당 문서의 요소들만 다 로드되면 곧바로 실행
여러번 기술 가능(제한x) → 쓰는 순서대로 실행

# 요소선택

**요소 선택하는 방법**
|순수 자바스크립트 방식|jQuery 방식|
|---|---|
|document.getElementById("아이디명")|$("#아이디명")|
|document.getElementsByClassName("클래스명")|$(".클래스명")|
|document.getElementsByTagName("태그명")|$("태그명")|

**선택된 요소의 속성값 변경하고자 할 때**
|구분|순수 자바스크립트 방식|jQuery 방식|
|---|---|---|
|접근방법|선택된 요소객체의 속성에 직접 접근|선택된 요소의 메소드 이용|
|스타일|.style.스타일속성 = "변경할 값"|.css("스타일속성","변경할 값")|
|내용|.innerHTML = "변경할 값"|.html("변경할 값")|
|이벤트|.on이벤트명 = function(){}|.이벤트명(function(){})|

## 기본 선택자

기본 선택자를 이용해서 요소 선택
- 아이디 선택자 : 특정 고유한 아이디값을 가진 요소 "하나만" 선택하고자 할 때
- 태그 선택자 : 특정 태그에 해당하는 요소들 선택하고자 할 때
- 클래스 선택자 : 특정 클래스 속성을 가진 요소들 선택하고자 할 때

## 추가적인 선택자

추가적인 선택자를 이용해서 요소 선택
- 자손선택자(>)와 후손선택자( )
- 속성 선택자
  |속성 선택자|기능|
  |---|---|
  |선택자[속성]|특정 속성을 가지고 있는 모든 요소 선택|
  |선택자[속성=특정값]|속성값이 특정값과 "일치"하는 모든 요소 선택|
  |선택자[속성~=특정값]|속성값에 특정값을 "단어로써 포함" 하는 모든 요소 선택|
  |선택자[속성^=특정값]|속성값이 특정값으로 "시작"하는 요소 선택|
  |선택자[속성$=특정값]|속성값이 특정값으로 "끝"나는 요소 선택|
  |선택자[속성*=특정값]|속성값에 특정값을 "포함"하는 요소 선택|
- 입력양식 선택자 (input 태그 전용 => type 속성에 따라 요소 선택)
  - : → input 의 타입이~ 라는 의미
  - :text → input 의 타입이 text
  - :[text|button|checkbox|file|password|radio|reset|submit]
- 상태 (checked, selected, disabled, enabled) 선택자
  - checked 상태 선택자 (radio, checkbox)
  ```html
    <script>
      $(function(){
          // 버튼 클릭시 현재 checked 상태인 요소 선택해서 스타일 부여

          // checkbox인 요소들에 change 이벤트 발생 시, 
          $(":checkbox").change(function(){
              if($(this).prop("checked")){
                  $(this).css({width:"50px",height:"50px"});
              }else{
                  $(this).css({width:"",height:""});
              }; // .prop() : 제시한 값의 속성의 값을 리턴
          });
      });
  </script>
  ```
  - selected 상태 선택자 (select > option)
  ```html
  국적 : 
  <select name="national">
      <option value="x" selected>선택안함</option> 
      <option value="ko">한국</option>
      <option value="us">미국</option>
      <option value="eu">영국</option> 
  </select>

  <button type="button" onclick="test();">확인</button>
  <br>
  선택한 나라 : <span id="result">선택안함</span>

  <script>
      function test(){
          $(function(){
              $("#result").html($("option:selected").html());
          })
      }
  </script>
  ```
  - disabled, enabled 상태 선택자 (input, button 요소)
  ```html
  <button type="button">활성화 버튼</button>
  <button type="button" disabled>비활성화 버튼</button>

  <script>
      $(function(){
          $("button:enabled").css("backgroundColor","yellowgreen");
          $("button:disabled").css("backgroundColor","orangered");
      })
  </script>
  ```

## 필터링 관련 선택

**필터 관련 선택자**
```html
<script>
    $(function(){
        $("tr:first").css("backgroundColor","black").css("color","white");
        $("tr:last").css({backgroundColor:"red",color:"white"});

        // 짝수번째 인덱스에 있는 것을 선택
        $("tr:even").css("backgroundColor","lightgray"); // 0, 2, 4
        
        // 홀수번째 인덱스에 있는 것을 선택
        $("tr:odd").css("backgroundColor","yellow"); // 1, 3
    })
</script>
```

**필터링과 관련된 메소드**

기준이 되는 요소 중 특정 요소만을 걸러 선택해주는 메소드 <br>
.first() / .last() / .filter() / .eq() / .not()

# 요소탐색(순회)메소드_조상

**탐색(순회) 메소드**

조상 메소드 : 기준이 되는 요소의 상위 요소들을 선택할 수 있는 메소드
- $("선택자").parent() : 선택된 요소의 바로 위 상위(부모) 요소 하나만을 선택
- $("선택자").parents() : 선택된 요소의 모든 상위 요소들을 다 선택
- $("선택자").parents("선택자") : 선택된 요소의 모든 상위 요소들 중 제시한 값과 일치하는 상위 요소들만 선택
- $("선택자").parentsUntil : 선택된 요소부터 제시한 값 까지의 모든 상위요소들 선택



