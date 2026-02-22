import SwiftUI

struct ContentView: View {
    @State private var dailyData = DailyDataManager.shared.loadToday()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    Text("Today")
                        .font(.headline)
                    
                    VStack {
                        Text("🔥 Calories")
                            .font(.caption)
                        Text("\(dailyData.totalCalories)")
                            .font(.title2)
                    }
                    
                    VStack {
                        Text("💧 Water")
                            .font(.caption)
                        Text("\(dailyData.waterConsumedML) / \(dailyData.waterTargetML) ml")
                            .font(.title3)
                    }
                    
                    NavigationLink(destination: AddFoodView(dailyData: $dailyData)) {
                        Text("Add Food 🍽️")
                    }
                    
                    NavigationLink(destination: AddWaterView(dailyData: $dailyData)) {
                        Text("Add Water 💧")
                    }
                }
                .padding()
                .onAppear {
                    dailyData = DailyDataManager.shared.loadToday()
                }
            }
        }
    }
}
