# Flutter_Riverpod_Todo_App
A robust To-Do application built with Flutter, utilizing Riverpod for efficient state management and Realm for fast, local data persistence.

Flutter_Riverpod_Todo_App ✍️

A highly efficient and architecturally clean To-Do List application developed with Flutter, designed for performance and maintainability.

✨ Overview

This application serves as a practical and robust example of a To-Do List app, applying Clean Architecture principles using the MVVM/Repository pattern. This ensures a complete separation between the User Interface (View), Business Logic (ViewModel/Provider), and Data Access (Repository/Realm).

🚀 Key Features

Task Management (CRUD): Create, Read, Update, and Delete tasks.

Task Categorization: Tasks are efficiently sorted into three distinct categories using computed properties in the TaskState model:

New

Done

Archived

Offline First: Reliance on Realm for fast, local data persistence.

🛠 Tech Stack


This project is built using modern and robust technologies to ensure high performance, scalability, and maintainability.

Flutter (Dart): The core UI framework for fast multi-platform development.

Riverpod: Used for efficient and type-safe state management (NotifierProvider).

Realm: A high-performance, local database solution for offline data persistence.

Clean/Modular Architecture: Separation of concerns (Repository, Provider, View) for code clarity.

📂 Code Structure 

The project follows a standard modular architecture where features are divided into clear layers:

