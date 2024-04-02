//
//  NotificationsService.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 23.03.2024.
//

import Foundation
import UserNotifications

class NotificationService: ObservableObject {
    static let shared = NotificationService()
    static var allowed: Bool = false
    var settings: UNNotificationSettings?
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
                return
            }
            
            if granted {
                NotificationService.allowed = true
                print("Notifications authorization granted.")
            } else {
                print("Notifications authorization not granted.")
            }
        }
    }
    
    func removeScheduledNotifications() {
        UNUserNotificationCenter.current()
            .removeAllPendingNotificationRequests()
    }
    
    func scheduleNotification(title: String, body: String, time: DateComponents, identifier: String) {
        requestAuthorization()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        let trigger: UNNotificationTrigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}

