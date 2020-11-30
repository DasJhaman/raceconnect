//
//  AllExtensions.swift
//  RaceConnect
//
//  Created by Ali Sher on 26/11/2020.
//

import Foundation

extension UIApplication {
var statusBarUIView: UIView? {

    if #available(iOS 13.0, *) {
        let tag = 3848245

        let keyWindow = UIApplication.shared.connectedScenes
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows.first

        if let statusBar = keyWindow?.viewWithTag(tag) {
            return statusBar
        } else {
            let height = keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
            let statusBarView = UIView(frame: height)
            statusBarView.tag = tag
            statusBarView.layer.zPosition = 999999

            keyWindow?.addSubview(statusBarView)
            return statusBarView
        }

    } else {

        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
    }
    return nil
  }
}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UIView {
    
    func roundCornersWithLayerMask(cornerRadii: CGFloat, corners: UIRectCorner) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}



extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)

        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }

}

extension NSMutableAttributedString {

    func setUnderLineText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: range)
    }

}


extension NSMutableAttributedString {

    public func setAsLink(textToFind:String, linkURL:String) -> Bool {

        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}


extension Date {

    func offsetFrom(date: Date) -> String {

        let dayHourMinuteSecond: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: date, to: self)

        let seconds = difference.second ?? 0
        let sec_str = seconds == 1 ? "\(seconds) second ago" : "\(seconds) seconds ago"
        
        let minutes = difference.minute ?? 0
        let min_str = minutes == 1 ? "\(minutes) mint ago" : "\(minutes) mints ago"
        
        let hours = difference.hour ?? 0
        let hour_str = hours == 1 ? "\(hours) hour ago" : "\(hours) hours ago"
        
        let days = difference.day ?? 0
        let day_str = days == 1 ? "\(days) day ago" : "\(days) days ago"
        
        let months = difference.month ?? 0
        let month_str = months == 1 ? "\(months) month ago" : "\(months) months ago"
        
        let years = difference.year ?? 0
        let year_str = years == 1 ? "\(years) year ago" : "\(years) years ago"
        
        if let year = difference.year, year       > 0 { return year_str }
        if let month = difference.month, month    > 0 { return month_str }
        if let day = difference.day, day          > 0 { return day_str }
        if let hour = difference.hour, hour       > 0 { return hour_str }
        if let minute = difference.minute, minute > 0 { return min_str }
        if let second = difference.second, second > 0 { return sec_str }
        return ""
    }

}
extension UITextField {
    
    func setTextField() {
        let attributeString = [
            NSAttributedString.Key.foregroundColor: GlobalVariables.LightGrayColor,
            NSAttributedString.Key.font: self.font!
            ] as [NSAttributedString.Key : Any]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
        self.textColor = GlobalVariables.DarkGrayColor
    }
    
    
    func setDarkTextField() {
        let attributeString = [
            NSAttributedString.Key.foregroundColor: GlobalVariables.LightGrayColor,
            NSAttributedString.Key.font: self.font!
            ] as [NSAttributedString.Key : Any]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
        self.textColor = .white
    }
    
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
    
}

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.5)
        
        var x = self.view.frame.size.width/2
        x -= 50
        
        var y = self.view.frame.size.height/2
        y -= 50
        
        
        
        let spinnerView1 = UIView.init(frame: CGRect(x: x, y: y, width: 100, height: 100))
        spinnerView1.backgroundColor = .black
        spinnerView1.layer.cornerRadius = 16
        
        
        
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.frame = CGRect(x: 25, y: 16, width: 50, height: 50)
        spinnerView1.addSubview(ai)
        
        let textLabel = UILabel.init(frame: CGRect(x: 5, y: 60, width: 90, height: 40))
        textLabel.backgroundColor = .clear
        textLabel.textColor = .white
        spinnerView1.layer.cornerRadius = 16
        textLabel.text = "Please Wait"
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 2
        textLabel.font = UIFont.boldSystemFont(ofSize: 13)
        spinnerView1.addSubview(textLabel)
        
        DispatchQueue.main.async {
            spinnerView.addSubview(spinnerView1)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
