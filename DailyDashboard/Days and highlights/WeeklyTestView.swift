import SwiftUI
import AppKit
import Introspect
import Combine


struct WeeklyTestView: View {

    // MARK: - Properties
    
    @State var isFR = true
    
    // MARK: - Body
    
    var body: some View {
        Print("Rendering weeklyTestView")
        VStack {
              HStack {
                ForEach(Day.daysOfWeek()) { day in
                    let model = DayViewModel(day)
                    DayView(viewModel: model)
                    Divider().frame(width: 16, height: 0, alignment: .center)
                }
              }
            .frame(height: 100)
        }.frame(width: 2000, height: DayView.size.height + 24, alignment: .center)
        .cornerRadius(20)
    }
}

struct TestSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyTestView()
    }
}
