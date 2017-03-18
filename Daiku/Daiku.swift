import UIKit

public class Daiku {
    public let id: String?
    private let component = DaikuComponent()
    
    init(id: String? = nil, component: DaikuComponent) {
        self.id = id
        self.component = component
    }
    
    public func make() -> UIViewController {
        return self.component.make()
    }
}

public class DaikuComponent {
    
    init() {    }
    
    static func viewcontroller(_ instance: UIViewController) -> DaikuComponent {
        return DaikuComponent()
    }
    
    static func tabbar(components: [DaikuComponent],
                       instance: UITabBarController = UITabBarController() ) -> DaikuComponent {
        return DaikuComponent()
    }
    
    static func navigation(root: DaikuComponent,
                           instance: UINavigationController = UINavigationController() ) -> DaikuComponent {
        return DaikuComponent()
    }
    
    static func page(controllers: [DaikuComponent],
                     instance: UIPageViewController = UIPageViewController() ) -> DaikuComponent {
        return DaikuComponent()
    }
    
    func make() -> UIViewController {
        fatalError("cannot call")
    }
}

private class ACTabBar: DaikuComponent {
    let components: [DaikuComponent]
    let instance: UITabBarController
    
    init(components: [DaikuComponent], instance: UITabBarController) {
        self.components = components
        self.instance = instance
    }
    
    override func make() -> UIViewController {
        let vcs = self.components.map { (ac) -> UIViewController in
            return ac.make()
        }
        
        instance.viewControllers = vcs
        
        return instance
    }
}

private class ACVC: DaikuComponent {
    
    var instance: UIViewController
    
    init(instance: UIViewController) {
        self.instance = instance
    }
    
    override func make() -> UIViewController {
        return self.instance
    }
}

private class ACNav: DaikuComponent {
    
    let subComponent: DaikuComponent
    let instance: UINavigationController
    
    init(subComponent: DaikuComponent, instance: UINavigationController) {
        self.subComponent = subComponent
        self.instance = instance
    }
    
    override func make() -> UIViewController {
        let vc = self.subComponent.make()
        self.instance.viewControllers = [vc]
        return instance
    }
}

private class ACPag: DaikuComponent {
    
    let components: [DaikuComponent]
    let instance: UIPageViewController
    
    init(components: [DaikuComponent], instance: UIPageViewController) {
        self.components = components
        self.instance = instance
    }
    
    override func make() -> UIViewController {
        return self.instance
    }
}
