import UIKit

class Section {
  var sectionTitle: String
  var sectionSubtitle: String
  var sectionDescription: String
  var sectionIcon: UIImage
  var sectionBanner: UIImage
  
  init (title: String!, subtitle: String!, description: String!, icon: UIImage!, banner: UIImage!) {
    self.sectionTitle = title
    self.sectionSubtitle = subtitle
    self.sectionDescription = description
    self.sectionIcon = icon
    self.sectionBanner = banner
  }
}
// swiftlint:disable line_length
let sections = [
    Section(title: NSLocalizedString( "Advanced Custom Layout", comment:  "Advanced Custom Layout"), subtitle: NSLocalizedString("SwiftUI for iOS 15", comment: "SwiftUI for iOS 15"), description: NSLocalizedString("Build an iOS app for iOS 15 with custom layouts.", comment: "Build an iOS app for iOS 15 with custom layouts."), icon: UIImage(named: "Logo SwiftUI"), banner: UIImage(named: "Illustration 3")),
    Section(title: NSLocalizedString("Coding the Home View", comment: "Coding the Home View"), subtitle: NSLocalizedString("SwiftUI Concurrency", comment: "SwiftUI Concurrency"), description: NSLocalizedString("Learn about the formatted(date:time:) method and AsyncImage", comment: "Learn about the formatted(date:time:) method and AsyncImage"), icon: UIImage(named: "Logo SwiftUI"), banner: UIImage(named: "Illustration 4")),
    Section(title: NSLocalizedString("Colors and Shadows", comment: "Colors and Shadows"), subtitle: NSLocalizedString("Flutter for Designers", comment: "Flutter for Designers"), description: NSLocalizedString("Read about the design guidelines and how you can use color to maximize your best views", comment: "Read about the design guidelines and how you can use color to maximize your best views"), icon: UIImage(named: "Logo Flutter"), banner: UIImage(named: "Illustration 1"))
]
