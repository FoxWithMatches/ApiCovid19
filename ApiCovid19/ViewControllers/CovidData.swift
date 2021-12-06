//
//  CovidData.swift
//  ApiCovid19
//
//  Created by Alisa Ts on 06.12.2021.
//

struct Covid: Decodable {
    let rawData: [RawData]
}

struct RawData: Decodable {
    let Country_Region: String?
    let Last_Update: String?
    let Confirmed: String?
    let Deaths: String?
}

enum Link: String {
    case covid = "https://coronavirus.m.pipedream.net/"
}
