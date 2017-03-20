# Daiku

A simple way to manage your app's core layout.

## Concept

I ran into an issue – Based on the user type, the layout of my application changed. I needed to actually change the root view controller. In some instances, it was a UITabBarController, in others, just a UINavigationController, and so on. This gets even more complex with gradually feature deployments and AB-testing.

Daiku lets you build these layouts and map them to IDs. The ID is published globally so you always know how your app is configured.

## How to use it

Daiku only comes with one function: `make()`, which generates a UIViewController based on your layout. Using static Daiku components, you build your app layout.

```swift
func viewcontroller(_ instance: UIViewController) -> DaikuComponent

func tabbar(components: [DaikuComponent], instance: UITabBarController) -> DaikuComponent

func navigation(root: DaikuComponent, instance: UINavigationController) -> DaikuComponent

```

## Example

Let's say we have a few app layouts. 1 for Admin users and 1 for a Base user. We decide that we want to roll out a new dashboard feature to some of our base users. That give us 3 potential layouts.

// IMAGE

We can build each of these layouts

```swift
let base = Daiku(component:
    .navigation(root: .viewcontroller(MasterController() )
    )
)

let admin = Daiku(component: .tabbar(components: [

    .navigation(root: .viewcontroller(AViewController() ) ),
    .navigation(root: .viewcontroller(BViewController() ) ),
    .navigation(root: .viewcontroller(CViewController() ) ),
    .navigation(root: .viewcontroller(DViewController() ) ),
    ], instance: TabBar() ))


let beta = Daiku(component:
    .navigation(root: .viewcontroller(DashboardController() )
    )
)

let myAppStructure: DaikuManager = {
    let myAppStructure = DaikuManager()
    myAppStructure.map("base", base)
    myAppStructure.map("admin", admin)
    myAppStructure.map("beta", beta)
    return myAppStructure
}()
```

Now it's really easy to assign this layout as our applications root view controller

```swift
self.window.rootViewController = myAppStructure["beta"].make()
```
