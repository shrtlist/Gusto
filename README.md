# Lunch Menu

As you tackle this problem, keep in mind the following:

* Code structure and software architecture principles
* Ability to navigate ambiguous requirements
* Your unique strengths as a software engineer

## The Problem

We really enjoy our catered lunches. We use a rotating schedule for the lunch menu, but it has been tricky for us to keep track of it. To help us plan our week, we'd like an app that displays the lunch schedule on a calendar. You'll find the raw lunch schedule data below.

### Rotating Lunch Schedule

* Week 1
  * Monday - Chicken and waffles
  * Tuesday - Tacos
  * Wednesday - Curry
  * Thursday - Pizza
  * Friday - Sushi
* Week 2
  * Monday - Breakfast for lunch
  * Tuesday - Hamburgers
  * Wednesday - Spaghetti
  * Thursday - Salmon
  * Friday - Sandwiches

## Starting Point

This project has a few things set up for you to start (detailed below), but don't feel glued to them. If there's something we didn't include, feel free to add it as a, and if there something we added that you don't want to use, it's not required that you use it!

* AppDelegates/SceneDelegate.swift **IMPORTANT**
  * Go to `scene(_:willConnectTo:session:options:connectionOptions)`
    * There are two options to get started - MainUIKitViewController & MainSwiftUIHostController
    * Update the rootViewController by uncommenting a line to get started with either a UIKit or SwiftUI approach
    * Note: Your selection does not affect the assessment
* MainUIKitViewController.swift
  * A blank `ViewController` that new UI can be placed into
* MainSwiftUIHostController.swift
  * A blank `UIHostingController` that new SwiftUI can be placed into 
* Data/LunchMenuDataSource.swift
  * This is where you'll access the above menu. We've provided a very basic faked async resource that returns it's data after a 3 second delay to simulate a network request.
