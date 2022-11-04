//
//  Database.swift
//  WatherParis5
//
//  Created by juanfu on 25/10/22.
//

import Foundation
import RealmSwift


class DatabaseManager {
    static let shared = DatabaseManager()
    private var databaseClient = DataBase()
    
    private init() {}
    
    func persistInDatabase(model: ResponseObject, callback: @escaping (Errors?) -> Void) {
        do {
            try databaseClient.realm?.write {
                if let allObjects = databaseClient.realm?.objects(ResponseObject.self) {
                    databaseClient.realm?.delete(allObjects)
                }
            }
            try databaseClient.realm?.write {
                databaseClient.realm?.add(model)
            }
            callback(nil)
        } catch {
            callback(Errors.databasePersist)
        }
    }
    
    func getData() -> ResponseObject? {
        let results = databaseClient.realm?.objects(ResponseObject.self)
        return results?.first?.freeze()
    }
    
    private struct DataBase {
        var realm: Realm? {
            do {
                let realm = try Realm()
                return realm
            } catch {
                print(error)
                return nil
            }
        }
        
        init()  {
            setupRealm(databaseName: "dbWeahterParis5")
        }
        
        private func setupRealm(databaseName: String) {
            var config = Realm.Configuration(schemaVersion: 2, migrationBlock: migrateIfNeeded)
            if let fileURL = config.fileURL {
                config.fileURL = fileURL.deletingLastPathComponent().appendingPathComponent("\(databaseName).realm")
                Realm.Configuration.defaultConfiguration = config
            }
        }

        private func migrateIfNeeded(migration: Migration, oldSchemaVersion: UInt64) {}
    }
}


