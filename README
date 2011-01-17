# Quickstart:

1.	Clone the repo
		git clone git@github.com:vishvish/BirdBase.git

1.	Checkout v0.2.0
		git tag -l
		git checkout v0.2.0
		
1.	Install Ruby on your system

1.	Install the thor gem from here: https://github.com/wycats/thor/

1.	From the BirdBase scripts directory (BirdBase/scripts), run the thor installation:
		thor birdbase:app:install <YOUR_APP_NAME> <YOUR_PACKAGE_NAME>
		
		e.g.
		
		thor birdbase:app:install sampleApp com.example
		
	Will install and configure an application called "sampleApp" with ActionScript files in /src/com/example/sampleApp
	
1.	Boot up Flash Builder, point it to the src folder, add the libs directory, and run Main.as

1.	Be careful that Flash Builder doesn't overwrite the contents of your html-template folder. If it does, git revert it.

------------------------------------------


BirdBase is an application framework, built from a number of reasonably-established tools.

It:

1. Is built on RobotLegs so you get a lightweight MVC structure and DI.

2. Integrates SWFAddress for deep-linking and browser navigation.

3. Provides Bootstrap control for loading preferences/configuration.

4. Provides localization out of the box.

5. Uses Joel Hooks Finite State Machine.

6. Loads assets based on the configuration.

7. Provides dead-easy access to assets in a SWF. No more creating classes for assets or mapping names. Builds on
Justin Windle's DynamicSprite. Lovely.

Now: ball = new DynamicSprite( "ball" );

8. Allows runtime swapping of the asset library: watch all your assets change on stage the instant it loads.

// TODO

1. Framework bootstrap could be cleaner - running around building paths from locales, flashvars and preferences 
has plenty of room for confusion.

2. New views for everything.

3. A way to get around the new TLF layout issues when using TLF on a textField in the Flash IDE and exporting that
library. Text Fields seem to default to the TLF layout in the Flash IDE, but when exported, the whole thing chokes
when being loaded in - there's a security issue involved, it seems.

4. Fix a whole bunch of basic architectural annoyances, such as injector definition being in the application context,
and ways to efficiently use multiple asset loaders.

// TINGS



Preferences are a place to hold info you may need later. Such as the name of the correct asset that you wish to load.

This works cloned out of the box, follow the logger statements to see what's going on during bootstrap.


// CREDITS

Builds on the work of (but not limited to)

Team RobotLegs - Shaun Smith, and Joel Hooks for the Finite State Machine

Till Schneidereit for SwiftSuspenders. That and Hamburg folk rock.

Matan Uberstein - thanks for AssetLoader

Robert Penner (and implicitly C# events + QT signals) - AS3 Signals

Team AS3-Commons - thanks for the logging

Kilometer0 Team - thanks for the SWFAddress and Signals integration

Justin Windle - nice work on Dynamic Sprite