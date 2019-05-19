//
//  Books.swift
//  GoogleBooks(MVVM)
//
//  Created by Yusuf DEMİRKOPARAN on 19.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//
//{
//    "items": [
//    {
//    "selfLink": "https://www.googleapis.com/books/v1/volumes/NbE4nkslCPsC",
//    "volumeInfo": {
//    "title": "Guidelines for Working with Children with ASD in Key Stages",
//    "subtitle": "3 And 4",
//    "publisher": "National Autistic Society",
//    "publishedDate": "2005-01-01",
//    "pageCount": 33,
//    "imageLinks": {
//    "smallThumbnail": "http://books.google.com/books/content?id=NbE4nkslCPsC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
//    "thumbnail": "http://books.google.com/books/content?id=NbE4nkslCPsC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
//    },
//
//
//    }
//    }
//    ]
//}

import UIKit

struct BookList : Codable {
    let items : [Items]
}

struct Items : Codable {
    let volumeInfo : VolumeInfo
}

struct VolumeInfo : Codable {
    let title,subtitle,publisher,publishedDate : String?
    let pageCount   : Int?
    let imageLinks : ImageLinks
}

struct ImageLinks : Codable {
    let smallThumbnail : URL
    let thumbnail      : URL
}

