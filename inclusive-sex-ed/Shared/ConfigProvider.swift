//
//  ConfigProvider.swift
//  inclusive-sex-ed
//
//  Created by Devon Quispe on 12/6/22.
//

import Foundation
import CoreData
import Combine

struct AppConfig : Codable
{
    let chapters : [chapter]
}

struct chapter : Codable
{
    let img : String
    let title : String
    let color : String
    let articles : [article]
    let w_scalar : String
    let h_scalar : String
}


struct article : Codable
{
    let imgs : [String]
    let text : String
}

protocol LocalConfigLoading
{
    func fetch() -> AppConfig
    func persist(_ config: AppConfig)
}

protocol RemoteConfigLoading
{
    func fetch() -> AnyPublisher<AppConfig, Error>
}

class ConfigProvider : ObservableObject
{
    @Published private (set) var config : AppConfig
    private var cancellable : AnyCancellable?
    private var syncQueue = DispatchQueue(label : "config_queue_\(UUID().uuidString)")
    
    private let localConfigLoader : LocalConfigLoading
    private let remoteConfigLoader : RemoteConfigLoading
    
    init(localConfigLoader : LocalConfigLoading, remoteConfigLoader : RemoteConfigLoading)
    {
        self.localConfigLoader = localConfigLoader
        self.remoteConfigLoader = remoteConfigLoader
        
        config = localConfigLoader.fetch()
    }
    
    func updateConfig()
    {
        syncQueue.sync
        {
            guard self.cancellable == nil else {
                return
            }
            
            self.cancellable = self.remoteConfigLoader.fetch()
                .sink(receiveCompletion: {completion in self.cancellable = nil}, receiveValue: {[weak self] newConfig in self?.config = newConfig
                    self?.localConfigLoader.persist(newConfig)
                })
        }
    }
    
}
