//
//  RemoteConfigLoader.swift
//  inclusive-sex-ed
//
//  Created by Devon Quispe on 12/6/22.
//

import Foundation
import Combine

class RemoteConfigLoader: RemoteConfigLoading {
  func fetch() -> AnyPublisher<AppConfig, Error> {
    let configUrl = URL(string: "https://amplify-atlasiosfall22-dev-161515-deployment.s3.us-west-2.amazonaws.com/public/config.json")!

    return URLSession.shared.dataTaskPublisher(for: configUrl)
      .map(\.data)
      .decode(type: AppConfig.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}
