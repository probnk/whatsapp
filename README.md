


# 💬 WhatsApp UI Clone

<div align="center">

### A Feature-Rich WhatsApp Clone Built with Flutter

A modern WhatsApp-inspired messaging application developed using **Flutter** with **Provider State Management**, responsive UI, reusable widgets, and clean project architecture.

<p>

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart)
![Provider](https://img.shields.io/badge/State%20Management-Provider-7C4DFF?style=for-the-badge)
![Material Design](https://img.shields.io/badge/UI-Material%203-blue?style=for-the-badge)
![Platform](https://img.shields.io/badge/Android-Flutter-success?style=for-the-badge)

</p>

</div>

---

# 📖 Overview

This project is a fully responsive **WhatsApp-inspired Flutter application** that recreates the core user experience of WhatsApp using Flutter widgets and Provider state management.

The application focuses on delivering a clean architecture, reusable components, and a pixel-perfect interface while demonstrating Flutter development best practices.

It serves as an excellent learning project for Flutter developers interested in building large-scale mobile applications.


<img width="200" height="600" alt="Screenshot_2024-06-23-20-00-12-34_6012fa4d4ddec268fc5c7112cbb265e7" src="https://github.com/user-attachments/assets/c5b72020-b4e0-4182-b448-c757787f9802" />



<img width="200" height="600" alt="Screenshot_2024-06-23-20-00-08-24_6012fa4d4ddec268fc5c7112cbb265e7" src="https://github.com/user-attachments/assets/b7516504-512b-42e8-be43-23b52e8a079e" />
---

# ✨ Features

## 💬 Chats

- Chat List
- Individual Chat Screen
- Message UI
- Search Chats
- Contact Preview
- Chat Profile
- Last Message Preview

---

## 📞 Calls

- Recent Calls
- Voice Calls
- Video Calls
- Search Calls

---

## 📢 Updates

- Status Updates
- Recent Updates
- Viewed Updates
- Channels UI

---

## 👥 Communities

- Communities Screen
- Community Groups
- Community Navigation

---

## 👤 User Profile

- Edit Profile
- Change Avatar
- User Information
- QR Code

---

## ⚙ Settings

- Account
- Privacy
- Chats
- Notifications
- Storage & Data
- App Updates
- Help
- Invite Friends

---

## 👥 Contacts

- Contact List
- Add Contact
- Search Contacts
- Invite Contacts

---

## 🔍 Search

- Chat Search
- Broadcast Search
- Group Search
- Settings Search

---

## 👨‍👩‍👧 Groups

- Create Group
- Search Members
- Invite Members

---

## 📡 Linked Devices

- Linked Devices Screen
- Device Management UI

---

# 🚀 Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | Mobile App Development |
| Dart | Programming Language |
| Provider | State Management |
| Material Design | User Interface |
| Custom Widgets | UI Reusability |

---

# 🧩 State Management

The application uses **Provider** for managing application state.

Implemented Providers include:

- BottomNavBarProvider
- ContactProvider
- HomeProvider
- ImagePickerProvider
- MessageProvider
- UpdatesProvider
- UserProfileProvider
- SettingProvider

---

# 📂 Project Structure

```text
lib/

├── BottomNavBar/
│   ├── BottomNavBar.dart
│   └── CustomClipPath.dart
│
├── Constants/
│   ├── Colors.dart
│   └── fonts.dart
│
├── Model/
│   ├── ContactsModel.dart
│   ├── MessageModel.dart
│   ├── ReceiverModel.dart
│   └── UserProfileModel.dart
│
├── Provider/
│   ├── BottomNavBarProvider.dart
│   ├── ContactProvider.dart
│   ├── HomeProvider.dart
│   ├── ImagePickerProvider.dart
│   ├── MessageProvider.dart
│   ├── UpdatesProvider.dart
│   ├── userProfileProvider.dart
│   └── Setting Provider.dart
│
├── ReuseWidgets/
│   ├── Camera.dart
│   ├── HomeWidget.dart
│   ├── SearchField.dart
│   ├── UpdateWidget.dart
│   ├── NotificationControls.dart
│   ├── usersListTile.dart
│   ├── PopMenu.dart
│   ├── Languages.dart
│   └── ...
│
├── screens/
│   ├── Home/
│   ├── Chat/
│   ├── Call/
│   ├── Updates/
│   ├── Communities/
│   ├── CommunitiesGroups/
│   ├── AddAccount/
│   ├── Setting/
│   └── ReceiverProfile/
│
├── MainPage.dart
└── main.dart
```

---

# 📱 Application Modules

### 🏠 Home

- Chat List
- Search
- Menu
- Contact Management

### 💬 Chat

- Chat Screen
- Receiver Profile
- Message Interface

### 📞 Calls

- Call History
- Search Calls

### 📢 Updates

- Status
- Channels

### 👥 Communities

- Community List
- Community Groups

### ⚙ Settings

- Account
- Privacy
- Notifications
- Chats
- Storage
- QR Code
- Avatar
- Help

---

# 🧱 Architecture

```text
                   Flutter Application

                          │

                    Provider Layer

                          │

        ┌─────────────────┼─────────────────┐

        │                 │                 │

      Models          Screens        Reusable Widgets

        │                 │                 │

        └─────────────────┼─────────────────┘

                    Constants & Theme

                          │

                       Material UI
```

---

# 📦 Assets

The project includes

- Custom Fonts
- WhatsApp Icons
- User Avatars
- Status Images
- Profile Images
- Community Assets
- Meta Branding Assets

---

# 🚀 Getting Started

Clone the repository

```bash
git clone https://github.com/probnk/whatsapp.git
```

Navigate into the project

```bash
cd whatsapp
```

Install dependencies

```bash
flutter pub get
```

Run the project

```bash
flutter run
```

---

# 📸 Screens

- Splash
- Home
- Chats
- Chatting
- Calls
- Updates
- Communities
- Add Contact
- Search
- New Group
- Broadcast
- Linked Devices
- Settings
- User Profile
- QR Code
- Notifications
- Privacy
- Storage
- Help

---

# 🎯 Learning Objectives

This project demonstrates

- Flutter UI Development
- Provider State Management
- Clean Project Organization
- Reusable Widget Design
- Responsive Layouts
- Navigation
- Modular Architecture

---

# 🔮 Future Improvements

- Firebase Authentication
- Real-Time Messaging
- Cloud Firestore
- Voice Messages
- Audio Calls
- Video Calls
- Push Notifications
- Media Sharing
- End-to-End Encryption
- Dark Mode
- Multi-language Support

---

# 👨‍💻 Developer

**Umar Farooq**

Computer Science Student

Flutter Developer

---

# ⭐ Show Your Support

If you found this project useful, consider giving it a **⭐ Star** on GitHub.

It motivates future development and helps others discover the project.

---

<div align="center">

### Built with ❤️ using Flutter

</div>
