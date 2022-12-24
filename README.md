# The movie db (TMDB) | Okoul challenge

The movie db ([TMDB](https://www.themoviedb.org/)) is a Flutter mobile application that allows people to explore movies.

The software was developed based on a challenge on the ([Okoul](https://www.okoul.com/challenges/Movie%20App%20%F0%9F%8E%A5)) platform.

## Table Of Content
  - [Results](#results)
  - [Installation](#installation)
  - [Tools](#tools)
  - [Dependencies](#dependencies)
  - [License](#license)
  - [Contact me](#contact-me)

## Results
### App APK
[Movie app APK](https://github.com/shoroogalsubhi/the_movie_db/tree/main/GitHub%20folder/APK)
### Screen Recording
### Screenshots for Loading and No Data Cases

Loading movies     |Loading images   |Now Playing & Upcoming 
:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://github.com/shoroogalsubhi/the_movie_db/blob/main/GitHub%20folder/screenshots/loading.png" width="200"> | <img src="https://github.com/shoroogalsubhi/the_movie_db/blob/main/GitHub%20folder/screenshots/loading%20image.png" width="200">| <img src="https://github.com/shoroogalsubhi/the_movie_db/blob/main/GitHub%20folder/screenshots/now%20playing%20and%20upcoming.png" width="200">
Movies based on category |Favorite     |Trending   
<img src="https://github.com/shoroogalsubhi/the_movie_db/blob/main/GitHub%20folder/screenshots/movie%20category.png" width="200">| <img src="https://github.com/shoroogalsubhi/the_movie_db/blob/main/GitHub%20folder/screenshots/favorite.png" width="200"> | <img src="https://github.com/shoroogalsubhi/the_movie_db/blob/main/GitHub%20folder/screenshots/trending.png" width="200"> 
|Cast            |No Image   | Loading Movie Details
<img src="https://github.com/shoroogalsubhi/the_movie_db/blob/main/GitHub%20folder/screenshots/cast.png" width="200"> | <img src="https://github.com/shoroogalsubhi/the_movie_db/blob/main/GitHub%20folder/screenshots/no%20image.png" width="200">  | <img src="https://github.com/shoroogalsubhi/the_movie_db/blob/main/GitHub%20folder/screenshots/loading%20movie%20details.png" width="200">


## Installation

1. Download or clone the repository using the link below:
```
https://github.com/shoroogalsubhi/the_movie_db.git
```

2. Go to the project root and execute the following command in the terminal to get the required dependencies:
```
flutter pub get
```

3. Go to app constants file the, in (Your Data) sections add your (api Key, account ID, session ID):
```
lib/
|- utils/
    |- app_constants.dart
```
### Here are resources to get your data:
- (https://developers.themoviedb.org/3/getting-started/authentication)
- (https://www.themoviedb.org/talk/5d284fad5f6c4916bc604062)

4. Run the command below on the device you want to use for the app:
```
flutter run
```
## Tools
- Dart (Flutter)[Frontend]
- [TMDB Api](https://developers.themoviedb.org/3) [Backend]

## Dependencies
 - [get: ^4.6.5](https://pub.dev/packages/get)
 - [http: ^0.13.5](https://pub.dev/packages/http)
 - [shimmer: ^2.0.0](https://pub.dev/packages/shimmer)
 - [shared_preferences: ^2.0.15](https://pub.dev/packages/shared_preferences)
 
 ## LICENSE
 - [MIT License](https://github.com/shoroogalsubhi/the_movie_db/blob/main/LICENSE)

## Contact me
   - Email shoroogalsubhi@gmail.com
   - Linkedin [Shoroog Alsubhi](https://www.linkedin.com/in/shoroogalsubhi/)
   

