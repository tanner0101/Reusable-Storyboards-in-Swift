class Model {

	func setRootViewControllerTo( newRootVC:UIViewController ) {
	    //dispatch async allows this to be called from inside a completion block
	    dispatch_async(dispatch_get_main_queue(), {
	        UIApplication.sharedApplication().keyWindow.rootViewController = newRootVC
	    })
	}

}