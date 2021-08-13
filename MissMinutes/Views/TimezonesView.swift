import AppKit
import SwiftUI

struct TimezonesView: View {
    @State var forecastHours: Double = 0
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Location.allCases, id: \.self) { location in
                HStack {
                    Text(location.name)
                        .font(.headline)
                        .frame(minWidth: 0, maxWidth: 150, alignment: .leading)
                    Text(location.date(for: currentDate.add(hours: Int(forecastHours))))
                        .frame(minWidth: 0, maxWidth: 100)

                    Text(location.time(for: currentDate.add(hours: Int(forecastHours))))
                        .frame(minWidth: 0, maxWidth: 50)
                }
            }
            HStack {
                Text("Forecast")
                Slider(value: $forecastHours, in: 0 ... 48).frame(minWidth: 0, maxWidth: 200)
                Text("\(Int(forecastHours)) hours")
            }
            .padding(.top, 5)
        }
        .onReceive(timer) { input in
            currentDate = input
        }
    }
}

struct TimezonesView_Previews: PreviewProvider {
    static var previews: some View {
        TimezonesView()
    }
}

extension Date {
    func add(hours: Int) -> Date {
        self.addingTimeInterval(TimeInterval(hours * 60 * 60))
    }
}
