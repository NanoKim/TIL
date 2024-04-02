import "./App.css";
import { useState, useRef } from "react";
import Header from "./components/Header";
import Editor from "./components/Editor";
import List from "./components/List";

// 리랜더링 될 때 마다 생성되지 않도록(비효율적이게 되지 않도록) 전역변수로 설정
const mockData = [
  {
    id: 0,
    isDone: false,
    content: "아침 먹기",
    date: new Date().getTime(),
  },
  {
    id: 1,
    isDone: false,
    content: "점심 먹기",
    date: new Date().getTime(),
  },
  {
    id: 2,
    isDone: false,
    content: "저녁 먹기",
    date: new Date().getTime(),
  },
];

function App() {
  const [todos, setTodos] = useState(mockData); // todos를 배열에 보관
  const idRef = useRef(3);

  const onCreate = (content) => {
    const newTodo = {
      id: idRef.current++, //useRef 를 쓰면 좋다
      isDone: false,
      content: content,
      date: new Date().getTime(),
    };

    setTodos([newTodo, ...todos]);
  };

  const onUpdate = (targetId) => {
    // todos state 값들 중, targetId와 일치하는 id를 갖는 todo 아이템의 isDone 변경
    setTodos(
      todos.map((todo) => {
        if (todo.id === targetId) {
          return {
            ...todo,
            isDone: !todo.isDone,
          };
        }
        return todo;
      })
    );
  };

  const onDelete = (targetId) => {
    setTodos(todos.filter((todo) => todo.id !== targetId));
  };

  return (
    <>
      <div className="App">
        <Header />
        <Editor onCreate={onCreate} />
        <List todos={todos} onUpdate={onUpdate} onDelete={onDelete} />
      </div>
    </>
  );
}

export default App;
