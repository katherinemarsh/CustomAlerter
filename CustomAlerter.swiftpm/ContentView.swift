import SwiftUI

struct ContentView: View {
    @State private var genericAlert: String?
    var body: some View {
        AlertPresenter {
            VStack {
                Button("Tap to Alert") {
                    genericAlert = "ALERT"
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.teal)
            .customAlert($genericAlert)
        }
    }
}

#Preview {
    ContentView()
}
