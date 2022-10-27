//
//  HomeView.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        ScrollView {
            LazyVStack {
                if let model = homeViewModel.model,
                   let list = model.model.list {
                    ForEach(list, id: \.self) { item in
                        Text("\(item.dt_txt)")
                    }
                } else {
                    Text("no data fetched")
                }
            }
        }
        .onAppear {
            homeViewModel.fetchWeatherData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
