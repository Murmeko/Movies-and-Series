//
//  MainBasePageProviderProtocol.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 25.06.2022.
//

import Foundation

enum PageType {
  case first, next
}

protocol MainBasePageProviderProtocol {
  func requestPage(for pageType: PageType)
}
