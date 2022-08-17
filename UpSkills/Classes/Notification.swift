import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

enum TBSection: CaseIterable {
  case main
}

struct NotificationModel: Hashable, Codable {
  @DocumentID var id: String?
  var title: String!
  var subtitle: String!
  var message: String!
  var image: String!
  var sentAt: Timestamp!
}

//let sampleNotifs = [
//    NotificationModel(id: "0x1", title: "New Release", subtitle: "SwiftUI", message: "A new release of the SwiftUI course has been released", image: "Logo SwiftUI", sentAt: Timestamp()),
//    NotificationModel(id: "0x2", title: "Content UpTimestamp", subtitle: "React Hooks", message: "The React Hooks course has been upTimestampd", image: "React", sentAt: Timestamp()),
//    NotificationModel(id: "0x3", title: "New Release", subtitle: "UIKit for iOS 15", message: "A new release by Sai Kambampati has been pushed", image: "SwiftUI", sentAt: Timestamp()),
//    NotificationModel(id: "0x4", title: "Black Friday Deal", subtitle: "Design+Code", message: "Purchase your subscription for 20% off only today", image: "Design+Code", sentAt: Timestamp())
//]
