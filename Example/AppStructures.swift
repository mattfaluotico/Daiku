import UIKit
import Daiku

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
    ], instance: TabBar() ))


private let beta = Daiku(component: .navigation(root:
    .page(components: [ .viewcontroller(UIViewController() ) ])
    ))


let myAppStructure: DaikuManager = {
    let myAppStructure = DaikuManager()
    myAppStructure.map("one", one)
    myAppStructure.map("two", two)
    myAppStructure.map("beta", beta)
    return myAppStructure
}()
