# Example App - Learning & Feature Checklist

## Basics (Done)
- [x] Setup Flutter project
- [x] Integrate Riverpod (state management)
- [x] Setup GoRouter (navigation)
- [x] Basic Example CRUD UI (add, edit, delete)
- [x] Example model with Freezed & JSON serialization
- [x] Persist Examples to `SharedPreferences`
- [x] Google Sign-In using Firebase Auth

---

## Intermediate Features (Recommended)
- [x] CRUD Examples per user (scoped by uid)
- [ ] Add `isDone`, `dueDate`, and `priority` to Example model

- [ ] Sort/filter Examples (by dueDate, priority)
    - Priority levels (Low, Normal, High, Urgent)
    - Priority colors/indicators
    - Sort by priority
    - Filter by priority
    - Priority badges on task items

- [ ] Search & Advanced Filtering
    - Search tasks by title/description
    - Combined filters (category + priority + status)
    - Recent searches
    - Search suggestions
    - Filter presets (Today, This Week, High Priority)

- [ ] Home Dashboard
    - Today's focus section
    - Progress statistics
    - Streak tracking (days active)
    - Weekly/monthly overview
    - Quick actions (add task, voice note)

- [ ] Add subtasks to Examples
    - Add subtasks to main tasks
    - Check off subtasks
    - Progress bar (2/5 subtasks done)
    - Nested task structure
    - Subtask notifications

- [ ] Task details page (description, notes, attachments)
- [ ] Quick actions (mark done, set priority)
- [ ] Basic task statistics
- [ ] Export/import tasks (CSV/JSON)
---

## Advanced Features (Challenge Mode)
- [ ] Notifications for due Examples (use `flutter_local_notifications`)
- [ ] Add checklist (with progress %) inside a Example
- [ ] Create tag/category system
- [ ] Theme switcher (dark/light mode)
- [ ] Reorder Examples (drag & drop)
- [ ] Offline mode: sync local Examples to cloud when online
- [ ] Animate UI with `flutter_animate`

---

## Architecture & Clean Code
- [x] Create a `Repository` layer (`ExamplesRepository`)
- [x] Split domain/data/presentation layers
- [x] Use Riverpod `AsyncNotifier`, `Provider`, `StateNotifier` appropriately
- [ ] Write widget tests for Example UI
- [ ] Comprehensive unit tests for business logic
- [ ] Widget tests for critical UI components
- [ ] Integration tests for key user flows
- [ ] Error boundary and crash reporting
- [ ] Performance optimization (lazy loading, caching)

---

## Extra Features
- [ ] Firebase Analytics (track user activity)
- [ ] In-app feedback form (Google Form or Firestore)
- [ ] App version check / force update prompt
- [ ] Analytics dashboard (task completion trends)
- [ ] Voice-to-task conversion
- [ ] Smart due date suggestions
- [ ] Task templates for recurring work
- [ ] Integration with calendar apps
- [ ] Productivity insights and recommendations
- [ ] Multi-language support
- [ ] Accessibility improvements (screen reader support)
