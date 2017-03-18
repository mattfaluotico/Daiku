import UIKit

public class DaikuComponent {
    
    internal init() {    }
    
    public static func viewcontroller(_ instance: UIViewController) -> DaikuComponent {
        return DCViewController(instance: instance)
    }
    
    public static func tabbar(components: [DaikuComponent],
                       instance: UITabBarController = UITabBarController() ) -> DaikuComponent {
        return DCTabBar(components: components, instance: instance)
    }
    
    public static func navigation(root: DaikuComponent,
                           instance: UINavigationController = UINavigationController() ) -> DaikuComponent {
        return DCNavigationController(root: root, instance: instance)
    }
    
    public static func page(components: [DaikuComponent],
                     instance: UIPageViewController = UIPageViewController() ) -> DaikuComponent {
        return DCPage(components: components, instance: instance)
    }
    
    public func make() -> UIViewController {
        fatalError("cannot call on a base component")
    }
}
