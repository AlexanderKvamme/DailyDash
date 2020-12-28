import SwiftUI
import AppKit

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}





struct DayView: View {

    static let size = NSSize(width: 240, height: 340)
    static let MAX_HIGHLIGHTS = 3
    
    @ObservedObject var viewModel: DayViewModel
    @State var text = ""
    @State var isFR = true
    @State var isInputtingHighlight = false
    
    init(viewModel: DayViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            // Name of day
            Text($viewModel.day.wrappedValue.weekdayString())
                .multilineTextAlignment(.center)
                .foregroundColor(akBlack)
                .font(.custom(glamour, size: 32))
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            // List of highlightViews
            // TODO: This wierd if statement should not be needed
            if ($viewModel.highlights.wrappedValue.count > 0) {
                List($viewModel.highlights.wrappedValue) { highlight in
                    ZStack {
                        HighlightView(highlight: highlight)
                    }
                    .frame(width: DayView.size.width-32, height: 40, alignment: .center)
                    .padding(0)
                    .background(Color.clear)
                }
                .padding(0)
                .listStyle(SidebarListStyle())
            }
            // Highlight input "button"
            ZStack {
                let highlightsFull = viewModel.highlights.count >= DayView.MAX_HIGHLIGHTS
                
                if text.isEmpty && highlightsFull {
                    Text("FULL")
                        .font(.custom(futuraBold, size: 24))
                        .foregroundColor(akBlack)
                        .opacity(0.3)
                } else if text.isEmpty {
                    Text("ADD")
                        .font(.custom(futuraBold, size: 24))
                        .foregroundColor(akBlack)
                }
                
                if !highlightsFull {
                    TextField("", text: $text, onCommit:  {
                        if text != "" {
                            StorageService.putHighlightArray(arr: [Highlight(task: text, day: viewModel.day)])
                        }
                        isInputtingHighlight = false
                        text = ""
                    })
                    .textCase(.uppercase)
                    .font(.custom(futuraBold, size: 24))
                    .multilineTextAlignment(.center)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(akBlack)
                }
            }.frame(width: DayView.size.width, height: 80, alignment: .center)
            .padding(0)
        }.frame(width: DayView.size.width, height: DayView.size.height, alignment: .center)
        .background(akWhiter)
        .cornerRadius(20)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        let day = Day.random
        Group {
            DayView(viewModel: DayViewModel(day))
            DayView(viewModel: DayViewModel(day))
        }
    }
}
