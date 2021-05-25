//
//  EmptyPage
//
//  Copyright (c) 2018 linhey - https://github.com/linhay
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

import UIKit

public final class EmptyPageConfiguration {

    public static let shared = EmptyPageConfiguration()

    private init() {}

    // Global `EmptyPageViewManager` for UIView.
    public private(set) var viewGloalManager: EmptyPageViewManager?
    // Global `EmptyPageScrollViewManager` for UIScrollView
    public private(set) var scrollViewGloalManager: EmptyPageScrollViewManager?
    // Global `EmptyPageTableViewManager` for UITableView
    public private(set) var tableViewGloalManager: EmptyPageTableViewManager?
    // Global `EmptyPageCollectionViewManager` for UICollectionView
    public private(set) var collectionViewGloalManager: EmptyPageCollectionViewManager?

}

public extension EmptyPageConfiguration {

    /// Set the global `EmptyPageViewManager` for the UIView.
    func setGloalManager(view provider: EmptyPageViewManager?) {
        viewGloalManager = provider
    }

    /// Set the global `EmptyPageScrollViewManager` for the UIScrollView.
    func setGloalManager(scrollView provider: EmptyPageScrollViewManager?) {
        scrollViewGloalManager = provider
    }

    /// Set the global `EmptyPageTableViewManager` for the UIScrollView.
    func setGloalManager(tableView provider: EmptyPageTableViewManager?) {
        tableViewGloalManager = provider
    }

    /// Set the global `EmptyPageCollectionViewManager` for the UICollectionView.
    func setGloalManager(collectionView provider: EmptyPageCollectionViewManager?) {
        collectionViewGloalManager = provider
    }

}