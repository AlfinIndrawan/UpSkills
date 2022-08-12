import Foundation
import UIKit

class Topic {
  var topicName: String
  var topicSymbol: String
  
  init(name: String!, icon: String!) {
    self.topicName = name
    self.topicSymbol = icon
  }
}

let topics = [
  Topic(name: "Ios Development", icon: "iphone"),
  Topic(name: "UI Design", icon: "eyedropper"),
  Topic(name: "Web Development", icon: "desktopcomputer")
  ]
