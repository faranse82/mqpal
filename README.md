# MQPal

## Overview
MQPal is a mobile application designed for Macquarie University students to submit and manage inquiries regarding their studies and campus experiences. Developed by Faran Sepehrisadr (47393416) as part of the COMP3130 Major Project.

![MQPal App](https://i.ibb.co/3m2qLVgp/Screenshot-2025-03-26-145320.png)

## Features

### Core Functionality
- **Interactive Campus Map**: Navigate the MQU campus with pinch-to-zoom and drag functionality
- **Inquiry Management System**: Submit, edit, delete, and track inquiries
- **Theme Customization**: Toggle between dark and light modes with preferences saved to the cloud
- **Cloud Storage**: All user inquiries and app settings are automatically synchronized with Firebase
- **Responsive Design**: Optimized UI for various screen sizes and device types

### Technical Highlights
- **State Management**: Implemented using Provider pattern for efficient UI updates
- **Firebase Integration**: Cloud storage for data persistence across devices
- **Adaptive Layouts**: Dynamic UI adjustments using the Sizer package
- **Consistent Theming**: Complete dark/light mode implementation across all screens

## Platform Compatibility

### Tested & Compatible
- ✅ Android devices (Pixel 6a, Pixel 7, Pixel 7 Pro, Samsung Galaxy S23+)
- ✅ Android emulators (Large, Small Phone configurations)
- ✅ Web browsers (Chrome, Edge)

### Known Limitations
- ⚠️ **Windows & Linux**: Limited compatibility due to Firebase implementation constraints
- ⚠️ **iOS & macOS**: Should work theoretically, but not tested due to hardware limitations
- ⚠️ **Chrome on Linux**: Occasional scaling issues after hot reload (fixed with hot restart)

## Development Changes
Since the initial design proposal:
- **IMPROVED**: Converted inquiry submission to a popup form for streamlined user experience
- **ADDED**: Interactive campus map with gesture controls
- **ADDED**: Comprehensive dark/light theme system with persistence
- **REMOVED**: Coffee subsystem to maintain focus on core functionality

## Technical Implementation

### Dependencies
- **Provider**: State management
- **Firebase Storage**: Cloud data persistence
- **Sizer**: Responsive layout scaling
- **Mockito**: Testing framework

### Development Tools
- **Faker**: Test data generation
- **Flutter SDK**: Application framework

## Testing
The application includes comprehensive unit and widget tests:
```
flutter test
```

## Future Enhancements
- User authentication system
- Push notifications for inquiry updates
