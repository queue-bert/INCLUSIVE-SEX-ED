//
//  inclusive_sex_edApp.swift
//  Shared
//
//  Created by Devon Quispe on 12/6/22.
//

import SwiftUI

@main
struct inclusive_sex_edApp: App {
    let configProvider = ConfigProvider(localConfigLoader: LocalConfigLoader(), remoteConfigLoader: RemoteConfigLoader())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(configProvider)
                .onAppear(perform: {
                    self.configProvider.updateConfig()
                })
        }
    }
}
