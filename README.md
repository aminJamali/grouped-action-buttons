<!--
    Developer: Amin Jamali
    Email: aminjamalipc80@gmail.com
    LinkedIn: https://www.linkedin.com/in/amin-jamali-63a76a240
    StackOverFlow : https://stackoverflow.com/users/16264211/amin-jamali
-->

Create grouped FloatingActionButton which can expand and collapse some widgets with animation.

## Features

- Create FloatingActionButton with expandable children so easily
- Makes your code clean and readable


## Getting started

Import:
```dart
    import 'package:grouped_action_buttons/grouped_action_buttons_package.dart';
```


## Usage

you can also checkout example application

```dart
GroupedActionButtons(
    distance: 112,
    openButtonIcon: const Icon(Icons.edit),
    closeButtonIcon: const Icon(Icons.close),
    children: [
    ActionButton(
    onPressed: () => print('b1'),
    backgroundColor: Colors.red,
    icon: const Icon(Icons.abc_rounded),
    ),
    ActionButton(
    onPressed: () => print('b2'),
    icon: const Icon(Icons.ac_unit),
    ),
    ActionButton(
    onPressed: () => print('b3'),
    icon: const Icon(Icons.access_alarms),
    ),
    ],
),
```

## Additional information

for more info checkout github repository and also you can contact me on linkedin to send your message.
LinkedIn: https://www.linkedin.com/in/amin-jamali-63a76a240

