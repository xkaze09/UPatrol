# UPatrol

## Introduction

UPatrol is a mobile application designed to facilitate quick reporting of hazards within the University of the Philippines Visayas Miagao campus. Developed to enhance campus safety, UPatrol enables users to report incidents by submitting a detailed report along with an image as proof.

### Contributors

- Adricula, Briana Jade
- Flauta, Neil Bryan
- Gimeno, Carl Jorenz
- Porras, Sean Alexander
- Salinas, Christian Justin

## Software Requirements Specifications (SRS) Overview

### Purpose

This document outlines the requirements for UPatrol, aiming to provide a comprehensive description of the app's purpose, interface, limitations, and interaction with external applications. It serves as a proposal for customer approval and a guide for the development team.

### Scope

UPatrol is a quick report system, allowing users to report campus hazards. The app maintains a central database to track the status of reports, which can be accessed by external government agencies for resolution and feedback.

## System Overview

### Product Functions

- **User Functions**: Incident reporting with image capture, viewing report progress and history.
- **Moderator Functions**: Moderating and forwarding reports.
- **Receiver Functions**: Receiving reports and updating incident progress.
- **Common Functions**: Time/date display, notifications, profile customization.

### Operating Environment

- Client/server system on Android.
- Database: Firebase.
- Development Platform: Flutter.

### Assumptions and Dependencies

The app assumes users have compatible Android devices with internet access and relies on Firebase and Flutter for its functionality.

## Installation

FlutterFlow projects are built to run on the Flutter _stable_ release.
## Integration Tests

To test on a real iOS / Android device, first connect the device and run the following command from the root of the project:

```bash
flutter test integration_test/test.dart
```

To test on a web browser, first launch `chromedriver` as follows:
```bash
chromedriver --port=4444
```

Then from the root of the project, run the following command:
```bash
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/test.dart \
  -d chrome
```

Find more information about running Flutter integration tests [here](https://docs.flutter.dev/cookbook/testing/integration/introduction#5-run-the-integration-test).
