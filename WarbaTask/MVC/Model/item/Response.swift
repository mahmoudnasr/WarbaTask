//
//  Response.swift
//  WarbaTask
//
//  Created by Mahmoud Nasr on 3/27/19.
//  Copyright © 2019 Mahmoud Nasr. All rights reserved.
//

import Foundation

import Foundation
struct Article_Base : Codable {
    let status : String?
    let copyright : String?
    let num_results : Int?
    let results : [ArticleResults]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        num_results = try values.decodeIfPresent(Int.self, forKey: .num_results)
        results = try values.decodeIfPresent([ArticleResults].self, forKey: .results)
    }
    
}
struct ArticleResults : Codable {
    let url : String?
    let adx_keywords : String?
    let subsection : String?
    let email_count : Int?
    let count_type : String?
    let column : String?
    let eta_id : Int?
    let section : String?
    let id : Int?
    let asset_id : Int?
    let nytdsection : String?
    let byline : String?
    let type : String?
    let title : String?
    let abstract : String?
    let published_date : String?
    let source : String?
    let updated : String?
   
    let media : [Media]?
    let uri : String?
    
    enum CodingKeys: String, CodingKey {
        
        case url = "url"
        case adx_keywords = "adx_keywords"
        case subsection = "subsection"
        case email_count = "email_count"
        case count_type = "count_type"
        case column = "column"
        case eta_id = "eta_id"
        case section = "section"
        case id = "id"
        case asset_id = "asset_id"
        case nytdsection = "nytdsection"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case published_date = "published_date"
        case source = "source"
        case updated = "updated"
     
        case media = "media"
        case uri = "uri"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        adx_keywords = try values.decodeIfPresent(String.self, forKey: .adx_keywords)
        subsection = try values.decodeIfPresent(String.self, forKey: .subsection)
        email_count = try values.decodeIfPresent(Int.self, forKey: .email_count)
        count_type = try values.decodeIfPresent(String.self, forKey: .count_type)
        column = try values.decodeIfPresent(String.self, forKey: .column)
        eta_id = try values.decodeIfPresent(Int.self, forKey: .eta_id)
        section = try values.decodeIfPresent(String.self, forKey: .section)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        asset_id = try values.decodeIfPresent(Int.self, forKey: .asset_id)
        nytdsection = try values.decodeIfPresent(String.self, forKey: .nytdsection)
        byline = try values.decodeIfPresent(String.self, forKey: .byline)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
        published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        updated = try values.decodeIfPresent(String.self, forKey: .updated)
      
        media = try values.decodeIfPresent([Media].self, forKey: .media)
        uri = try values.decodeIfPresent(String.self, forKey: .uri)
    }
    
}

struct Mediametadata : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        format = try values.decodeIfPresent(String.self, forKey: .format)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
    }
    
}
struct Media : Codable {
    let type : String?
    let subtype : String?
    let caption : String?
    let copyright : String?
    let approved_for_syndication : Int?
    let mediametadata : [Mediametadata]?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approved_for_syndication = "approved_for_syndication"
        case mediametadata = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        approved_for_syndication = try values.decodeIfPresent(Int.self, forKey: .approved_for_syndication)
        mediametadata = try values.decodeIfPresent([Mediametadata].self, forKey: .mediametadata)
    }
    
}
