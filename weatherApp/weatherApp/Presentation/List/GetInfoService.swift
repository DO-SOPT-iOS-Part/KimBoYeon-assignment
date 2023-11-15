//
//  GetInfoService.swift
//  weatherApp
//
//  Created by 김보연 on 11/14/23.
//

import Foundation

class GetInfoService {
    static let shared = GetInfoService()
    private init() {}
    
    func makeRequest(name: String) -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL)as? String ?? ""
        let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKey)as? String ?? ""
        let url = URL(string: "https://" + baseURL + "/data/2.5/weather?q=\(name)&appid=" + apiKey + "&units=metric")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func PostRegisterData(name: String) async throws -> WeatherInfoDataModel {
        do {
            let request = self.makeRequest(name: name)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            guard let parseData = parseUserInfoData(data: data)
            else {
                throw NetworkError.responseDecodingError
            }
            return parseData
        } catch {
            throw error
        }
        
    }
    
    private func parseUserInfoData(data: Data) -> WeatherInfoDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(WeatherInfoDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
