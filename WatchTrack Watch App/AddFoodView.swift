import SwiftUI

struct AddFoodView: View {
    @Binding var dailyData: DailyData
    @State private var calories = 0
    @State private var selectedType = "Meal"
    @Environment(\.dismiss) var dismiss
    
    let foodTypes = ["Meal", "Snack"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Add Food")
                    .font(.headline)
                
                Picker("Type", selection: $selectedType) {
                    ForEach(foodTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Text("Calories: \(calories)")
                    .font(.title3)
                
                HStack(spacing: 5) {
                    Button("+50") { calories += 50 }
                        .buttonStyle(BorderedButtonStyle())
                    Button("+100") { calories += 100 }
                        .buttonStyle(BorderedButtonStyle())
                }
                
                HStack(spacing: 5) {
                    Button("-50") { if calories >= 50 { calories -= 50 } }
                        .buttonStyle(BorderedButtonStyle())
                    Button("Reset") { calories = 0 }
                        .buttonStyle(BorderedButtonStyle())
                }
                
                Button("Save") {
                    dailyData.totalCalories += calories
                    DailyDataManager.shared.save(dailyData)
                    dismiss()
                }
                .buttonStyle(BorderedButtonStyle())
            }
            .padding()
        }
    }
}
