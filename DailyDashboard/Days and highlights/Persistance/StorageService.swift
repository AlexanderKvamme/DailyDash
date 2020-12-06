import GRDB
import Foundation
import AppKit


final class StorageService {

    // MARK: - Static properties

    private static var dbQueue: DatabaseQueue? = makeDatabase()

    // MARK: - Static methods
    
    /// Highlights are stored as arrays cause there can be multiples for a day (One for each category)
    static func putHighlightArray(arr: [DailyHighlight], for day: Day) {
        print("tryna put highlight")
        let key = makeKey(for: day)
        do {
            try arr.forEach { (highlight) in
                try dbQueue?.write { db in
                    // Replace or insert
                    try db.execute(sql: "INSERT OR IGNORE INTO days (day_key, day, month, year) VALUES (?, ?, ?, ?);", arguments: [key, day.day, day.month, day.year])
                    try db.execute(sql: "INSERT OR IGNORE INTO highlights (id, task, day_key) VALUES (?, ?, ?);", arguments: [highlight.id, highlight.task, key])
                }
            }
        } catch {
            print(error)
        }
    }
    
    // MARK: - Helper methods
    
    private static func makeDatabase() -> DatabaseQueue {
        let dbQueue = try! DatabaseQueue(path: "db.sqlite")
        try! makeSchemas(on: dbQueue)
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
                let rows = try Row.fetchAll(db, sql: "SELECT * FROM highlights")
                rows.forEach({print("highlight: ", $0)})
            }
        } catch {
            print(error)
        }
    }

    static private func makeSchemas(on db: DatabaseQueue) throws {
        do {
            try db.write { db in
                // Make "days" table
                try db.execute(sql: """
                    CREATE TABLE IF NOT EXISTS days (
                    day_key TEXT PRIMARY KEY UNIQUE NOT NULL,
                    day INTEGER NOT NULL,
                    month INTEGER NOT NULL,
                    year INTEGER NOT NULL
                    );
                    """)
                // Make "highlights" table
                try db.execute(sql: """
                    CREATE TABLE IF NOT EXISTS highlights (
                    id TEXT PRIMARY KEY NOT NULL UNIQUE,
                    task TEXT NOT NULL,
                    day_key TEXT NOT NULL,
                    CONSTRAINT fk_days
                        FOREIGN KEY (day_key)
                        REFERENCES days(day_key)
                        ON DELETE CASCADE
                    );
                    """)
            }
        } catch {
            throw NetworkServiceError.testError
        }
    }
    
    static func getHighlightArray(forDay day: Day) -> [DailyHighlight] {
        var highlights = [DailyHighlight]()
        do {
            try dbQueue?.read({ (db) in
                let rows = try Row.fetchAll(db, sql: "SELECT * FROM highlights INNER JOIN days on highlights.day_key=days.day_key WHERE day=? AND month=? AND year=?;", arguments: [day.day, day.month, day.year])
                    rows.forEach { (row) in
                        let task: String = row["task"]
                        let d: Int       = row["day"]
                        let m: Int       = row["month"]
                        let y: Int       = row["year"]
                        let id: String   = row["id"]
                        let highlight = DailyHighlight(task: task, day: Day(day: d, month: m, year: y), id: id)
                        highlights.append(highlight)
                    }
            })
        } catch {
            print(error)
        }

        return highlights
    }
    
    static func delete(highlight: DailyHighlight) {
        do {
            try dbQueue?.write({ (db) in
                print("tryna delete highlight: ", highlight)
                try db.execute(sql: "DELETE FROM highlights WHERE id = (?)", arguments: [highlight.id])
            })
        } catch {
            print("Error:")
        }
    }
    
    static func makeKey(for date: Date) -> String {
        return StorageService.makeKey(for: date.toDay())
    }
    
    // MARK: Helper methods
    
    private static func makeKey(for day: Day) -> String {
        let key = "daily-highlight-\(day.day)-\(day.month)-\(day.year)"
        return key
    }
    
    static func wipe() {
        print("Wiping database...")
        do {
            try dbQueue?.write { db in
                try db.execute(sql: "DROP TABLE days;")
                try db.execute(sql: "DROP TABLE highlights;")
            }
            
            if let db = dbQueue {
                try makeSchemas(on: db)
            }
        } catch {
            print(error)
        }
    }
}
