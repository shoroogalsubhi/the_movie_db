# The movie db (TMDB) | Okoul challenge

The movie db (TMDB) is a Flutter mobile application that allows people to explore movies.

The software was developed based on a challenge on the [Okoul](https://www.okoul.com/challenges/Movie%20App%20%F0%9F%8E%A5) platform.

## Table Of Content
  - [Installation](#installation)
  - [Dependencies](#dependencies)


## Installation

Download or clone the repository using the link below:
```
https://github.com/shoroogalsubhi/the_movie_db.git
```

Go to the project root and execute the following command in the terminal to get the required dependencies:
```
flutter pub get
```

Go to app constants file the, in (Your Data) sections add your (api Key, account ID, session ID)
```
lib/
|- utils/
    |- app_constants.dart
```

Run the command below on the device you want to use for the app:
```
flutter run
```
## Dependencies
 - get: ^4.6.5
 - http: ^0.13.5
 - shimmer: ^2.0.0
 - shared_preferences: ^2.0.15
