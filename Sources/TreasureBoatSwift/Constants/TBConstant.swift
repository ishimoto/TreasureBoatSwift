//
//  TBConstant.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/10.
//

import SwiftUI

public struct TBConstant {
   
    
    //********************************************************************
    // MARK: - AppStorage
    //********************************************************************

    public struct AppStorage {
        
        /** The TreasureBoat ID to connect to the Server to get TB Service */
        public static let TreasureBoatID = "treasureBoatID"
        
        /** 
            The deployed version of the app.
            This will check on startup, and if there is a new version it will display the `OnBoardingScreen`
         */
        public static let DeployedVersionNumber = "deployedVersionNumber"
        
        /**
            The inro screen version of the app.
            This will check on startup, and if there is a new intro version it will display the `TBIntroScreen`
         */
        public static let IntroVersionNumber = "introVersionNumber"
        
        /** The Apperance of the application. used with `ETBAppearance` */
        public static let AppTheme = "appTheme"
        
        /** This is the current page from the onboarding   */
        public static let CurrentPageForOnBoarding = "currentOnBoardingPage"
        
        /** `true` the bio metrics authentication is ON. `false` the bio metrics authentication is OFF */
        public static let BioMetric = "isEnableBioMetric" // PasswordEnterView : if we use BioMetric or not
        
    }
    
    //********************************************************************
    // MARK: - Keychain
    //********************************************************************

    public struct Keychain {
        
        /** The Key where the profile get saved into the keychain */
        public static let ProfileKey = "profile"

    }

    //********************************************************************
    // MARK: - TBPolicy
    //********************************************************************

    public struct TBPolicy {
        
        /* Show Server Info on Account Page [true/false] */
        public static let SERVER_INFO = "S2MPolicy.serverInfo"
        
        /* Show Accounting Module [true/false] */
        public static let ACCOUNTING = "S2MPolicy.accounting"
        
        /* Show Barcode Price Scanner [S2MPolicy.scan.price:/wa/BarCodeDirectAction/productInformationFromJQM?bc={barCode}] */
        public static let BARCODE_PRICE_SCANNING = "S2MPolicy.scan.price"
        // AppGWare Test : /wa/sampleBarCodeScan?bc={barCode}
        
    }
    
    //********************************************************************
    // MARK: - SharedID
    //********************************************************************

    public struct SharedID {
        
        // This ID is used when not a correct user ID is setup. so getting shared Videos to watch
        public static let SharedTreasureBoatID = "576c2221-01dd-4079-ae54-4e7a084f0551"
        
    }
   
    //********************************************************************
    // MARK: - Color
    //********************************************************************

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

    //********************************************************************
    // MARK: - Image
    //********************************************************************

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

    //********************************************************************
    // MARK: - HeadImage
    //********************************************************************

    public struct HeadImage {
        
        public static let nameForBenzaiten = "Benzaiten44mm"
        public static let nameForBishamonten = "Bishamonten44mm"
        public static let nameForBudai = "Budai44mm"
        public static let nameForDaikoku = "Daikoku44mm"
        public static let nameForEbisu = "Ebisu44mm"
        public static let nameForFukurokuju = "Fukurokuju44mm"
        public static let nameForJurōjin = "Jurōjin44mm"
        
    }
    
    //********************************************************************
    // MARK: - Shadow
    //********************************************************************

    public struct Shadow {
        
        public static let nameForBlackTransparentLight: String = "ColorBlackTransparentLight"
        public static let nameForBlacktransparentDark: String = "ColorBlacktransparentDark"

    }

    //********************************************************************
    // MARK: - AccentColor
    //********************************************************************

    public struct AccentColor {
        
        public static let nameForAccentColor: String = "AccentColor"
        
    }

    //********************************************************************
    // MARK: - Server
    //********************************************************************

    public struct Server {
        
        public struct Host {
            public static let treasureBoat: String = "www.treasureboat.org"
            // serverConnect has it's own Host information
        }
        
        public struct Path {
            public static let GWare: String = "/TB/GWare"

            public static let serverConnectVersion1: String = "/s2m/v1"
            public static let serverConnectVersion2: String = "/s2m/v2"
            public static let serverConnectVersion3: String = "/s2m/v3"
            public static let serverConnectVersion4: String = "/s2m/v4"
            public static let serverConnectVersion5: String = "/s2m/v5"
            
            public static let version1: String = GWare + serverConnectVersion1
            public static let version2: String = GWare + serverConnectVersion2
            public static let version3: String = GWare + serverConnectVersion3
            public static let version4: String = GWare + serverConnectVersion4
            public static let version5: String = GWare + serverConnectVersion5
        }
        
        public struct ExternalPages {
            public static let creditsURL = "https://www.treasureboat.org/TB/GWare/cms/fist_Credits"
            public static let licenseAgreementURL = "https://www.treasureboat.org/TB/GWare/cms/fist_LicenseAgreement"
            public static let privacyPolicyURL = "https://www.treasureboat.org/TB/GWare/cms/fist_PrivacyPolicy"
        }
        
    }

    //********************************************************************
    // MARK: - Log
    //********************************************************************
    
    public struct Log {
        public static let loggerApplicationName: String = "TB To Go"
        public static let loggerDesktopApplicationName: String = "TB Desktop"
        public static let loggerTBConnect: String = "TBConnect"
    }

    //********************************************************************
    // MARK: - QR Code
    //********************************************************************
    
    public struct QRCode {
        
        // treasureboat://quicksetup/{OneTimeUUID}/gtbt
        public struct QuickSetup {
            public static let prefix: String = "treasureboat://quicksetup/"
            public static let suffix: String = "/gtbt"
        }
        
        public struct MobileLoginFirstContact {
            public static let prefix: String = "treasureboat://tbtg/"
            public static let suffix: String = "/gtbt"
        }
        
        public struct TwoFactor {
            public static let prefix1: String = "otpauth://totp/"
            public static let prefix2: String = "otpauth://hotp/"
            public static let MockData: String = "otpauth://totp/Test?secret=2fafa"
        }
        
    }

}
