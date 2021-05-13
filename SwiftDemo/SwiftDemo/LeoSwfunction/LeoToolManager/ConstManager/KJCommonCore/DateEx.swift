//
//  DateEx.swift
//  zgxtapp
//
//  Created by 黄克瑾 on 2020/9/1.
//  Copyright © 2020 zwwl. All rights reserved.
//

import Foundation

extension Date {
    

    /// 星期显示的样式
    enum WeekMode {
        case short      // "一" 或 "M"
        case middle     // "周一" 或 "Mon"
        case full       // "星期一" 或 "Monday"
    }

    /// 星期显示的语言
    enum WeekLanguage {
        case CN     // 中文
        case US     // 英文
    }
    
    /// 是否是今天
    var isToday: Bool { Calendar.current.isDateInToday(self) }

    /// 是否是昨天
    var isYesterday: Bool { Calendar.current.isDateInYesterday(self) }
    
    /// 是否是明天
    var isTomorrow: Bool { Calendar.current.isDateInTomorrow(self) }
    
    /// 年
    var year: Int { Calendar.current.component(.year, from: self) }
    
    /// 月
    var month: Int { Calendar.current.component(.month, from: self) }
    
    /// 日
    var day: Int { Calendar.current.component(.day, from: self) }
    
    /// 时
    var hour: Int { Calendar.current.component(.hour, from: self) }
    
    /// 分
    var minute: Int { Calendar.current.component(.minute, from: self) }
    
    /// 秒
    var seconds: Int { Calendar.current.component(.second, from: self) }
    
    /// 星期 1~7
    var weekDay: Int { Calendar.current.component(.weekday, from: self) }
    
    /// 这月的第几周
    var weekOfMonth: Int { Calendar.current.component(.weekOfMonth, from: self) }
    
    /// 这年的第几周
    var weekOfYear: Int { Calendar.current.component(.weekOfYear, from: self) }
    
    /// 10位时间戳
    var timestamp10: TimeInterval { timeIntervalSince1970 }
    
    /// 13位时间戳
    var timestamp13: TimeInterval { timeIntervalSince1970 * 1000.0 }
    
    /// 星座
    var constellation: String {
        guard month > 0, month <= 12, day > 0, day <= 31 else {
            return ""
        }
        let md = month * 100 + day
        switch md {
        case 321...419:
            return "白羊座"
        case 420...520:
            return "金牛座"
        case 521...621:
            return "双子座"
        case 622...722:
            return "巨蟹座"
        case 723...822:
            return "狮子座"
        case 823...922:
            return "处女座"
        case 923...1023:
            return "天秤座"
        case 1024...1122:
            return "天蝎座"
        case 1123...1221:
            return "射手座"
        case 1222...1231, 101...119:
            return "摩羯座"
        case 120...218:
            return "水瓶座"
        case 219...320:
            return "双鱼座"
        default:
            return ""
        }
    }
    
    /// 星期
    func week(mode: WeekMode = .full,
                 language: WeekLanguage = .CN) -> String {
        var calendar = Calendar(identifier: .chinese)
        switch language {
        case .CN:
            calendar.locale = Locale(identifier: "zh_Hans_CN")
            break
        case .US:
            calendar.locale = Locale(identifier: "en_US")
            break
        }
        switch mode {
        case .short:
            return calendar.veryShortWeekdaySymbols[weekDay - 1]
        case .middle:
            return calendar.shortWeekdaySymbols[weekDay - 1]
        case .full:
            return calendar.weekdaySymbols[weekDay - 1]
        }
    }
    
    /// 这个月共有多少天
    func totalDaysInMonth() -> Int {
        Calendar.current.range(of: .day, in: .month, for: self)?.last ?? 0
    }
    
    /// 这年共有多少天
    func totalDaysYear() -> Int {
        Calendar.current.range(of: .day, in: .year, for: self)?.last ?? 0
    }
    
    /// 农历
    func lunarText() -> (month: String, day: String) {
        let lunarMonths = ["正月","二月","三月","四月","五月","六月","七月","八月","九月","十月","冬月","腊月"]
        let lunarDays = ["初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十","十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十","廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"]
        let localCalendar = Calendar(identifier: .chinese)
        return (lunarMonths[localCalendar.component(.month, from: self) - 1],
                lunarDays[localCalendar.component(.day, from: self) - 1])
    }
    
    /// 获取DateComponents
    /// - Parameter components: 设置从日期中获取的内容
    /// - Returns: DateComponents
    func dateComponents(_ components: Set<Calendar.Component> = [.year, .month, .day, .weekday]) -> DateComponents {
        Calendar.current.dateComponents([.year, .month, .day, .weekday], from: self)
    }
    
    /// 当前日期上加上一个数
    /// - Parameters:
    ///   - value: 可以是负数
    ///   - component: 年月日等等
    /// - Returns: 新日期
    func byAdding(value: Int, component: Calendar.Component) -> Date {
        Calendar.current.date(byAdding: component, value: value, to: self) ?? self
    }
    
    /// 转换成字符串
    /// - Parameters:
    ///   - format: 字符串格式
    ///   - locale: 地区
    ///   - zone: 时区
    /// - Returns: String
    func stringValue(format: String,
                     locale: Locale = Locale.current,
                     zone: TimeZone = TimeZone.current) -> String {
        let dateFormat = DateFormatter()
        dateFormat.locale = locale
        dateFormat.dateFormat = format
        dateFormat.timeZone = zone
        return dateFormat.string(from: self)
    }
    
    /// 两个时间相差的天数 正整数
    func daysDifference(to: Date = Date()) -> Int {
        abs(Calendar.current.dateComponents([.day], from: self, to: to).day ?? 0)
    }
    
    /// 两个时间相差的小时 正整数
    func hoursDifference(to: Date = Date()) -> Int {
        abs(Calendar.current.dateComponents([.hour], from: self, to: to).hour ?? 0)
    }
    
    /// 两个时间相差的分钟 正整数
    func minutesDifference(to: Date = Date()) -> Int {
        abs(Calendar.current.dateComponents([.minute], from: self, to: to).minute ?? 0)
    }
    
    /// 两个时间相差的秒 正整数
    func secondDifference(to: Date = Date()) -> Int {
        abs(Calendar.current.dateComponents([.second], from: self, to: to).second ?? 0)
    }
}
