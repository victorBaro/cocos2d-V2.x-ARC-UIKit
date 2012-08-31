**cocos2d-V2.x-ARC-UIKit [iPad only]**
============================

Project based on the 'cocos2d-2.x-ARC-iOS' template available here: https://github.com/LearnCocos2D/cocos2d-iphone-arc-templates so please visit if you need more info.

Ready to use cocos2D v2.x project and UIKit integration with ARC enabled. This project is only for the iPad, but very straight forward to move to an iPhone or Universal version.


============================
**How to use it**
============================

Inside 'Supporting Files' folder I have created a MainWindow.xib containing a navigation controller, which also contains the MainMenuViewController.
I have used the RootViewController to setup the Cocos2D default configuration and launch the HelloWorldLayer scene.

Right now, there is a button 'Start cocos' in the MainMenuViewController which launches the RootViewController. To be able to return, there is a UIKit button in the RootViewController.

The view controllers are managed by the NavigationViewController, declared in the AppDelegate.


================
Additional Notes
================

I followed some Ray Wenderlich tutorials (like http://www.raywenderlich.com/4817/how-to-integrate-cocos2d-and-uikit ) and I am going to upgrade the project the next couple of days to have the option of using Storyboards (probably following this tutorial http://www.tinytimgames.com/2012/02/07/cocos2d-and-storyboards/ ).

I have just done it for myself, but someone could find it interesting.
 



