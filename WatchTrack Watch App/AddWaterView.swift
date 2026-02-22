import SwiftUI

struct AddWaterView: View {
    @Binding var dailyData: DailyData
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("Add Water")
                    .font(.headline)
                
                Button("+ 250ml") {
                    dailyData.waterConsumedML += 250
                    DailyDataManager.shared.save(dailyData)
                    dismiss()
                }
                .buttonStyle(BorderedButtonStyle())
                
                Button("+ 500ml") {
                    dailyData.waterConsumedML += 500
                    DailyDataManager.shared.save(dailyData)
                    dismiss()
                }
                .buttonStyle(BorderedButtonStyle())
                
                Button("+ 1000ml") {
                    dailyData.waterConsumedML += 1000
                    DailyDataManager.shared.save(dailyData)
                    dismiss()
                }
                .buttonStyle(BorderedButtonStyle())
            }
            .padding()
        }
    }
}
