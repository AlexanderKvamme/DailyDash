import SwiftUI
import AppKit

struct HighlightView: View {
 
    @State private var highlight: DailyHighlight
    
    init(highlight: DailyHighlight) {
        _highlight = State(initialValue: highlight)
    }
    
    var body: some View {
        HStack() {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(akBeige)
                    .foregroundColor(Color.red)
                HStack(alignment: .center, spacing: nil, content: {
                    Spacer()
                    Button(action: {
                      print("button pressed - would delete")
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(akBlack)
                            .opacity(0.1)
                            .padding(.trailing, 8)
                    }
                })
                Text(String(highlight.task))
                    .multilineTextAlignment(.center)
                    .foregroundColor(akBlack)
                    .font(.custom(futuraBold, size: 16))
            }
            .frame(width: DayView.size.width-32, height: 40, alignment: .center)
            .padding(0)
        }
    }
}


struct HighlightView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightView(highlight: DailyHighlight.mock)
    }
}
