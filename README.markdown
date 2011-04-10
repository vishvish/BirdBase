# BirdBase AS3 Microsite Framework

BirdBase is a versatile framework built atop RobotLegs and other libraries to provide a fairly comprehensive and straightforward way to build a Flash microsite.

## Features

*	Deep-linking with easy browser integration, view transitions, and an easy-to-use router to link URLs to View classes.
*	Bootstrap Management using a State Machine.
*	Asset loading with preloader and on-demand, per mediator.
*	Localization support with dynamic string replacement.
*	DynamicSprite integration for easy access to objects in a SWF.
*	Simple VideoPlayer integration with OSMF (Open Source Media Framework).

## BirdBase is now a SWC library.

---


## ...built from a number of reasonably-established tools.

*	RobotLegs + SwiftSuspenders: so you get a lightweight MVC structure and DI.
* 	SWFAddress: for deep-linking and browser navigation.
*	Eric-Paul Lecluse's marvellous AS3-Navigator library.
* 	Joel Hooks' Finite State Machine.
* 	Provides Bootstrap control for loading preferences/configuration.
* 	Provides localization out of the box.
* 	Loads assets based on the configuration.
*	Provides dead-easy access to assets in a SWF. No more creating classes for assets or mapping names. Builds on
Justin Windle's DynamicSprite. Lovely.

		Now: ball = new DynamicSprite( "ball" );

*	Allows runtime swapping of the asset library: watch all your assets change on stage the instant it loads.

## CREDITS

Builds on the work of (but not limited to)

*	Team RobotLegs - Shaun Smith, and Joel Hooks for the Finite State Machine
*	Till Schneidereit for SwiftSuspenders. That and Hamburg folk rock.
*	Matan Uberstein - thanks for AssetLoader
*	Robert Penner (and implicitly C# events + QT signals) - AS3 Signals.
*	Team AS3-Commons - thanks for the reflection and the collections.
*	Justin Windle - nice work on Dynamic Sprite
*	Eric-Paul Lecluse - thanks for the Navigator library, and for all your time and advice.
*	Mischa Williamson - tip-top advice and coding.

