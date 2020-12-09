//
//  SmartPhoneResourceAccessor.swift
//  ComponentsDemo
//
//  Created by CodeCat15 on 5/28/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

/*Hey there, thank you for downloading the code, if you have any questions regarding the code or query string in general, please feel free to ask question regarding the same. I will be happy to help.

 Please do like the video and share it with your iOS group and do subscribe to the channel ~CodeCat15

 */

extension Encodable
{
    func convertToURLQueryItems() -> [URLQueryItem]?
    {
        do {
            let encoder = try JSONEncoder().encode(self)
            let requestDictionary = (try? JSONSerialization.jsonObject(with: encoder, options: .allowFragments)).flatMap{$0 as? [String: Any?]}

            if(requestDictionary != nil)
            {
                var queryItems: [URLQueryItem] = []

                requestDictionary?.forEach({ (key, value) in

                    if(value != nil)
                    {
                        let strValue = value as? String
                        if(strValue != nil && strValue?.count != 0)
                        {
                            queryItems.append(URLQueryItem(name: key, value: strValue))
                        }
                    }
                })

                return queryItems
            }


        } catch let error {
            debugPrint(error)
        }

        return nil
    }
}

struct SmartPhoneResourceAccessor
{
    private let httpUtility = HttpUtility()

    func getSmartPhones(request: SmartPhoneRequest, completionHandler: @escaping(_ result: PhoneResponse?) -> Void)
    {
        let smartPhoneEndpoint = URL(string: "\(Endpoints.baseUrl)\(Endpoints.smartPhonePath)")!

        var components = URLComponents(url: smartPhoneEndpoint, resolvingAgainstBaseURL: false)
        components?.queryItems = request.convertToURLQueryItems()

        httpUtility.getApiData(requestUrl: (components?.url!)!, resultType: PhoneResponse.self) { (response) in

            _ = completionHandler(response)
        }
    }
}

func createPercentageEncodedString(from value: String) -> String?
{
    return value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
}
