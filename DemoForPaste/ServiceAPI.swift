//
//  ServiceAPI.swift
//  DemoForPaste
//
//  Created by Lee Danatech on 2022/7/4.
//

import Alamofire
import Foundation

class ServiceAPI {
    // MARK: - Properties
    static let shared = ServiceAPI()
    let sessionManager: SessionManager

    // MARK: - Init Functions
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        sessionManager = SessionManager(configuration: configuration,
                                        delegate: SessionDelegate(),
                                        serverTrustPolicyManager: nil)
    }

    var defaultHeaders: HTTPHeaders {
        return sessionManager.session.configuration.httpAdditionalHeaders as? HTTPHeaders ?? HTTPHeaders()
    }

    // MARK: - Public Functions
    @discardableResult
    func send(_ request: URL, method: HTTPMethod, completion: @escaping (Swift.Result<Data, Error>) -> Void) -> DataRequest? {
        var reqHeaders = defaultHeaders
        reqHeaders.merge(["client-timezone": TimeZone.current.identifier]) { (_, new) in new }
        return sessionManager.request(request,
                                      method: method,
                                      parameters: nil,
                                      headers: reqHeaders).responseData { response in
            guard let data = response.data else {
                completion(.failure(response.error ?? Alamofire.AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                return
            }
            completion(.success(data))
        }
    }
}

