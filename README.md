# State Machine Project

## Table of Contents
- [Overview](#introduction)
- [Features](#features)
- [Files Description](#files-description)
- [State handling](#state-handling)
- [License](#license)

## Overview
This firmware implements a state machine to handle alerts and warnings through Bicolour-LED and buzzer according a dataframe defined.

* C language
* Microcontroller: STM8S003F3P6
* IDE: VS-Code and Cosmic8.
* Link: https://github.com/pablo1941/state_machine

## Features
- Receive data from RX Interrupt
- Create a sequency of LED Bicolor according a dataframe.
- Create alarm using a Buzzer according a dataframe.

## Files Description

- **main.c**: The main source file for the project.
- **inc/**: Directory containing header files.
- **src/**: Directory containing source files.
- **Debug/**: Directory containing debug build files.
- **Release/**: Directory containing release build files.
- **visualfinalv1.dep**: Dependency file.
- **visualfinalv1.stp**: Project file.
- **VisualFinalV1.stw**: Workspace file.
- **VisualFinalV1.wed**: Editor settings file.

## State handling:

* ESTADO_ESPERAR: Waits for button press or other flags to change state.
* ESTADO_RECIBIR: Handles received commands and updates EEPROM.
* ESTADO_VISUALIZAR: Displays battery and recharge status.
* ESTADO_HISTORICOS: Manages historical data display and buzzer control.
* ESTADO_ALARMA: Handles alarm state with LED and buzzer control.
* ESTADO_NOTIFICACION: Manages notifications and visual indicators.
* ESTADO_INICIO: Handles initialization and startup conditions.
* ESTADO_WARNING: Manages warning state with LED and buzzer control.
* ESTADO_FIN: Resets and initializes the system.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
