//
//  ProtocolSendMessage.swift
//  ProtocolAndDelegate
//
//  Created by FordToni on 2/13/22.
//

import Foundation

protocol SendMessageDelegate {
    func sendMessage(message : String)
}

protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName : String)
    func setWelcomeText(welcomeText : String)
}
