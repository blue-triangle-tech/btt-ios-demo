//
//  TimerConfiguration.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 9/21/21.
//

import Foundation
import BlueTriangleSDK_iOS

struct TimerConfiguration: Equatable {
    var abTestID: String = ""
    var brandValue: Double?
    var campaignMedium: String = ""
    var campaignName: String = ""
    var campaignSource: String = ""
    var cartValue: Double?
    var contentGroupName: String = ""
    var orderNumber: String = ""
    var orderTime: Int?
    var pageName: String = ""
    var pageValue: Double?
    var referrer: String = ""
    var timeOnPage: Int?
    var trafficSegmentName: String = ""
    var url: String = ""
}

// MARK: - BTTimer + TimerConfiguration
extension BTTimer {
    func configure(with configuration: TimerConfiguration) {
        setPageName(configuration.pageName)
        setTrafficSegmentName(configuration.trafficSegmentName)
        setABTestIdentifier(configuration.abTestID)
        setContentGroupName(configuration.contentGroupName)
        if let brandValue = configuration.brandValue {
            setBrandValue(brandValue)
        }
        if let cartValue = configuration.cartValue {
            setCartValue(cartValue)
        }
        setOrderNumber(configuration.orderNumber)
        if let orderTime = configuration.orderTime {
            setOrderTime(orderTime)
        }
        if let pageValue = configuration.pageValue {
            setPageValue(pageValue)
        }
        setCampaignName(configuration.campaignName)
        setCampaignSource(configuration.campaignSource)
        setCampaignMedium(configuration.campaignMedium)
        if let timeOnPage = configuration.timeOnPage {
            setTimeOnPage(timeOnPage)
        }
        setURL(configuration.url)
        setReferrer(configuration.referrer)
    }
}
