//
// Wire
// Copyright (C) 2018 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//

import UIKit

// Subclass intended to work around https://stackoverflow.com/questions/25795065/ios-8-uiactivityviewcontroller-and-uialertcontroller-button-text-color-uses-wind
final class TintCorrectedActivityViewController: UIActivityViewController {
    private var windowTintColor: UIColor?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        windowTintColor = UIApplication.shared.delegate?.window??.tintColor
        UIApplication.shared.delegate?.window??.tintColor = .wr_color(fromColorScheme: ColorSchemeColorTextForeground, variant: .light)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.delegate?.window??.tintColor = windowTintColor
    }
}
