//
//  File.swift
//  
//
//  Created by Ken Ishimoto on 2023/11/18.
//

import SwiftUI

public extension Color {
    
#if os(tvOS) || os(iOS) || os(macOS)

    // MARK: - AccentColor

    static let tbAccentColor: Color = Color(assetName: TBConstant.AccentColor.nameForAccentColor)

    // MARK: - Shadow
    
    static let lightShadow = Color(red: 255/255, green: 255/255, blue: 255/255)
    static let darkShadow = Color(red: 163/255, green: 177/255, blue: 198/255)
    
    static let blackTransparentLight: Color = Color(assetName: TBConstant.Shadow.nameForBlackTransparentLight)
    static let blacktransparentDark: Color = Color(assetName: TBConstant.Shadow.nameForBlacktransparentDark)
    
    // MARK: - TB Colors

    static let daikoku: Color = Color(assetName: TBConstant.Color.nameForDaikoku)
    static let daikokuLight: Color = Color(assetName: TBConstant.Color.nameForDaikokuLight)
    static let daikokuTextColor: Color = daikoku.suitingTextColor()
    static let daikokuGradient: [Color] = [daikokuLight, daikoku]

    static let ebisu: Color = Color(assetName: TBConstant.Color.nameForEbisu)
    static let ebisuLight: Color = Color(assetName: TBConstant.Color.nameForEbisuLight)
    static let ebisuTextColor: Color = ebisu.suitingTextColor()
    static let ebisuGradient: [Color] = [ebisuLight, ebisu]

    static let bishamonten: Color = Color(assetName: TBConstant.Color.nameForBishamonten)
    static let bishamontenLight: Color = Color(assetName: TBConstant.Color.nameForBishamontenLight)
    static let bishamontenTextColor: Color = bishamonten.suitingTextColor()
    static let bishamontenGradient: [Color] = [bishamontenLight, bishamonten]

    static let benzaiten: Color = Color(assetName: TBConstant.Color.nameForBenzaiten)
    static let benzaitenLight: Color = Color(assetName: TBConstant.Color.nameForBenzaitenLight)
    static let benzaitenTextColor: Color = benzaiten.suitingTextColor()
    static let benzaitenGradient: [Color] = [benzaitenLight, benzaiten] 

    static let fukurokuju: Color = Color(assetName: TBConstant.Color.nameForFukurokuju)
    static let fukurokujuLight: Color = Color(assetName: TBConstant.Color.nameForFukurokujuLight)
    static let fukurokujuTextColor: Color = fukurokuju.suitingTextColor()
    static let fukurokujuGradient: [Color] = [fukurokujuLight, fukurokuju]

    static let jurōjin: Color = Color(assetName: TBConstant.Color.nameForJurōjin)
    static let jurōjinLight: Color = Color(assetName: TBConstant.Color.nameForFJurōjinLight)
    static let jurōjinTextColor: Color = jurōjin.suitingTextColor()
    static let jurōjinGradient: [Color] = [jurōjinLight, jurōjin]

    static let budai: Color = Color(assetName: TBConstant.Color.nameForBudai)
    static let budaiLight: Color = Color(assetName: TBConstant.Color.nameForBudaiLight)
    static let budaiTextColor: Color = jurōjin.suitingTextColor()
    static let budaiGradient: [Color] = [budaiLight, budai]

#endif
    
}
