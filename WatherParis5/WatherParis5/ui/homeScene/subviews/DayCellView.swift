//
//  DayCellView.swift
//  WatherParis5
//
//  Created by juanfu on 27/10/22.
//

import SwiftUI
import Kingfisher

struct DayCellView: View {
    let model: WeatherListItemBO
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack {
                    Text("\(model.dt_date)")
                    Text(model.dt_txt_hour)
                }
                Spacer()
                if let weather = model.weather.first,
                    let icon = URL(string: "https://openweathermap.org/img/wn/\(weather.icon)@2x.png") {
                    KFImage(icon)
                        .resizable()
                        .frame(width: 60.0, height: 60.0)
                    VStack {
                        Text(weather.main)
                        Text("\(model.main.temp, specifier: "%.2f")°")
                    }
                }
            }
        }
        .frame(height: 70)
        .padding(.horizontal, 12)
    }
}

struct DayCellView_Previews: PreviewProvider {
    static var previews: some View {
        DayCellView(model: WeatherListItemBO(
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
            dt_date: "Monday, October 31, 2022"
        )
        )
    }
}
