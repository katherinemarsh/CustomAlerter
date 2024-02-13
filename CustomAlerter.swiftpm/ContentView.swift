import SwiftUI

struct ContentView: View {

    var body: some View {
        AlertPresenter {
            TabView {
                Text("Home")
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

struct SettingsView: View {
    @State private var alert: CustomAlert?

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        Link("About", destination: URL(string: "https://www.google.com")!)
                        Link("FAQs", destination: URL(string: "https://www.google.com")!)
                        Link("Support and Feedback", destination: URL(string: "https://www.google.com")!)
                        Link("Privacy Policy", destination: URL(string: "https://www.google.com")!)
                        Link("Terms of Use", destination: URL(string: "https://www.google.com")!)
                    }
                }

                Button("Tap to Alert") {
                    alert = .generic
                }

                Spacer()
            }
            .customAlert($alert)
            .foregroundStyle(.black)
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
