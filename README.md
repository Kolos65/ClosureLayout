</br>
<p align="center">
    <img src="https://raw.githubusercontent.com/Kolos65/ClosureLayout/master/title.png" width="700”  alt="ClosureLayout" />
</p>

# 

[![Version](https://img.shields.io/cocoapods/v/ClosureLayout)](https://cocoapods.org/pods/ClosureLayout)
[![License](https://img.shields.io/cocoapods/l/ClosureLayout)](https://cocoapods.org/pods/ClosureLayout)
[![Platform](https://img.shields.io/cocoapods/p/ClosureLayout)](https://cocoapods.org/pods/ClosureLayout)

A lightweight DSL for simple auto layout in Swift.

## Usage
ClosureLayout enables you to create and **activate constraints by passing a simple closure to a function** called `layout`.  ClosureLayout makes sure to call `translatesAutoresizingMaskIntoConstraints = false` so you can omit that line too. Using simple operators in the layout closure, you can define constraints like this:
```swift
label.layout {
    $0.top == view.topAnchor + 30
    $0.leading == view.leadingAnchor + 20
    $0.size == CGSize(width: 200, height: 40)
}

button.layout {
    $0.width == otherView.widthAnchor - 40
    $0.height == otherView.heightAnchor + 10
    $0.centerX == otherView.centerXAnchor
    $0.centerY == otherView.centerYAnchor
}
```
Instead of writing this:
```swift
label.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
    label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
    label.widthAnchor.constraint(equalToConstant: 200),
    label.heightAnchor.constraint(equalToConstant: 40)
])

button.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    button.widthAnchor.constraint(equalTo: otherView.widthAnchor, constant: -40),
    button.heightAnchor.constraint(equalTo: otherView.heightAnchor, constant: 10),
    button.centerXAnchor.constraint(equalTo: otherView.centerXAnchor),
    button.centerYAnchor.constraint(equalTo: otherView.centerYAnchor)
])
```
Furthermore, the library contains a **convenient way of defining boilerplate constraints**. When using auto layout, you often need to constrain every edge of a subview to its superview. You might create a wrapper for a label in a table view header or fill a transparent view with blur, etc... In these cases, you can **use a single method** to create the desired constraints:
```swift
wrapper.fillWith(subview)
```
is equal to:
```swift
wrapper.addSubview(subview)
subview.translatesAutoresizingMaskIntoConstraints = false
subview.topAnchor.constraint(equalTo: wrapper.topAnchor).isActive = true
subview.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor).isActive = true
subview.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor).isActive = true
subview.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor).isActive = true
```
You can optianally provide insets to this function, which will set the given constants on the corresponding constraints:
```swift
let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
wrapper.fillWith(subview, insets: insets)
```
If you need a reference to one of the constraints you can get them from the tuple returned by the function.
```swift
let constraints = wrapper.fillWith(subview)
self.subviewTopConstraint = constraints.top
```
## Installation

ClosureLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ClosureLayout'
```

## Credits
ClosureLayout is based on an [article](https://www.swiftbysundell.com/articles/building-dsls-in-swift/), written by [John Sundell](https://twitter.com/swiftbysundell). Listen to his [podcast](https://www.swiftbysundell.com/podcast/) on [Apple Podcasts](https://podcasts.apple.com/us/podcast/swift-by-sundell/id1267161825) and check out his [website](https://www.swiftbysundell.com/) for more awesome content on Swift development.

## License

ClosureLayout is available under the MIT license. See the LICENSE file for more info.
