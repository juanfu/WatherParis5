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
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    if let model = homeViewModel.model,
                       let list = model.model.list {
                        ForEach(list, id: \.self) { item in
                            NavigationLink(value: item) {
                                DayCellView(model: item)
                            }
                        }
                    } else {
                        Text("No data fetched")
                    }
                }
                .navigationDestination(for: WeatherListItemBO.self) { item in
                    DetailView(model: item)
                }
            }
            .onAppear {
                homeViewModel.fetchWeatherData()
            }
        }
        .background {
            LinearGradient(colors: [.white, .blue], startPoint: SwiftUI.UnitPoint.topLeading, endPoint: SwiftUI.UnitPoint.bottomLeading)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
