## FightCamp take home (iOS) 🥊

https://github.com/zakdillon/fightcamp-take-home-challenge-ios/tree/master

Hey! Congratulations on making it to the next step in the interview process. We look forward to having you potentially join the FightCamp family!

## Expectations

Replicate the FightCamp package selection (webpage) into a native iOS App using Swift and UIKit. See the image below as a reference:

![](img/mockups-01.png)

![](img/package-animation-01.gif)

## Goals 

There are 3 packages available:

- FightCamp Personal
- FightCamp Tribe
- FightCamp Connect

#### Goal level 1
Only one package (1/3) is displayed on the screen. 

In this case, we should be able to easily change the code so we can test another package.

#### Goal level 2

Have the thumbnails section interactive; possibility to change the preview image by tapping on one of the 4 thumbnails.

#### Goal level 3
Every package (3/3) are displayed on the screen and embedded into a vertical scroll view. It's possible to look at each of 3 packages by scrolling up/down.

## Requirements

- Must compile
- Swift (no Obj-c)
- UIKit (Not ready to SwiftUI yet!)
- No storyboard or nibs - everything programmatically (Autolayout or frame)
- We recommend MVVM achitecture (even considering the small size of the app)
- Light & dark mode compatible
- No third party libraries
- iPad layout isn't supported
- Support iPhones with a screen equal or greater to 4.7in
- The UI isn't hardcoded; `packages.json` is used to populate the UI

## Project Submission

Fork this repository to get access to the configured XCode project and the helper files.

Try to accomplish as many goal levels as you can.

Create a small README with the following items:

* Small summary of the reasoning behind your technical decisions.
* What is missing and why. (if applicable)
* Any other information you believe is necessary for us to know about the issue/solution.

Once completed, email us a Zipped version of your Xcode project with all source files.

## Time allotment 

It should take aproximately 2-3 hours to complete **Goal level 1**. 

An additional work hour can be expected in order to complete **Goal level 2 & 3**.

A maximum of 24 hours is given to the candidate to submit the zipped project. 

## Evaluation

| Criteria | |
|:--|:--|
Readability of the code (easy to read, easy to navigate, well structured)  | ++++
UI is performant and similar to the given example | ++++
Respect of the architecture (e.g. UI separation from the model) | +++
Simplicity of the solutions used | +++
Use of the Swift functionalities | +++
Formatting of the code and code comments | ++

## Helper Files

| Files    | Description    |
|:-----|:------|
|`Colors.swift`| Contains all needed UIColor
|`Fonts.swift` | Contains all UIFonts needed to style the labels
| `Layout.swift` | Contains all CGFloat layout dimensions
| `packages.json` | Contains the FightCamp packages metadata (json format)

## Layout reference

Refer to this image below to build the UI

![](./img/specs-01.png)


