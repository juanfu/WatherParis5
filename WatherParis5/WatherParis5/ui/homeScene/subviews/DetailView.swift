//
//  DetailView.swift
//  WatherParis5
//
//  Created by juanfu on 27/10/22.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    let model: WeatherListItemBO
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text(model.dt_txt_hour)
                    .font(.largeTitle)
                HStack {
                    if let weather = model.weather.first,
                       let icon = URL(string: "https://openweathermap.org/img/wn/\(weather.icon)@2x.png") {
                        KFImage(icon)
                            .resizable()
                            .frame(width: 60.0, height: 60.0)
                        VStack {
                            Text(weather.main)
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text("Temperature")
                        .font(.largeTitle)
                    HStack {
                        Text("Temp: \(model.main.temp, specifier: "%.2f")°")
                        Spacer()
                        Text("Feels Like: \(model.main.feels_like, specifier: "%.2f")°")
                    }
                    HStack {
                        Text("Temp Min: \(model.main.temp_min, specifier: "%.2f")°")
                        Spacer()
                        Text("Temp Max: \(model.main.temp_max, specifier: "%.2f")°")
                    }
                    HStack {
                        Text("Pressure: \(model.main.pressure)")
                        Spacer()
                        Text("Humidity: \(model.main.humidity)%")
                    }
                }
                VStack(alignment: .leading) {
                    Text("Wind")
                        .font(.largeTitle)
                    HStack {
                        Text("Speed: \(model.wind.speed)")
                        Spacer()
                    }
                }
                
            }
            .padding(.horizontal, 12)
        }
        .background {
            LinearGradient(colors: [.white, .blue], startPoint: SwiftUI.UnitPoint.topLeading, endPoint: SwiftUI.UnitPoint.bottomLeading)
                .edgesIgnoringSafeArea(.all)
        }
        .navigationTitle(model.dt_date)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(model: WeatherListItemBO(
            dt: 0,
            main: MainBO(temp: 0.0, feels_like: 0.0, temp_min: 0.0, temp_max: 0.0, pressure: 0, sea_level: 0, grnd_level: 0, humidity: 0, temp_kf: 0.0),
            weather: [WeatherBO(id: 0, main: "clouds", description: "0", icon: "10n")],
            clouds: CloudsBO(all: 1),
            wind: WindBO(speed: 20.0, deg: 10, gust: 20.0),
            visibility: 0,
            pop: 0,
            sys: SysBO(pod: "0"),
            dt_txt: "0.0",
            dt_txt_hour: "00:00",
            dt_date: "Lunes, Octubre 31, 2022"
        )
        )
    }
}
