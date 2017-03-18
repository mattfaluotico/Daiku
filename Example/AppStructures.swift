import UIKit
import Daiku

class AppStucture {
    
    private var s: [String : Daiku] = [:]
    
    init() {    }
    
    func map(_ s: String, _ d: Daiku) {
        self.s[s] = d
    }
 
    subscript(s: String) -> Daiku {
        return self.s[s]!
    }
}


private let one = Daiku(component:
    .navigation(root:
        .viewcontroller(ViewController() )
    )
)

private let two = Daiku(component: .tabbar(components: [
    .navigation(root: .viewcontroller(ViewController() ) ),
    .navigation(root: .viewcontroller(ViewController() ) ),
    .navigation(root: .viewcontroller(ViewController() ) ),
    .navigation(root: .viewcontroller(ViewController() ) ),
    ]))


private let beta = Daiku(component: .navigation(root:
    .page(components: [ .viewcontroller(UIViewController() ) ])
    ))


let myAppStructure: AppStucture = {
    let myAppStructure = AppStucture()
    myAppStructure.map("one", one)
    myAppStructure.map("two", two)
    myAppStructure.map("beta", beta)
    return myAppStructure
}()
