 //  AppDelegate.swift
 //
 //  Copyright (C) 2018 Kenneth H. Cox
 //
 //  This program is free software; you can redistribute it and/or
 //  modify it under the terms of the GNU General Public License
 //  as published by the Free Software Foundation; either version 2
 //  of the License, or (at your option) any later version.
 //
 //  This program is distributed in the hope that it will be useful,
 //  but WITHOUT ANY WARRANTY; without even the implied warranty of
 //  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 //  GNU General Public License for more details.
 //
 //  You should have received a copy of the GNU General Public License
 //  along with this program; if not, write to the Free Software
 //  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

import Foundation
import UIKit
import CoreText

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        App.theme = AppSettings.makeTheme()
        App.config = AppSettings.makeAppConfiguration()
        App.library = Library(AppSettings.url)
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = UIColor.white
        appearance.barTintColor = App.theme.backgroundDark2
        appearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        if #available(iOS 11.0, *) {
            appearance.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }

        return true
    }
    
}

