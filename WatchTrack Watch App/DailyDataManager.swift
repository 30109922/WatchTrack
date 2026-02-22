import Foundation

class DailyDataManager {
    static let shared = DailyDataManager()
    private let storageKey = "dailyData"
    
    private init() {}
    
    func loadToday() -> DailyData {
        let today = Calendar.current.startOfDay(for: Date())
        
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let saved = try? JSONDecoder().decode(DailyData.self, from: data),
           Calendar.current.isDate(saved.date, inSameDayAs: today) {
            return saved
        }
        
        let fresh = DailyData(
            date: today,
            totalCalories: 0,
            waterConsumedML: 0,
            waterTargetML: 2000
        )
        save(fresh)
        return fresh
    }
    
    func save(_ dailyData: DailyData) {
        if let encoded = try? JSONEncoder().encode(dailyData) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
}
