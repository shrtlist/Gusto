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
                    }
                }
            }
            .navigationTitle("Rotating Lunch Schedule")
            .navigationBarTitleDisplayMode(.inline)
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
