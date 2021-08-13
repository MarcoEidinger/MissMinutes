import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image("MissMinutes").resizable().frame(width: 100, height: 100, alignment: .center).onTapGesture {
                NSWorkspace.shared.open(URL(string: "https://www.youtube.com/watch?v=9ZcyoZlY0aU")!)
            }
            TimezonesView()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
