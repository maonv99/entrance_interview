# Image App

![image](https://user-images.githubusercontent.com/73025936/212476073-719994d5-7bf6-4beb-b109-e3923203bbb1.png) { width=50% }
![image](https://user-images.githubusercontent.com/73025936/212476080-31725c08-3494-4c38-8c16-251b3f1178f9.png)
![image](https://user-images.githubusercontent.com/73025936/212476084-f7c034b6-74f8-4d62-a320-6d4703b6b911.png)
![image](https://user-images.githubusercontent.com/73025936/212476086-90bc1325-3bdc-49af-bd26-050457f9c831.png)



# GetX Boilerplate Start Project

A boilerplate project created in flutter using GetX.

## Getting Started

The boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components and utilities like basic app architecture, initializer, app theme, linting, constants, **api handling** with proper errors display using `GetConnect` along with a **retry button** and storage using `get_storage`. Some 3rd party dependencies required to create a new project as per your preference. By using boilerplate code as standard initializer, we can have same patterns in all the projects that will inherit it if you're using GetX. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/thealteria/getx_start_project.git
```

Or simply click on the **Use this template** button and make your own repository using this template.

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**NOTE**: Don't forget to change the 'app name' and 'package name' in android, ios and pubspec files.

## Boilerplate Features:

* Initializer - to intialize dependencies on startup
* Home
* Routing
* Theme
* Dynamic UI support
* GetConnect with custom retry button and proper error handling
* GetStorage
* GetX (State Management)
* Custom Validations, widgets, dialogs, extensions and much more

### Libraries & Tools Used

* [GetX](https://github.com/jonataslaw/getx)
* [Storage](https://github.com/jonataslaw/get_storage)
* [ScreenUtil](https://github.com/OpenFlutter/flutter_screenutil/)
* [ImagePicker](https://github.com/flutter/plugins)
* [ImageCropper](https://github.com/hnvn/flutter_image_cropper)
* [ImagePicker](https://github.com/flutter/plugins)
* [Intl](https://github.com/dart-lang/intl)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- app/
|- main.dart
```

```
app/
|- common/
   |- storage/
   |- util/
   |- values/
   |- constants.dart
|- data/
   |- errors/
   |- interface_controller/
   |- api_helper.dart
   |- app_response.dart
|- modules/
   |- home/
   |- widgets/
|- routes/
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- common - Contains all the utilities/common functions  which are using throughout the app. This directory contains `constants`. `utilities`, `theme`, `strings`, `dimensions`, `storage`, `text styles`, `colors` and `images path`.
2- data - Contains the data layer of your project, includes a controller for retry apis, `custom errors` and response & error handling.
3- modules - Contains all the ui of your project, contains sub directory for each screen and custo widgets as per the need.
4- routes — Contains the files for routes for your application.
5- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```
**NOTE**: You can use [Get Cli](https://github.com/jonataslaw/get_cli) to auto generate ui pages, controllers and routes.
