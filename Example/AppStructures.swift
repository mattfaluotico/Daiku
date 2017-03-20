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



let myAppStructure: DaikuManager = {
    let myAppStructure = DaikuManager()
    myAppStructure.map("one", one)
    myAppStructure.map("two", two)
    return myAppStructure
}()
