import Foundation
import SwiftUI

struct DateView: View {

    static let size = NSSize(width: 240, height: 300)
    
    var day: Day!
    
    init(day: Day) {
        self.day = day
    }
    
    var body: some View {
        
        Text(day.toString())
            .multilineTextAlignment(.center)
            .foregroundColor(akBlack)
            .font(.custom(glamour, size: 32))
            .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(day: Day.random)
    }
}

