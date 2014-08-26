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