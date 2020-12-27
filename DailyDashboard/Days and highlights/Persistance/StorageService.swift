import GRDB
import Foundation
import AppKit
import Combine

fileprivate let idColumn = Column("id")
fileprivate let taskColumn = Column("task")
fileprivate let dayKeyColumn = Column("daykey")

final class StorageService {

    // MARK: - Static properties

    private static var dbQueue: DatabaseQueue? = makeDatabase()

    // MARK: - Static methods
    
    static private func makeSchemas(on db: DatabaseQueue) throws {
        do {
            try db.write { db in
                // Create "days" table
                // TODO: Possibly remove 
                if try db.tableExists("days") == false {
                    try db.create(table: "days") { t in
                        t.column("id", .integer).notNull().unique()
                        t.column("key", .text).primaryKey().notNull().unique()
                        t.column("day", .integer).notNull()
                        t.column("month", .integer).notNull()
                        t.column("year", .integer).notNull()
                    }
                }
                
                // Create "highlights" table
                if try db.tableExists("highlights") == false {
                    try db.create(table: "highlights") { t in
                        t.column("id", .text).primaryKey().notNull().unique()
                        t.column("dayKey", .text).notNull()
                        t.column("task", .text).notNull()
                    }
                }
            }
        } catch {
            throw error
        }
    }
    
    /// Highlights are stored as arrays cause there can be multiples for a day (One for each category)
    static func putHighlightArray(arr: [Highlight]) {
        do {
            try dbQueue?.write { db in
                try arr.forEach {
                    if try !$0.exists(db) { try $0.insert(db) }
                }
            }
        } catch {
            print(error)
        }
    }
    
    // MARK: - Helper methods
    
    private static func makeDatabase() -> DatabaseQueue {
        let dbQueue = try! DatabaseQueue(path: "db.sqlite")
        do {
            try makeSchemas(on: dbQueue)
        } catch {
            print("Error creating database: ", error)
        }
        
        return dbQueue
    }
    
    static func dump() {
        do {
            print("DAYS TABLE:")
            try dbQueue?.read { db in
                let rows = try Row.fetchAll(db, sql: "SELECT * FROM days")
                rows.forEach({print("row: ", $0)})
            }
            
            print("HIGHLIGHTS TABLE:")
            try dbQueue?.read { db in
                try Highlight.fetchAll(db).forEach({ print($0) })
            }
        } catch {
            print(error)
        }
    }
    
    static func getHighlightArray(forDay day: Day) -> [Highlight] {
        var highlights = [Highlight]()
        do {
            try dbQueue?.read({ (db) in
                highlights = try Highlight.filter(dayKeyColumn == day.key).fetchAll(db)
            })
        } catch {
            print(error)
        }

        return highlights
    }
    
    static func delete(highlight: Highlight) {
        do {
            try dbQueue?.write({ (db) in
                // FIXME: Hvorfor blir ikke observeren trigget når jeg sletter en highlight så her
                try highlight.delete(db)
            })
        } catch {
            print("Error:")
        }
    }
    
    // MARK: - Publishers
    
    static func highlightsForDayPublisher(day: Day) -> AnyPublisher<[Highlight], Error> {
        let highlightsForDayRequest = Highlight
            .all()
            .filter(dayKeyColumn == day.key)
            .fetchAll
        return ValueObservation
            .tracking(highlightsForDayRequest)
            .publisher(in: StorageService.dbQueue!)
            .eraseToAnyPublisher()
    }
    
    static func makeKey(for date: Date) -> String {
        return date.toDay().toKey()
    }
    
    // MARK: Helper methods
    
    static func wipe() {
        print("Wiping database...")
        do {
            try dbQueue?.write { db in
                try db.drop(table: "days")
                try db.drop(table: "highlights")
            }
            
            if let db = dbQueue {
                try makeSchemas(on: db)
            }
        } catch {
            print(error)
        }
    }
}
