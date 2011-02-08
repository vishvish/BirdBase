# BirdBase

...is named for the versatile Origami base fold, from which thousands of models begin, including the famous crane and the flapping bird.

---

# Outline

BirdBase is an application framework built on RobotLegs, Signals, SWFAddress and AssetLoader.

It was borne out of frustration with seeing the same old problems in agency after agency. Custom-written boilerplate code handed from one freelancer to the next, agencies with few, if any, senior developers able to deal with the production of work, and zero reuse of code.

The architecture frameworks and underpinnings are all recognized within the ActionScript world, so there's already a decent pool of knowledge out there.

There are things I want an application framework to do for me:

1. Cheap Deep-linking. SWFAddress does a lot for us, and Signals works beautifully with it. It doesn't have to be complicated, not all Flash sites are enormous.

1. View Transitions. Ways to smoothly go from view to view. It doesn't take a huge queue manager or transition manager or describing the lifecycle of a view transition in a state machine to do this. Unless it's incredibly complicated, we can probably handle it concisely.

1. Bootstrap. I'm a bit particular about this. I want things to fire in a certain order, load configurations and preferences, design assets and do it in an orderly fashion, *and* be extendable. Thank you Joel Hooks and your Finite State Machine.

1. Localization. Nuff Said. YAML gives us a way to hold data and structure easily. We use it.

1. Dynamically load design assets. Broadly, there are two types of asset in a project. Design Assets and Rich Media Assets. Design Assets come out of a SWF file, and provide the look of the site. Button backgrounds, logos, fonts, boxes, all that stuff. Everything else is content-related, lives on a CDN and I consider a rich-media asset. Everything may vary from locale to locale, but design assets are responsible for the main look of the site and I want them to be ready when the application boots and also quickly switchable without reloading the entire application. DynamicSprite lets us do this. Load in a new SWF and change the whole look instantly. It's great.



There are several things I'm staying away from.

1. Infinitely configurable systems via XML. A common request for microsites is the ability to change layout and features across countries and in the future. I've witnessed hugely complicated XML-driven sites which *never* get updated or changed to that extent. A complete waste of time and money. I accept a certain level of customization is required, but sometimes it's just too much. I think ActionScript is the best place to make Flash do things.

1. XML-to-object deserialization. I basically hate it. Classes and mappings have to be described in several places, force-compiled in anyway, and I've seen too-many of these systems lack clarity on what's happening where, what's triggering what, and chasing calls all around an application.

1. Things that remind me of PureMVC. It was good at the time. We built a brilliantly successful game and site with it (Generation Green - Ecorangers) at LBi. The lifecycle is just convoluted, over-complicated and painful. And the diagram on the site is meaningless, pretentious, useless, unhelpful twaddle. I just want PureMVC to get out of my way. Thanks guys, it was good at the time, as I said, but it's an object lesson in how to muffle an application.

1. 


# Quickstart:

1.	Clone the repo
		
		git clone git@github.com:vishvish/BirdBase.git

1.	Checkout v0.2.1
		
		git tag -l
		
		git checkout v0.2.1
		
1.	Boot up Flash Builder, point it to the `src` folder, add the `libs` directory, and run `Main.as` as your application entry point

1.	Be careful that Flash Builder doesn't overwrite the contents of your html-template folder. If it does, `git revert` it.

---


# BirdBase is an application framework...

## ...built from a number of reasonably-established tools.

*	RobotLegs + SwiftSuspenders: so you get a lightweight MVC structure and DI.
* 	SWFAddress: for deep-linking and browser navigation.
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
*	Robert Penner (and implicitly C# events + QT signals) - AS3 Signals
*	Team AS3-Commons - thanks for the logging
*	Kilometer0 Team - thanks for the SWFAddress and Signals integration
*	Justin Windle - nice work on Dynamic Sprite
