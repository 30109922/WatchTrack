import Foundation

struct DailyData: Codable {
    var date: Date
    var totalCalories: Int
    var waterConsumedML: Int
    var waterTargetML: Int
}
