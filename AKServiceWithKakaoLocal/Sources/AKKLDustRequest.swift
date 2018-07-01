//
//  AKKLDustRequest.swift
//  AKServiceWithKakaoLocal
//
//  Created by Keunhyun Oh on 2018. 7. 1..
//  Copyright © 2018년 Keunhyun Oh. All rights reserved.
//

import Foundation
import CoreLocation
import AKService
import OHKakaoLocalSDK

public func requestDustItemsKL(coordinate2D: CLLocationCoordinate2D,
                               pageNo: Int,
                               numOfRows: Int,
                               msPageNo: Int,
                               msNumOfRows: Int,
                               airKoreaServiceKey: String,
                               kakaoAuthKey: String,
                               completionHandler: @escaping (AKMSDustResultItems?, Array<AKMSDustResult<(tmXDouble: Double, tmYDouble: Double)>>?) -> Void)  {
    
    OHKakaoLocalSDK.requestTransCoordWGS84ToWTM(coordinate2D: coordinate2D, kakaoAuthKey: kakaoAuthKey) {
        
        guard let transResponse = $0.response else {
            return completionHandler(nil, nil)
        }
        
        guard !transResponse.documents.isEmpty else {
            return completionHandler(nil, nil)
        }
        
        AKService.requestDustItems(tmXDouble: transResponse.documents[0].x,
                                   tmYDouble: transResponse.documents[0].y,
                                   pageNo: pageNo,
                                   numOfRows: numOfRows,
                                   msPageNo: msPageNo,
                                   msNumOfRows: msNumOfRows,
                                   serviceKey: airKoreaServiceKey,
                                   completionHandler: completionHandler)
    }
    
}

public func requestDustItemsKL(location: CLLocation,
                               pageNo: Int,
                               numOfRows: Int,
                               msPageNo: Int,
                               msNumOfRows: Int,
                               airKoreaServiceKey: String,
                               kakaoAuthKey: String,
                               completionHandler: @escaping (AKMSDustResultItems?, Array<AKMSDustResult<(tmXDouble: Double, tmYDouble: Double)>>?) -> Void)  {
    
    requestDustItemsKL(coordinate2D: location.coordinate,
                       pageNo: pageNo,
                       numOfRows: numOfRows,
                       msPageNo: msPageNo,
                       msNumOfRows: msNumOfRows,
                       airKoreaServiceKey: airKoreaServiceKey,
                       kakaoAuthKey: kakaoAuthKey,
                       completionHandler: completionHandler)
    
}

public func requestDustItemsKL(placemark: CLPlacemark,
                               pageNo: Int,
                               numOfRows: Int,
                               msPageNo: Int,
                               msNumOfRows: Int,
                               serviceKey: String,
                               kakaoAuthKey: String,
                               completionHandler: @escaping (AKMSDustResultItems?, Array<AKMSDustResult<(tmXDouble: Double, tmYDouble: Double)>>?) -> Void)  {
    
    requestDustItemsKL(location: placemark.location ?? CLLocation(),
                       pageNo: pageNo,
                       numOfRows: numOfRows,
                       msPageNo: msPageNo,
                       msNumOfRows: msNumOfRows,
                       airKoreaServiceKey: serviceKey,
                       kakaoAuthKey: kakaoAuthKey,
                       completionHandler: completionHandler)
    
}

