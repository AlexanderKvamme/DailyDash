import SwiftUI
import AppKit
import Introspect

class DayViewModel: ObservableObject {

    @Published var highlights: [DailyHighlight] {
        didSet {
            StorageService.putHighlightArray(arr: highlights, for: day)
        }
    }
    @Published var day: Day {
        didSet {
            print("did set day. will update user defaults")
        }
    }
    
    init(_ day: Day) {
        self.day = day
//        StorageService.wipe()
        self.highlights = StorageService.getHighlightArray(forDay: day)
    }
    
    convenience init(_ day: Day, highlights: [DailyHighlight]) {
        self.init(day)
        self.highlights = highlights
    }
    
    // MARK: - Methods
    
    func deleteHighlight(_ offset: IndexSet) {
        print("bam would try to delete offset: ", offset)
    }
}


struct WeeklyTestView: View {

    let daysOfWeek: [Day] = Date.getCurrentWeek().map({$0.toDay()})
    @State var isFR = true
    
    init() {
        printKeys()
    }
    
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
            .background(Color.red)
        }.frame(width: 2000, height: 300, alignment: .center)
        .background(Color.yellow)
        .cornerRadius(20)
    }
    
    // MARK: - Methods
    
    private func printKeys() {
        for key in Array(UserDefaults.standard.dictionaryRepresentation().keys) {
            if key.contains("daily-highlight") {
                print("dhl key found: ", key) // UserDefaults.standard.removeObject(forKey: key)
            }
        }
    }
}

struct TestSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyTestView()
    }
}
