//
//  ContentView.swift
//  Gusto Lunch Menu
//
//  Created by GustoBot on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LunchScheduleViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isFetching {
                    ProgressView("Fetching...")
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
                    }.overlay {
                        if viewModel.weeklyMenus.isEmpty {
                            ContentUnavailableView.init("No results", systemImage: "fork.knife.circle")
                        }
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
