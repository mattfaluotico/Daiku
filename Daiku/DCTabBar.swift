import UIKit

internal class DCTabBar: DaikuComponent {
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
