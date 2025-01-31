# Technical Choices Justification

## 1. State Management: Provider
  - **Provider** is a simple and efficient state management solution for Flutter apps.
  - It integrates seamlessly with Flutter's widget tree and is easy to use for small to medium-sized apps.


## 2. Persistent Storage: SharedPreferences
  - **SharedPreferences** is lightweight and easy to use for storing small amounts of data (e.g., favorite books).
  - It persists data across app restarts without requiring a database.

## 3. API Integration: HTTP Package
  - The **http** package is the standard for making network requests in Flutter.
  - It is simple, well-documented, and sufficient for this project's needs.


## 4. UI/UX Design
  - **Material Design**: Provides a consistent and familiar user experience.

## 5. Navigation: Navigator 2.0
- **Navigator 2.0** provides more control over navigation stacks.

## 6. Error Handling
- **Try-Catch Blocks**: Simple and effective for handling API errors.

## 7. Packages Used
- **shared_preferences**: For persistent storage.
- **http**: For API requests.
- **provider**: For state management.

## 8. Architecture
  - **Layered Architecture**: Separates UI, business logic, and data layers for better maintainability.
  - **Feature-Based Organization**: Groups related files by feature (e.g., screens, models, providers).

## 9. Git Practices
  - **Meaningful Commit Messages**: Clearly describe changes.
