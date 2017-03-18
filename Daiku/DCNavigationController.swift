import UIKit

internal class DCNavigationController: DaikuComponent {
    
    let root: DaikuComponent
    let instance: UINavigationController
    
    init(root: DaikuComponent, instance: UINavigationController) {
        self.root = root
        self.instance = instance
    }
    
    override func make() -> UIViewController {
        let vc = self.root.make()
        self.instance.viewControllers = [vc]
        return instance
    }
}
