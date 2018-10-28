//
//  Movies.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 22/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift


class PopularMovie : Object {
    
    @objc dynamic var voteCount : Int = 0
    @objc dynamic var identifier : Int64 = 0
    @objc dynamic var video : Bool = false
    @objc dynamic var voteAverage : Double = 0
    @objc dynamic var title : String?
    @objc dynamic var popularity : Double = 0
    @objc dynamic var posterPath : String?
    @objc dynamic var originalLanguage : String?
    @objc dynamic var originalTitle : String?
    var genreIdsList: List<Int> = List<Int>()
    @objc dynamic var backdropPath : String?
    @objc dynamic var adult : Bool = false
    @objc dynamic var overview : String?
    @objc dynamic var releaseDate : String?
    
    override public static func primaryKey() -> String? {
        return "identifier"
    }
    
    public static func with(realm: Realm, json: JSON) -> PopularMovie? {
        let identifier = json["id"].int64Value
        if identifier == 0 {
            return nil
        }
        var obj = realm.object(ofType: PopularMovie.self, forPrimaryKey: identifier)
        if obj == nil {
            obj = PopularMovie()
            obj?.identifier = identifier
        } else {
            obj = PopularMovie(value: obj!)
        }
        
        if json["vote_count"].exists() {
            obj?.voteCount = json["vote_count"].intValue
        }
        
        if json["video"].exists() {
            obj?.video = json["video"].boolValue
        }
        
        if json["vote_average"].exists() {
            obj?.voteAverage = json["vote_average"].doubleValue
        }
        
        if json["title"].exists() {
            obj?.title = json["title"].string
        }
        
        if json["popularity"].exists() {
            obj?.popularity = json["popularity"].doubleValue
        }
        
        if json["poster_path"].exists() {
            obj?.posterPath = json["poster_path"].string
        }
        
        if json["original_language"].exists() {
            obj?.originalLanguage = json["original_language"].string
        }
        
        if json["original_title"].exists() {
            obj?.originalTitle = json["original_title"].string
        }
        
        if json["genre_ids"].exists() {
            obj?.genreIdsList.removeAll()
            for itemJson in json["genre_ids"].arrayValue {
                let item = itemJson.intValue
                obj?.genreIdsList.append(item)
            }
        }
        
        if json["backdrop_path"].exists() {
            obj?.backdropPath = json["backdrop_path"].string
        }
        
        if json["adult"].exists() {
            obj?.adult = json["adult"].boolValue
        }
        
        if json["overview"].exists() {
            obj?.overview = json["overview"].string
        }
        
        if json["release_date"].exists() {
            obj?.releaseDate = json["release_date"].string
        }
        
        return obj
    }
    
    public static func with(json: JSON) -> PopularMovie? {
        return with(realm: try! Realm(), json: json)
    }
    
}
