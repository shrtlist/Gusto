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
            List(viewModel.weeklyMenus, id: \.id) { weeklyMenu in
                Section(header: Text("Week \(weeklyMenu.id + 1)")) {
                    ForEach(weeklyMenu.menuItems, id: \.self) { menuItem in
                        VStack(alignment: .leading) {
                            Text(menuItem)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
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
