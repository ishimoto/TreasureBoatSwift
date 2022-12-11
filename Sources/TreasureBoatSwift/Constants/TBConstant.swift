//
//  TBConstant.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/10.
//

import SwiftUI

public struct TBConstant {
    
    public struct AppStorage {
        
        /** The TreasureBoat ID to connect to the Server to get TB Service */
        public static let TreasureBoatID = "treasureBoatID"
        
        /** The deployed version of the app. This will check on startup, and if there is a new version it will display the `OnBoardingScreen` */
        public static let DeployedVersionNumber = "deployedVersionNumber" // the app version, every new version we show the onboarding again
        
        /** The Apperance of the application. used with `ETBAppearance` */
        public static let AppTheme = "appTheme"
        
        /** This is the current page from the onboarding   */
        public static let CurrentPageForOnBoarding = "currentOnBoardingPage"
        
        /** `true` the bio metrics authentication is ON. `false` the bio metrics authentication is OFF */
        public static let BioMetric = "isEnableBioMetric" // PasswordEnterView : if we use BioMetric or not
        
    }
    
    public struct TBPolicy {
        
        /* Show Server Info on Account Page [true/false] */
        public static let SERVER_INFO = "S2MPolicy.serverInfo"
        
        /* Show Accounting Module [true/false] */
        public static let ACCOUNTING = "S2MPolicy.accounting"
        
        /* Show Barcode Price Scanner [S2MPolicy.scan.price:/wa/BarCodeDirectAction/productInformationFromJQM?bc={barCode}] */
        public static let BARCODE_PRICE_SCANNING = "S2MPolicy.scan.price"
        // AppGWare Test : /wa/sampleBarCodeScan?bc={barCode}
        
    }
    
    public struct Color {
        
        public static let nameForBenzaiten: String = "ColorBenzaiten"
        public static let nameForBenzaitenLight: String = "ColorBenzaitenLight"
        public static let nameForBishamonten: String = "ColorBishamonten"
        public static let nameForBishamontenLight: String = "ColorBishamontenLight"
        public static let nameForBudai: String = "ColorBudai"
        public static let nameForBudaiLight: String = "ColorBudaiLight"
        public static let nameForDaikoku: String = "ColorDaikoku"
        public static let nameForDaikokuLight: String = "ColorDaikokuLight"
        public static let nameForEbisu: String = "ColorEbisu"
        public static let nameForEbisuLight: String = "ColorEbisuLight"
        public static let nameForFukurokuju: String = "ColorFukurokuju"
        public static let nameForFukurokujuLight: String = "ColorFukurokujuLight"
        public static let nameForJurōjin: String = "ColorJurōjin"
        public static let nameForFJurōjinLight: String = "ColorJurōjinLight"
        
    }
    
    public struct Image {
        
        public static let nameForBenzaiten: String = "Benzaiten.jpg"
        public static let nameForBishamonten: String = "Bishamonten.jpg"
        public static let nameForBudai: String = "Budai.jpg"
        public static let nameForEbisu: String = "Ebisu.jpg"
        public static let nameForDaikoku: String = "Daikoku.jpg"
        public static let nameForFukurokuju: String = "Fukurokuju.jpg"
        public static let nameForJurōjin: String = "Jurōjin.jpg"
        
        public static let tbShip: String = "TBShip"
        public static let tbLogo: String = "TBLogo"

    }
    
    public struct HeadImage {
        
        public static let nameForBenzaiten = "Benzaiten44mm"
        public static let nameForBishamonten = "Bishamonten44mm"
        public static let nameForBudai = "Budai44mm"
        public static let nameForDaikoku = "Daikoku44mm"
        public static let nameForEbisu = "Ebisu44mm"
        public static let nameForFukurokuju = "Fukurokuju44mm"
        public static let nameForJurōjin = "Jurōjin44mm"
        
    }
    
    public struct Shadow {
        
        public static let nameForBlackTransparentLight: String = "ColorBlackTransparentLight"
        public static let nameForBlacktransparentDark: String = "ColorBlacktransparentDark"

    }

    public struct AccentColor {
        
        public static let nameForAccentColor: String = "AccentColor"
        
    }

}
