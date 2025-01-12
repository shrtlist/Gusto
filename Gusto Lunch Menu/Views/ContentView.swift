//
//  ContentView.swift
//  Gusto Lunch Menu
//
//  Created by GustoBot on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = LunchScheduleViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isFetching {
                    ProgressView("Fetching...")
                } else if viewModel.weeklyMenus.isEmpty {
                    ScrollView {
                        ContentUnavailableView.init("No results", systemImage: "fork.knife.circle")
                    }
                } else {
                    List(viewModel.weeklyMenus, id: \.id) { weeklyMenu in
                        Section(header: Text("Week \(weeklyMenu.id)")) {
                            ForEach(weeklyMenu.menuItems, id: \.weekday) { menuItem in
                                HStack {
                                    Text(menuItem.weekday.asString)
                                    Spacer()
                                    Text(menuItem.name)
                                }
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                    .refreshable {
                        await viewModel.fetchLunchMenu()
                    }
                }
            }
            .navigationTitle("Rotating Lunch Schedule")
            .navigationBarTitleDisplayMode(.inline)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification, object: nil)) { _ in
                Task {
                    await viewModel.fetchLunchMenu()
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchLunchMenu()
            }
        }
    }
}

#Preview {
    ContentView()
}
