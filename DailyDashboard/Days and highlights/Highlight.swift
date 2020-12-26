import Foundation
import GRDB

struct Highlight: Identifiable, Codable, PersistableRecord, FetchableRecord {
    
    static var databaseTableName: String { "highlights" }
    
    var id: String
    var task = "Empty task"
    var dayKey: String
    var day: Day {
        let comp = Day.from(key: self.dayKey)!
        print("computing day: ", comp)
        return comp
    }
    
    static var mock = Highlight(task: "Mock task", day: Day.random)
    
    init(task: String, day: Day, id: String = UUID().uuidString) {
        self.id = id
        self.task = task
        self.dayKey = day.toKey()
    }
    
    // These properties will be used when coding
    enum CodingKeys: String, CodingKey {
        case id
        case task
        case dayKey
    }
    
    func encoded() -> Data? {
        let encoded = try? JSONEncoder().encode(self)
        return encoded
    }
    
    static func decoded(from data: Data) -> Highlight? {
        return try? JSONDecoder().decode(Highlight.self, from: data)
    }
}
