import UIKit

class Course {
  var courseTitle: String
  var courseSubtitle: String
  var courseDescription: String
  var courseIcon: UIImage
  var courseBanner: UIImage
  var courseAuthor: [String]?
  var courseGradient: [CGColor]?
  var courseBackground: UIImage?
  var sections: [Section]?
  
  init(title: String!, subtitle: String!, description: String!, icon: UIImage!, banner: UIImage!, author: [String]? = nil, colors: [CGColor]? = nil, background: UIImage? = nil, sections: [Section]) {
    self.courseTitle = title
    self.courseSubtitle = subtitle
    self.courseDescription = description
    self.courseIcon = icon
    self.courseBanner = banner
    self.courseAuthor = author
    self.courseGradient = colors
    self.courseBackground = background
    self.sections = sections
  }
  
}
// swiftlint:disable line_length
let handbooks = [
  Course(title: NSLocalizedString("SwiftUI Handbook", comment: "SwiftUI Handbook"), subtitle: NSLocalizedString("80 sections - 9 hours", comment: "80 sections - 9 hours"), description: NSLocalizedString("Build an iOS app for iOS 15 with custom layouts, animations and more!", comment: "Build an iOS app for iOS 15 with custom layouts, animations and more!"), icon: UIImage(named: "Logo SwiftUI")!, banner: UIImage(named: "Illustration 2")!, author: ["Stephanie Diep"], colors: [
        UIColor(red: 0.387, green: 0.041, blue: 0.55, alpha: 1).cgColor,
        UIColor(red: 0.251, green: 0.555, blue: 0.835, alpha: 1).cgColor
  ], sections: sections),
  Course(title: NSLocalizedString("React Hooks Handbook", comment: "React Hooks Handbook"), subtitle: NSLocalizedString("30 sections - 3 hours", comment: "30 sections - 3 hours"), description: NSLocalizedString("A comprehensive series of tutorials on React Hooks and more!", comment: "A comprehensive series of tutorials on React Hooks and more!"), icon: UIImage(named: "Logo React")!, banner: UIImage(named: "Illustration 4")!, author: ["Meng To, Stephanie Diep"], colors: [
        UIColor(red: 0.51, green: 0.255, blue: 0.737, alpha: 1).cgColor,
        UIColor(red: 0.883, green: 0.283, blue: 0.523, alpha: 1).cgColor,
        UIColor(red: 0.984, green: 0.647, blue: 0.545, alpha: 1).cgColor
  ], sections: sections)
]

let courses = [
  Course(title: NSLocalizedString("SwiftUI Concurrency", comment: "SwiftUI Concurrency"), subtitle: NSLocalizedString("NEW VIDEO", comment: "NEW VIDEO"), description: NSLocalizedString("Build an iOS app for iOS 15 with custom layouts, animations and more!", comment: "Build an iOS app for iOS 15 with custom layouts, animations and more!"), icon: UIImage(named: "Logo SwiftUI")!, banner: UIImage(named: "Illustration 4")!, author: ["Meng To"], background: UIImage(named: "Background 3"), sections: sections),

  Course(title: NSLocalizedString("Flutter for Designers", comment: "Flutter for Designers"), subtitle: NSLocalizedString("20 sections - 3 hours", comment: "20 sections - 3 hours"), description: NSLocalizedString("Build a Flutter app for iOS and Android with layouts, animations and more!", comment: "Build a Flutter app for iOS and Android with layouts, animations and more!"), icon: UIImage(named: "Logo Flutter")!, banner: UIImage(named: "Illustration 1")!, author: ["Sai Kambampati"], background: UIImage(named: "Background 4"), sections: sections),
  
  Course(title: NSLocalizedString("React Hooks Advanced", comment: "React Hooks Advanced"), subtitle: NSLocalizedString("20 sections - 3 hours", comment: "20 sections - 3 hours"), description: NSLocalizedString( "Build a React app with custom layouts, animations and more!", comment:  "Build a React app with custom layouts, animations and more!"), icon: UIImage(named: "Logo React")!, banner: UIImage(named: "Illustration 2")!, author: ["Meng To"], background: UIImage(named: "Background 5"), sections: sections)
]
