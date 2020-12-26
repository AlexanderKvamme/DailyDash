import SwiftUI
import AppKit


struct DayView: View {

    static let size = NSSize(width: 240, height: 300)
    
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
            // Highlight input
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(akBeige)
                    .padding(16)
                Button("SET A HIGHLIGHT", action: {
                    isInputtingHighlight = true
                })
                    .multilineTextAlignment(.center)
                    .foregroundColor(akBlack)
                    .font(.custom(futuraBold, size: 16))
                    .opacity(0.4)
                .padding(20)
                .buttonStyle(BorderlessButtonStyle())
                // Show textfield over button of isInput
                if isInputtingHighlight {
                    TextField("Input", text: $text, onCommit:  {
                        $viewModel.highlights.wrappedValue.append(Highlight(task: text, day: viewModel.day))
                        isInputtingHighlight = false
                        text = ""
                    })
                    .textCase(.uppercase)
                    .font(.custom(futuraBold, size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(akWhite)
                    .background(akBlack)
                } else {
                    // Make invis
                    TextField("Input", text: $text, onCommit: {
                        $viewModel.highlights.wrappedValue.append(Highlight(task: text, day: viewModel.day))
                        isInputtingHighlight = false
                    })
                    .textCase(.uppercase)
                    .font(.custom(futuraBold, size: 24))
                    .multilineTextAlignment(.center)
                    .opacity(0.2)
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
