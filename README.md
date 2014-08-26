Fast-Reusable-Storyboards-in-Swift
==================================

A tiny class for creating blazing fast and incredibly reusable storyboards in Swift

Introduction
------------

Storyboards are awesome. But when they get too large, they can become slow and unmanageable. Plus, fishing out a view controller for reuse from a giant heap of storyboard mess only gets more difficult as projects get larger.

I've always known you could make projects with multiple Storyboards...but the idea of hooking them together seemed difficult. It's so easy to drag-and-drop segues in the Interface Builder. But, like all programmers should, I stepped into the dark unkown and tried my hand at multiple Storyboards. The result was amazing. Not only do they compile literally 10 times faster, I am able to re-use common view controllers and ideas, and find myself coding in a much more DRY fashion. 

Storyboard.swift
================

The class is simple, but oh so powerful.

```SWIFT
class Storyboard {
    class func viewControllerFromStoryboard(name: String, withViewControllerIdentifier identifier: String) -> UIViewController {
        var storyBoard = UIStoryboard(name: name, bundle: nil)
        return storyBoard.instantiateViewControllerWithIdentifier(identifier) as UIViewController
    }
    
    class func viewFromNib(name: String) -> UIView! {
        return UINib(nibName: name, bundle: NSBundle.mainBundle()).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    //MARK: Custom View Controllers
    
    class func facebookLoginViewController() -> FacebookLoginVC {
        return self.viewControllerFromStoryboard("Facebook", withViewControllerIdentifier: "facebookLoginVC") as FacebookLoginVC
    }

    //MARK: Custom Views
    
    class func facebookProfileView() -> FacebookProfileView {
        return self.viewFromNib("FacebookProfileView") as FacebookProfileView
    }
}
```

Here you can see how easy it would be to drag and drop a Facebook storyboard between projects to keep from re-writing the same login code you may need for multiple apps. Just call `Storyboard.facebookLoginViewController()` to get ready-to-go view controller. You could even put these class functions in the view controller class's Swift file and reference the Storyboard class from there to call `FacebookLoginVC.newViewController()`

To put these new view controllers on screen, you can use a tab bar or navigation controller, or just set them as the root view controller.

Tab Bar
-------
```SWIFT
self.setViewControllers([
    Storyboard.socialNavigationController(),
    Storyboard.messagesNavigationController(),
    Storyboard.marketNavigationController()
], animated: false)
```

Navigation Controller
---------------------

```SWIFT
self.navigationController.pushViewController(Storyboard.facebookLoginViewController(), animated: true)
```

Manually
--------

```SWIFT
func setRootViewControllerTo( newRootVC:UIViewController ) {
    //dispatch async allows this to be called from inside a completion block
    dispatch_async(dispatch_get_main_queue(), {
        UIApplication.sharedApplication().keyWindow.rootViewController = newRootVC
    })
}
self.setRootViewControllerTo( Storyboard.facebookLoginViewController() )
```

Enjoy!

- Tanner