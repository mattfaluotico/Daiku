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
    
    static func viewcontroller(_ c: UIViewController.Type) -> DaikuComponent {
        return DaikuComponent()
    }
    
    static func tabbar(components: [DaikuComponent],
                       `class` c: UITabBarController.Type = UITabBarController.self) -> DaikuComponent {
        return DaikuComponent()
    }
    
    static func navigation(root: DaikuComponent,
                           `class` c: UINavigationController.Type = UINavigationController.self) -> DaikuComponent {
        return DaikuComponent()
    }
    
    static func page(controllers: [DaikuComponent],
                     `class` c: UIPageViewController.Type = UIPageViewController.self) -> DaikuComponent {
        return DaikuComponent()
    }
    
    func make() -> UIViewController {
        return UIViewController()
    }
}

private class ACTabBar: DaikuComponent {
    var components: [DaikuComponent]
    
    init(components: [DaikuComponent]) {
        self.components = components
    }
    
    override func make() -> UIViewController {
        let tabbar = UITabBarController()
        self.components.map { (ac) -> UIViewController in
            return ac.make()
        }
        return tabbar
    }
}

private class ACVC: DaikuComponent {
    
    var controller: UIViewController
    
    init(`class` c: UIViewController.Type) {
        self.controller = UIViewController()
    }
    
    override func make() -> UIViewController {
        return self.controller
    }
}

private class ACNav: DaikuComponent {
    
    var subComponent: DaikuComponent
    
    init(subComponent: DaikuComponent) {
        self.subComponent = subComponent
    }
    
    override func make() -> UIViewController {
        let nav = UINavigationController()
        let vc = self.subComponent.make()
        nav.viewControllers = [vc]
        return nav
    }
}

private class ACPag: DaikuComponent {
    
    var components: [DaikuComponent]
    
    init(components: [DaikuComponent]) {
        self.components = components
    }
    
    override func make() -> UIViewController {
        let page = UIPageViewController()
        
        return page
    }
}
