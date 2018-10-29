import UIKit

//MARK: Container

extension UIViewController {
    
    func embed(childViewController: UIViewController) {
        embed(childViewController: childViewController, toContainerView: view)
    }
    
    func embed(childViewController: UIViewController, toContainerView containerView: UIView) {
        assert(containerView === view || containerView.isDescendant(of: view))
        addChild(childViewController)
        childViewController.willMove(toParent: self)
        childViewController.view.frame = containerView.bounds
        childViewController.view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, .flexibleHeight]
        containerView.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    func leaveParentViewController() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }

}
