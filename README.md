# MVC-Composition-Part3

## Info

This project is based on Medium Article from Alfian Losari:

[https://medium.com/@alfianlosari/refactor-mvc-ios-app-to-mvvm-with-rxswift-in-minutes-alfian-losari-ec7905f946f4](Article)

This article uses the following MVC application as a starting point:

[https://github.com/alfianlosari/MovieInfoStarterProject](https://github.com/alfianlosari/MovieInfoStarterProject)

The application is refactored as an MVVM Application:

[https://github.com/alfianlosari/MovieInfoMVVMiOS](https://github.com/alfianlosari/MovieInfoMVVMiOS)

This project uses the same Models and Service classes as a starting point to build the same application using MVC-Composition architecture.

This way we can compare the 3 architectures:

- Classic MVC
- MVVM + RxSwift
- MVC-Composition

## Getting Started

- Clone
- Open MVCMovieInfo.xcodeproj with Xcode 10
- Get API Key from [ https://developers.themoviedb.org/3/]( https://developers.themoviedb.org/3/)
- Create TMDBAPIKey.swift file in /Classes/Models with the following content:

```Swift
// Replace with your API Key
let TMDBAPIKey = "XXXXXXXXXXXXXXXXXXXXXXX"
```
- Compile and run
