//
//  EGV.swift
//  ReportCharts
//
//  Created by Youssef Ghattas on 22/08/2023.
//

import Foundation

struct EGV: Identifiable {
    var id: UUID
    var time: Date
    var value: Int
}


let steady120: [Int] = [
    180,
    146,
    146,
    147,
    147,
    147,
    154,
    162,
    172,
    185,
    183,
    190,
    197,
    208,
    216,
    225,
    234,
    241,
    246,
    250,
    249,
    248,
    249,
    247,
    246,
    245,
    244,
    243,
    243,
    243,
    242,
    242,
    241,
    242,
    244,
    242,
    243,
    243,
    243,
    241,
    239,
    237,
    236,
    234,
    232,
    230,
    229,
    228,
    227,
    225,
    223,
    221,
    220,
    218,
    215,
    211,
    205,
    197,
    190,
    185,
    181,
    175,
    168,
    162,
    156,
    151,
    147,
    142,
    136,
    130,
    126,
    123,
    119,
    114,
    108,
    103,
    99,
    97,
    98,
    101,
    106,
    112,
    121,
    129,
    136,
    140,
    144,
    147,
    153,
    157,
    162,
    166,
    170,
    174,
    200,
    198,
    190,
    188,
    189,
    200,
    201,
    202,
    204,
    206,
    208,
    204,
    202,
    200,
    197,
    194,
    193,
    192,
    190,
    195,
    195,
    196,
    198,
    202,
    207,
    210,
    213,
    216,
    222,
    227,
    230,
    233,
    231,
    227,
    222,
    219,
    220,
    223,
    222,
    218,
    213,
    209,
    208,
    208,
    209,
    212,
    216,
    219,
    217,
    214,
    213,
    217,
    221,
    226,
    228,
    226,
    226,
    222,
    218,
    209,
    201,
    193,
    185,
    176,
    168,
    161,
    153,
    143,
    132,
    121,
    123,
    122,
    122,
    123,
    124,
    124,
    123,
    121,
    119,
    116,
    114,
    114,
    117,
    122,
    126,
    123,
    119,
    114,
    108,
    103,
    99,
    97,
    98,
    101,
    106,
    112,
    121,
    129,
    136,
    140,
    144,
    147,
    153,
    157,
    162,
    156,
    151,
    147,
    142,
    136,
    130,
    126,
    123,
    119,
    114,
    108,
    103,
    99,
    97,
    98,
    101,
    106,
    112,
    121,
    119,
    118,
    118,
    117,
    117,
    116,
    116,
    115,
    116,
    117,
    118,
    116,
    115,
    114,
    114,
    114,
    115,
    115,
    116,
    116,
    117,
    117,
    117,
    117,
    118,
    118,
    116,
    115,
    115,
    115,
    114,
    114,
    115,
    116,
    116,
    117,
    117,
    118,
    118,
    119,
    119,
    120,
    120,
    121,
    120,
    119,
    119,
    118,
    118,
    117,
    117,
    118,
    118,
    119,
    119,
    120,
    119,
    117,
    117,
    116,
    115,
    115,
    116,
    116,
    117,
    117,
    118,
    118,
    119,
    120,
    120,
    120
]
