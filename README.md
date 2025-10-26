# 🚀 Flutter App – Clean Architecture (MVVM)

## 📖 Overview
This Flutter application consists of *three main pages, each implementing a specific feature and following **Clean Code principles* and the *MVVM architecture pattern*.  
The app is designed with *modularity, **scalability, and **maintainability* in mind — separating the logic, data, and UI layers clearly.  

It uses *Cubit* for state management and *SQLite* for local data storage, ensuring high performance and smooth offline support.  
Each page has its own *model*, keeping the data layer clean and well-organized.

---

## 🧠 Features
-  Built using *MVVM architecture (Model - View - ViewModel)*
-  Managed using *Cubit*
-  Data stored locally using *SQLite*
-  Clean Code organization with separate models for each page

---

## 🏠 Pages Overview

### 🏡 1. Home Page
- Built using *CustomScrollView* for flexible scrolling
- Contains:
  - Custom *AppBar*
  - *Categories* section
  - *Subcategories* list
  - *GridView* for displaying items dynamically
  - *BottomNavigationBar* for navigation
- Data managed through *Cubit*
- Designed for smooth and clean user experience
![HomeView](https://github.com/mohamedatantawy/test_IT_legend_Flutter/blob/main/asset/image/Android%20Emulator%20-%20Pixel_8a_API_35_5554%202025-10-26%2012_00_55%20PM.png)
---

### 💼 2. Packages Page
- Focuses on managing and displaying *subscription packages (الباقات)*
- Uses *SQLite* to:
  - Store and retrieve packages locally  
  - Display package data dynamically  
- Uses *Cubit* to manage:
  - Loading, updating, and selecting packages  
- Allows the user to *choose the desired package*
- Works efficiently both online and offline
![Selection View](https://github.com/mohamedatantawy/test_IT_legend_Flutter/blob/main/asset/image/Android%20Emulator%20-%20Pixel_8a_API_35_5554%202025-10-26%2012_01_53%20PM.png)
---

### 🏘 3. Filter Page
- Provides *product filtering features* based on user preferences
- Filters include:
  - 📍 *Location*
  - 🏷 *Product Type*
  - 🏠 *Number of Rooms*
  - 💰 *Price Range*
  - 💳 *Payment Method*
  - 🏡 *Property Condition*
- Uses *Cubit* for handling filter state and logic
- Stores *categories and filter data* in *SQLite*
- Each filter update reflects instantly in the UI
- Structured and optimized for scalability
![Filter View](https://github.com/mohamedatantawy/test_IT_legend_Flutter/blob/main/asset/image/Android%20Emulator%20-%20Pixel_8a_API_35_5554%202025-10-26%2012_01_21%20PM.png)
---
---

## 🧩 Models
Each of the three main pages has its own model:
- HomeModel → Manages categories, subcategories, and grid data  
- PackageModel → Handles package information and selection state  
- FilterModel → Manages filter options like type, location, price, etc.  

This separation ensures a *clean and maintainable data structure* throughout the app.

---

## 🛠 Technologies Used
- *Flutter* (Dart)
- *Cubit* – State Management
- *SQLite* – Local Data Storage
- *MVVM Pattern* – Clean Architecture
- *Material Design*
- *CustomScrollView, **GridView, **BottomNavigationBar*

---


