import Foundation

struct DailyHighlight: Identifiable, Codable {
    
    static var mock = DailyHighlight(task: "Mock task", day: Day.random)
    var id = UUID()
    var task = "Alexander"
    var day: Day
    
    init(task: String, day: Day) {
        self.task = task
        self.day = day
    }
    
    func encoded() -> Data? {
        let encoded = try? JSONEncoder().encode(self)
        return encoded
    }
    
    static func decoded(from data: Data) -> DailyHighlight? {
        return try? JSONDecoder().decode(DailyHighlight.self, from: data)
    }
}
