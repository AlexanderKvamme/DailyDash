import SwiftUI
import AppKit
import Introspect

class DayViewModel: ObservableObject {

    @Published var highlights: [Highlight] {
        didSet {
            StorageService.putHighlightArray(arr: highlights)
        }
    }
    @Published var day: Day {
        didSet {
            print("did set day. will update user defaults")
        }
    }
    
    init(_ day: Day) {
        self.day = day
        self.highlights = StorageService.getHighlightArray(forDay: day)
    }
    
    convenience init(_ day: Day, highlights: [Highlight]) {
        self.init(day)
        self.highlights = highlights
    }
    
    // MARK: - Methods
    
    func deleteHighlight(_ offset: IndexSet) {
        print("TODO would try to delete offset: ", offset)
    }
}


struct WeeklyTestView: View {

    let daysOfWeek: [Day] = Date.getCurrentWeek().map({$0.toDay()})
    @State var isFR = true
    
    init() {}
    
    var body: some View {
        VStack {
              HStack {
                ForEach(daysOfWeek) { day in
                    let dayModel = DayViewModel(day)
                    DayView(viewModel: dayModel)
                    Divider().frame(width: 16, height: 0, alignment: .center)
                }
              }
            .frame(height: 100)
        }.frame(width: 2000, height: 300, alignment: .center)
        .cornerRadius(20)
    }
}

struct TestSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyTestView()
    }
}
