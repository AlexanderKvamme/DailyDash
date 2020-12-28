import SwiftUI
import AppKit

struct HighlightView: View {
 
    @State private var highlight: Highlight
    @State private var isHovering = false
    
    init(highlight: Highlight) {
        _highlight = State(initialValue: highlight)
    }
    
    var body: some View {
        HStack() {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(akBeige)
                HStack() {
                    Spacer()
                    Button(action: {
                        StorageService.delete(highlight: highlight)
                    }) {
                        Image(systemName: "xmark.circle.fill").resizable()
                            .font(.largeTitle)
                            .aspectRatio(contentMode: .fit)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .foregroundColor(akBlack)
                    .padding(.trailing, 8)
                    .isVisible(isHovering)
                }
                Text(String(highlight.task))
                    .multilineTextAlignment(.center)
                    .foregroundColor(akBlack)
                    .font(.custom(futuraBold, size: 16))
            }
            .frame(width: DayView.size.width-32, height: 40, alignment: .center)
        } .onHover { isHovering in
            self.isHovering = isHovering
        }
    }
}


struct HighlightView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightView(highlight: Highlight.mock)
    }
}
