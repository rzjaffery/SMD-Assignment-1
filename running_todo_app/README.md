# Flutter Todo App

## Worked done by: 22k-4299,22k-4561,21k-4911, 21k-3379

A simple **Todo List application** built with Flutter that integrates with a REST API backend.  
This project demonstrates best practices for **fetching and sending data over the internet** using the `http` package, manual JSON serialization, and Material Design UI components.

---

## Features
- **Lazy loading with pagination** (10 items per page)
- **Add new todo** with mandatory title and description
- **Mark todo as done / undo**
- **Pull-to-refresh** functionality
- **Responsive Material UI**
- **Manual JSON serialization** (no build_runner)
- **Error handling & validation**
- **Loaders** shown during network operations

---

## 📂 Project Structure

```
lib/
├── main.dart             
├── models/
│    └── todo.dart         
├── services/
│    └── api_service.dart 
├── screens/
│    ├── todo_list.dart    
│    └── add_todo.dart     
└── widgets/
└── todo_tile.dart   

```

---

## 🔧 Requirements
- Flutter SDK (>=3.0 recommended)
- Dart SDK (>=2.18)
- Only one external dependency: [`http`](https://pub.dev/packages/http)

---

## API
This app uses a mock REST API:

- Base URL: https://apimocker.com/todos
- Endpoints: 
    - GET /todos?page={page}&limit=10 → Fetch paginated todos
    - POST /todos → Create new todo
    - PATCH /todos/{id} → Toggle compl_etion status

## Learning Outcome
**This project helps practice:**

- REST API integration with Flutter
- Manual JSON serialization
- Pagination & lazy loading with ScrollController
- Material Design UI principles
- Error handling & validation