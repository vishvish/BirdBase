# BirdBase AS3 Microsite Framework

BirdBase is a versatile framework built atop RobotLegs and other libraries to provide a fairly comprehensive and straightforward way to build a Flash microsite.

## Get Started

### Building from source

1. Clone source

		git clone git@github.com:vishvish/BirdBase.git

1. Flash Builder

 * Import from filesystem as Flex Library
 * Add `lib` directory: `Project Properties > Flex Library Build Path > Library`

1. Project Sprouts, assuming you have a Ruby install on your system

	1. `gem install flashsdk --pre`
	1. `cd BirdBase`
	1. `rake swc`

### Documentation

API docs of the ActionScript: [http://api.birdbase.org](http://api.birdbase.org)

PDFs:

 * Developer's Guide & Book of Configuration: [http://birdbase.org/documentation/](http://birdbase.org/documentation/)

There is a demo application in progress here: [https://github.com/vishvish/BirdBase-Demo-Site](https://github.com/vishvish/BirdBase-Demo-Site)

And there are guide posts being created regularly on the website.

So far:

 1. [Creating an Embedded Font Library](http://birdbase.org/2011/05/font-library/)
 1. Understanding BirdBase. #1: Bootstrap - coming soon
 1. Understanding BirdBase. #2: Navigation part 1 - coming soon