# 목차

- [영역 관련 속성](#영역-관련-속성)
- [웹 문서 구조](#웹-문서-구조)
- [웹 문서 구조 간단 실습](#웹-문서-구조-간단-실습)
- [웹 문서 구조 상세](#웹-문서-구조-상세)
- [세부 푸터바 만들기](#세부-푸터바-만들기)
- [세부 로그인폼 만들기](#세부-로그인폼-만들기)
- [세부 검색창 만들기](#세부-검색창-만들기)
- [세부 메뉴바 만들기](#세부-메뉴바-만들기)
- [전체 통합하기](#전체-통합하기)

# 영역 관련 속성

- content 영역 : 요소내의 내용물 영역
  - width & height 는 기본적으로 content 영역까지만
- border 영역 : 요소내의 테두리 영역
- padding 영역 : content와 border 사이의 영역
- margin 영역 : 요소의 바깥쪽 영역

요소의 전체 가로,세로 길이는?

content가로길이 + border가로길이 + padding가로길이
content세로길이 + border세로길이 + padding세로길이

→ 계산에 있어 불편하다.
→ box-sizing : 내가 지정한 width, height를 어느 영역까지의 범위로 할 건지 지정 가능

```html
box-sizing: content-box; /* default */
box-sizing: border-box; /* border+padding 까지 포함해서 가로를 지정 */
```

# 웹 문서 구조
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹 문서 구조</title>
    <style>
        div{box-sizing: border-box; border: 1px solid red;}

        /* 전체 감싸는 div */
        .wrap{
            width: 1000px;
            height: 800px;
            margin: auto;
        }

        /*
        #header, #content, #foot{} 이렇게 하면 코드만 길어진다
        후손(공백) 말고 자식만, 좌우기준 가운데 배치
        */
        .wrap>div{width: 100%;}               

        #header, #footer{height: 20%;}
        #content{height: 60%;}

        /* 
        c1 c2 공통적인 스타일 찾기 : 
            세로길이가 부모요소의 100% 
            가로길이가 각각 20% 80% 차지하면서 옆으로 배치되도록
        */

        #content>div{
            height: 100%; 
            float: left;
        }

        #content_1{width: 20%;}
        #content_2{width: 80%;}
    </style>
</head>
<body>
    <div class="wrap"> 
        <div id="header"></div> 
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2"></div>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/0cadb8d2-e9e7-4072-8503-afb2e88b5ca9)

# 웹 문서 구조 간단 실습
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹 문서 구조 간단 실습</title>
    <style>
        div{box-sizing: border-box; border: 1px solid red;}

        .wrap{
            width: 1000px;
            height: 800px;
            margin: auto;
        }

        .wrap>div{width: 100%;}

        #header, #footer{height: 20%;}
        #content{height: 60%;}

        #header>div{
            height: 100%;
            float: left;
        }

        #content>div{
            height: 100%;
            float: left;
        }

        #header1{width: 30%;}
        #header2{width: 60%;}
        #header3{width: 10%;}

        #content1, #content3{width: 20%;}
        #content2{width: 60%;}
    </style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header1"></div>
            <div id="header2"></div>
            <div id="header3"></div>
        </div>
        <div id="content">
            <div id="content1"></div>
            <div id="content2"></div>
            <div id="content3"></div>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/6ab3d70b-a4f6-440c-ad86-7788caa49424)

# 웹 문서 구조 상세
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹 문서 구조 상세</title>
    <style>
        /* 모든 div 들의 border 초기화 및 border-box 설정 */
        div{box-sizing: border-box; border: 1px solid red;}

        /* 가장 바깥의 프레임 설정 */
        .wrap{width: 1000px;height: 800px; margin: auto;}

        /* 공통특성 : 가로길이 100% */
        .wrap>div{width: 100%;}

        /* 영역별 높이 설정 */
        #header, #footer{height: 20%;}
        #navigator{height: 5%;}
        #content{height: 55%;}

        /* 공통특성 : 부모의 세로길이 100% */
        #header>div, #content>div{
            height: 100%;
            float: left;
        }

        /* header 별 가로 설정 */
        #header_1{width: 20%;}
        #header_2{width: 65%;}
        #header_3{width: 15%;}

        /* content 별 가로 설정 */
        #content_1{width: 15%;}
        #content_2{width: 60%;}
        #content_3{width: 25%;}
    </style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2"></div>
            <div id="header_3"></div>
        </div>
        <div id="navigator"></div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2"></div>
            <div id="content_3"></div>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/b419e166-4e58-4e5e-aa25-eba37022b66c)

**위 프레임에 들어갈 세부 폼들을 각각 만들어보자**

# 세부 푸터바 만들기
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>푸터바 만들기 - footer</title>
    <style>
        /* (이미 있기에) 가져가지 않을 영역 */
        div{box-sizing: border-box; border: 1px solid white;}
        #footer{width: 1000px;height: 150px;}

        /* 가져갈 영역 */
        #footer>div{width: 100%;}
        #footer_1{height: 20%;}
        #footer_2{height: 80%;}

        #footer_2>p{ /* div에만 border 를 준 상태라, p에도 border를 줘야함 */
            width: 100%; 
            border: 1px solid white; 
            box-sizing: border-box;
            margin: 0; /* p 태그는 기본적으로 마진이 있어 맞지 않으니 마진을 없애주는 작업이 필요 */
            font-size: 12px;
            color: rgb(58, 58, 58);
        } 

        #p1{height: 80%; padding: 5px 15px;}
        #p2{height: 20%; text-align: center;}

        #footer_1>a{
            text-decoration: none; 
            color: rgb(58, 58, 58); 
            font-weight: 600;
            margin: 15px;
            vertical-align: middle; /* 수직정렬(블럭 요소에 안 될 때가 있지만, a는 인라인 요소) */
        }
    </style>
</head>
<body>
    <div id="footer">

        <!-- 여기서부터 가져가기 -->
        <div id="footer_1">
            <!-- link 가 아직 정해지지 않았다면, #으로 먼저 표기 후 나중에 수정 -->
            <a href="#">이용약관</a> |
            <a href="#">개인정보취급방침</a> |
            <a href="#">인재채용</a> |
            <a href="#">고객센터</a>
        </div>
        <div id="footer_2">
            <p id="p1">
                강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F <br>
                강남지원 2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 4F, 5F, 7F <br>
                강남지원 3관 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F <br>
                종로지원 : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F <br>
                당산지원 : 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F
            </p>
            <p id="p2">
                Copyright © 1998-2024 KH Information Educational Institute All Right Reserved
            </p>
        </div>

    </div>
</body>
</html>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/9aa4077c-34cd-4d84-bc20-b5bc0d91d371)

# 세부 로그인폼 만들기
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인폼 만들기 - content_3</title>
    <style>
        /* (이미 있기에) 가져가지 않을 영역 */
        div, form{box-sizing: border-box; border: 1px solid white;}
        #content_3{width: 300px; height: 600px;}

        /* 가져갈 영역 */
        #login_form{width: 100%; height: 30%;}
        #login_form>*{width: 100%;} /* login_form의 자식 form/div 모두 선택하고 싶기에 >* */
        #login_form_input{height: 80%;}
        #login_form_etc{height: 20%; text-align: center;}

        #login_form_input>*{height: 100%; float: left;}
        #login_input_id_pwd{width: 65%;}
        #login_input_btn{width: 35%;}

        #login_form_etc>a{
            text-decoration: none; 
            color: rgb(58, 58, 58);
            font-size: 12px;
            margin: 10px;
            /* text-align: center; 여기다가 이렇게 center 하면, a 요소 내에서 가운데 정렬되니 변화 x*/
            vertical-align: middle;
        }

        #login_input_id_pwd>input{width: 100%; height: 50%; box-sizing: border-box;} 
        /* padding 이 있어 padding 제거를 위해 box-sizing */
        #login_input_btn>input{width: 100%; height: 100%;}

    </style>
</head>
<body>
    <div id="content_3">

        <!-- 로그인폼 전체를 감싸는 div -->
        <div id="login_form">
            <!-- 2_1. 입력받아 요청할 수 있는 form -->
            <form action="#" id="login_form_input">
                <!-- 3_1. ID/PWD 텍스트 상자가 들어갈 div -->
                <div id="login_input_id_pwd">
                    <input type="text" name="userId" placeholder="아이디를 입력해주세요">
                    <input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요">
                </div>
                <!-- 3_2. 로그인 버튼이 들어갈 div -->
                <div id="login_input_btn">
                    <input type="submit" value="로그인">
                </div>
            </form>
            <!-- 2_2. 회원가입, ID, PWD 찾기 링크 영역 -->
            <div id="login_form_etc">
                <a href="#">회원가입</a>
                <a href="#">ID/PWD 찾기</a>
            </div>
        </div>

    </div>
</body>
</html>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/b317df21-fc13-4077-94e1-17347fa49d3a)

# 세부 검색창 만들기
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색창 만들기 - header 2</title>
    <style>
        /* (이미 있기에) 가져가지 않을 영역 */
        div, form, input{box-sizing: border-box; border: 1px solid red;}
        #header_2{width: 600px; height: 150px;}

        /* 가져갈 영역 */
        #header_2{position: relative;} /* 기준점 */
        #search_form{width: 80%; height: 20%;}

        #search_form{
            margin: auto;
            position: absolute;
            /* 
            사방으로부터의 간격을 0 으로 하겠다 
            = 끌어들이는 힘들이 충돌(4개 값 모두 극단으로 가려고 해서)하여 중앙에 배치됨
            */
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
        }

        #search_form>div{height: 100%; float: left;}
        #search_text{width: 80%;}
        #search_btn{width: 20%;}

        /* #search_text>input, #search_btn>input{width: 100%; height: 100%;} */
        /* 이렇게 가면 코드도 길어지고 별로다 */

        #search_form input{width: 100%; height: 100%;}
        /* 이렇게 후손 선택으로 하면 훨씬 간편하다 */

    </style>
</head>
<body>
    <div id="header_2">
        <form action="#" id="search_form">
            <div id="search_text">
                <input type="text" name="keyword">
            </div>
            <div id="search_btn">
                <input type="submit" value="검색">
            </div> 
        </form>
    </div>
</body>
</html>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/587d040f-edca-4dee-bec7-9745e4de83c1)

# 세부 메뉴바 만들기
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴바 만들기 - navigator</title>
    <style>
        /* (이미 있기에) 가져가지 않을 영역 */
        div{box-sizing: border-box; border: 1px solid white;}
        #navigator{width: 1000px; height: 40px;}

        /* 가져갈 영역 */
        #navi{
            list-style-type: none; /* 부모ul의 불릿 기호 없애기 */
            /* ul이 가진 기본 padding 과 margin 없애기 */
            padding: 0;
            margin: 0;
            height: 100%;
        }

        #navi>li{
            float: left;
            border: 1px solid white; /* 어떻게 배치된건지 확인하고 싶을 때 사용 */
            width: 15%;
            height: 100%;
            text-align: center;
        }

        #navi a{
            border: 1px solid white;
            text-decoration: none;
            color: orange;
            font-size: 18px;
            font-weight: 900;

            width: 100%;
            height: 100%;
            /* 
            각 ul 들의 클릭범주를 늘리고 싶어서 부모(navi)의 100% 로 했으나,변화가 없다 
            => 인라인이라 불가능 
            */
            display: block;

            /* vertical-align: middle; 이거 블록요소일 때는 안 먹힌다. */
            line-height: 35px; /* 라인의 높이 지정 */
        }

        #navi a:hover{color: orangered;}

        #navi>li>ul{
            list-style: none;
            padding: 0;
            display: none; /* 소메뉴들이 지금은 보이지 않게 */
        }

        #navi>li>ul a{font-size: 15px;}
        #navi>li>a:hover+ul{display: block;} /* a에 호버되는 순간 ul 을 보여주도록 */
        #navi>li>ul:hover{display: block;}
    </style>
</head>
<body>
    <div id="navigator">

        <ul id="navi">
            <li><a href="#">Java</a></li>
            <li><a href="#">Oracle</a></li>
            <li><a href="#">Front-end</a>
                <ul>
                    <li><a href="#">HTML</a></li>
                    <li><a href="#">CSS</a></li>
                    <li><a href="#">JavaScript</a></li>
                    <li><a href="#">jQuery</a></li>
                </ul>
            </li>
            <li><a href="#">Server</a>
                <ul>
                    <li><a href="#">JDBC</a></li>
                    <li><a href="#">Servlet</a></li>
                    <li><a href="#">JSP</a></li>
                    <li><a href="#">AJAX</a></li>
                </ul>
            </li>
            <li><a href="#">Framework</a>
                <ul>
                    <li><a href="#">myBatis</a></li>
                    <li><a href="#">Spring</a></li>
                </ul>
            </li>
        </ul>

    </div>
</body>
</html>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/cfe9f33b-4a09-43e5-a221-afba09760922)

# 전체 통합하기
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹 문서 구조 상세</title>
    <style>
        /* 모든 div 들의 border 초기화 및 border-box 설정 */
        div{box-sizing: border-box; border: 1px solid white;}
        input{box-sizing: border-box; border: 1px solid white;}

        /* 가장 바깥의 프레임 설정 */
        .wrap{width: 1000px;height: 800px; margin: auto;}

        /* 공통특성 : 가로길이 100% */
        .wrap>div{width: 100%;}

        /* 영역별 높이 설정 */
        #header, #footer{height: 20%;}
        #navigator{height: 5%;}
        #content{height: 55%;}

        /* 공통특성 : 부모의 세로길이 100% */
        #header>div, #content>div{
            height: 100%;
            float: left;
        }

        /* header 별 가로 설정 */
        #header_1{width: 20%;}
        #header_2{width: 65%;}
        #header_3{width: 15%;}

        /* content 별 가로 설정 */
        #content_1{width: 15%;}
        #content_2{width: 60%;}
        #content_3{width: 25%;}

        #footer>div{width: 100%;}
        #footer_1{height: 20%;}
        #footer_2{height: 80%;}

        /* ============================= 푸터바 스타일 ============================= */

        #footer_2>p{ /* div에만 border 를 준 상태라, p에도 border를 줘야함 */
            width: 100%; 
            border: 1px solid white; 
            box-sizing: border-box;
            margin: 0; /* p 태그는 기본적으로 마진이 있어 맞지 않으니 마진을 없애주는 작업이 필요 */
            font-size: 12px;
            color: rgb(58, 58, 58);
        } 

        #p1{height: 80%; padding: 5px 15px;}
        #p2{height: 20%; text-align: center;}

        #footer_1>a{
            text-decoration: none; 
            color: rgb(58, 58, 58); 
            font-weight: 600;
            margin: 15px;
            vertical-align: middle; /* 수직정렬(블럭 요소에 안 될 때가 있지만, a는 인라인 요소) */
        }

        /* ============================= 로그인폼 스타일 ============================= */

        #login_form{width: 100%; height: 30%;}
        #login_form>*{width: 100%;} /* login_form의 자식 form/div 모두 선택하고 싶기에 >* */
        #login_form_input{height: 80%;}
        #login_form_etc{height: 20%; text-align: center;}

        #login_form_input>*{height: 100%; float: left;}
        #login_input_id_pwd{width: 65%;}
        #login_input_btn{width: 35%;}

        #login_form_etc>a{
            text-decoration: none; 
            color: rgb(58, 58, 58);
            font-size: 12px;
            margin: 10px;
            /* text-align: center; 여기다가 이렇게 center 하면, a 요소 내에서 가운데 정렬되니 변화 x*/
            vertical-align: middle;
        }

        #login_input_id_pwd>input{width: 100%; height: 50%; box-sizing: border-box;} 
        /* padding 이 있어 padding 제거를 위해 box-sizing */
        #login_input_btn>input{width: 100%; height: 100%;}

        /* ============================= 검색창 스타일 ============================= */

        #header_2{position: relative;} /* 기준점 */
        #search_form{width: 80%; height: 20%;}

        #search_form{
            margin: auto;
            position: absolute;
            /* 
            사방으로부터의 간격을 0 으로 하겠다 
            = 끌어들이는 힘들이 충돌(4개 값 모두 극단으로 가려고 해서)하여 중앙에 배치됨
            */
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
        }

        #search_form>div{height: 100%; float: left;}
        #search_text{width: 80%;}
        #search_btn{width: 20%;}

        /* #search_text>input, #search_btn>input{width: 100%; height: 100%;} */
        /* 이렇게 가면 코드도 길어지고 별로다 */

        #search_form input{width: 100%; height: 100%;}
        /* 이렇게 후손 선택으로 하면 훨씬 간편하다 */

        /* ============================= 메뉴바 스타일 ============================= */
        #navi{
            list-style-type: none; /* 부모ul의 불릿 기호 없애기 */
            /* ul이 가진 기본 padding 과 margin 없애기 */
            padding: 0;
            margin: 0;
            height: 100%;
        }

        #navi>li{
            float: left;
            border: 1px solid white; /* 어떻게 배치된건지 확인하고 싶을 때 사용 */
            width: 15%;
            height: 100%;
            text-align: center;
        }

        #navi a{
            border: 1px solid white;
            text-decoration: none;
            color: orange;
            font-size: 18px;
            font-weight: 900;

            width: 100%;
            height: 100%;
            /* 
            각 ul 들의 클릭범주를 늘리고 싶어서 부모(navi)의 100% 로 했으나,변화가 없다 
            => 인라인이라 불가능 
            */
            display: block;

            /* vertical-align: middle; 이거 블록요소일 때는 안 먹힌다. */
            line-height: 35px; /* 라인의 높이 지정 */
            transform: scale(1); 
            /* 
            a 태그가 속해있는 박스의 밑 부분과의 살짝 공백이 있어서 호버 사라짐 
            => 네비게이션 바의 스케일을 키워주자 
            */
        }

        #navi a:hover{color: orangered;}

        #navi>li>ul{
            list-style: none;
            padding: 0;
            display: none; /* 소메뉴들이 지금은 보이지 않게 */
        }

        #navi>li>ul a{font-size: 15px;}
        #navi>li>a:hover+ul{display: block;} /* a에 호버되는 순간 ul 을 보여주도록 */
        #navi>li>ul:hover{display: block;}
    </style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2">
                <form action="#" id="search_form">
                    <div id="search_text">
                        <input type="text" name="keyword">
                    </div>
                    <div id="search_btn">
                        <input type="submit" value="검색">
                    </div> 
                </form>
            </div>
            <div id="header_3"></div>
        </div>
        <div id="navigator">
            <ul id="navi">
                <li><a href="#">Java</a></li>
                <li><a href="#">Oracle</a></li>
                <li><a href="#">Front-end</a>
                    <ul>
                        <li><a href="#">HTML</a></li>
                        <li><a href="#">CSS</a></li>
                        <li><a href="#">JavaScript</a></li>
                        <li><a href="#">jQuery</a></li>
                    </ul>
                </li>
                <li><a href="#">Server</a>
                    <ul>
                        <li><a href="#">JDBC</a></li>
                        <li><a href="#">Servlet</a></li>
                        <li><a href="#">JSP</a></li>
                        <li><a href="#">AJAX</a></li>
                    </ul>
                </li>
                <li><a href="#">Framework</a>
                    <ul>
                        <li><a href="#">myBatis</a></li>
                        <li><a href="#">Spring</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="content">
            <div id="content_1"></div>
            <div id="content_2"></div>
            <div id="content_3">
                <!-- 로그인폼 전체를 감싸는 div -->
                <div id="login_form">
                    <!-- 2_1. 입력받아 요청할 수 있는 form -->
                    <form action="#" id="login_form_input">
                        <!-- 3_1. ID/PWD 텍스트 상자가 들어갈 div -->
                        <div id="login_input_id_pwd">
                            <input type="text" name="userId" placeholder="아이디를 입력해주세요">
                            <input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요">
                        </div>
                        <!-- 3_2. 로그인 버튼이 들어갈 div -->
                        <div id="login_input_btn">
                            <input type="submit" value="로그인">
                        </div>
                    </form>
                    <!-- 2_2. 회원가입, ID, PWD 찾기 링크 영역 -->
                    <div id="login_form_etc">
                        <a href="#">회원가입</a>
                        <a href="#">ID/PWD 찾기</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
            <div id="footer_1">
                <!-- link 가 아직 정해지지 않았다면, #으로 먼저 표기 후 나중에 수정 -->
                <a href="#">이용약관</a> |
                <a href="#">개인정보취급방침</a> |
                <a href="#">인재채용</a> |
                <a href="#">고객센터</a>
            </div>
            <div id="footer_2">
                <p id="p1">
                    강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F <br>
                    강남지원 2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 4F, 5F, 7F <br>
                    강남지원 3관 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F <br>
                    종로지원 : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F <br>
                    당산지원 : 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F
                </p>
                <p id="p2">
                    Copyright © 1998-2024 KH Information Educational Institute All Right Reserved
                </p>
            </div>
        </div>
    </div>
</body>
</html>
```
![image](https://github.com/NanoKim/TIL/assets/151509995/ea522268-95ff-40f8-83bb-922b20670db2)
