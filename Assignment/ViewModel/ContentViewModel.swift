//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation

class ContentViewModel : ObservableObject {
    private let apiService = ApiService()
    @Published var navigateDetail: DeviceData? = nil
    @Published var data: [DeviceData]? = []
    @Published var isConnected: Bool = true
    typealias JSONDictionary = [String : Any]

    func fetchAPI() {
        apiService.fetchDeviceDetails(completion: { item in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.data = item
                if let encoded = try? JSONEncoder().encode(item) {
                    saveData(data: encoded)
                }
            }
        })
    }
    
    func navigateToDetail(navigateDetail: DeviceData) {
        self.navigateDetail = navigateDetail
    }
    
    func isNetworkAvailable() {
        isConnected = InternetService.shared.isConnected
        if !isConnected {
            getData()
        }
    }
    
    func saveData(data: Data) {
        UserDefaults.standard.setValue(data, forKey: "offlineDeviceData")
    }
    
    func getData() {
        if let data = UserDefaults.standard.data(forKey: "offlineDeviceData") {
            if let decoded = try? JSONDecoder().decode([DeviceData].self, from: data) {
                self.data = decoded
            }
        }
    }
}
