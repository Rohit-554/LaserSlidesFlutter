# Laser Slides Flutter

## Overview

Laser Slides Flutter is a mobile application built using the Flutter framework, designed to interact with Beyond software using OSC (Open Sound Control) commands. The application leverages the KISS architecture, BLoC (Business Logic Component) pattern, and utilizes Flutter packages such as osc, floor, and get_it.

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [Architecture](#architecture)
- [OSC Commands](#osc-commands)
- [Socket Connection](#socket-connection)

## Features

- **OSC Integration:** Laser Slides Flutter seamlessly integrates with Beyond software using OSC commands to perform various tasks.
- **KISS Architecture:** Follows the Keep It Simple, Stupid (KISS) architecture for a straightforward and maintainable codebase.
- **BLoC Pattern:** Utilizes the BLoC pattern to manage state and business logic, promoting a clean and modular code structure.
- **Flutter Packages:**
  - osc: Enables communication using Open Sound Control (OSC) protocols.
  - floor: A lightweight SQLite abstraction for Flutter, facilitating local data storage.
  - get_it: A simple and pragmatic service locator for Dart and Flutter projects.

## Tech Stack

- Flutter
- KISS Architecture
- BLoC (Business Logic Component)
- osc package
- floor package
- get_it package

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Rohit-554/LaserSlidesFlutter.git
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

## Usage

1. Launch the Laser Slides Flutter application on a compatible mobile device or emulator.

2. Connect the application to Beyond software using the provided settings.

3. Use the app to send OSC commands and perform tasks within Beyond software.

## Architecture

The application follows the KISS (Keep It Simple, Stupid) architecture to ensure simplicity and maintainability. The BLoC pattern is employed for managing state and business logic, promoting a modular and scalable codebase.

## OSC Commands

The application uses OSC commands to communicate with Beyond software. Refer to the OSC documentation for a list of supported commands and their parameters.

## Socket Connection

Laser Slides Flutter establishes a socket connection with Beyond software to send and receive OSC commands. The OSC package in Flutter facilitates communication over the established socket connection.

## Real-Life Use Cases

**Laser Slides Flutter** finds practical application in various real-life scenarios, including:

- **Live Events:** Enhance live events and performances by using the app to precisely control lighting, visuals, and audio elements. Create an immersive audience experience through dynamic and synchronized audiovisual effects.

- **Presentations:** Elevate presentations by seamlessly navigating slides and multimedia content with precision. The application provides presenters with enhanced control over their visual aids, ensuring a smooth and engaging presentation experience.

- **Interactive Installations:** Design interactive installations that empower users to influence and control audiovisual elements. Whether in art exhibitions or interactive displays, Laser Slides Flutter offers a versatile solution for creating engaging and dynamic user experiences.

- **DJ Performances:** Equip DJs with a portable and efficient tool to manipulate audio and visual effects during performances. The application becomes an essential companion for DJs, allowing them to create captivating and dynamic shows with ease.
