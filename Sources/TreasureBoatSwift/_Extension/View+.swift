//
//  View+.swift
//
//
//  Created by Ken Ishimoto on 2022/07/02.
//

import SwiftUI
import PhotosUI

public extension View {
    
    func center() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func embedNavigationStack() -> some View {
        return NavigationStack { self }
    }
    
    func isMacOS()->Bool{
        return TBDevice.isMac()
    }
    
    /// Hides / unhides a view
    /// - Parameter shouldHide: hidden value
    /// - Returns: a view that is hidden or not
    @ViewBuilder
    func isHidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
    
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder
    func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
    
    /// Creates a `Push Out View` from a `Pull In View`
    /// - Parameter backgroundColor: The color of the area outside of the `Pull In View`
    /// - Returns: a `Push Out View`
    func asPushOutView(_ backgroundColor: Color = .clear) -> some View {
        ZStack {
            backgroundColor
            self
        }
    }
    
    /// Can create a `Push Out View` from a
    /// - Parameters:
    ///   - isPushOutView: should create a `Push Out View` from a `Pull In View`
    ///   - backgroundColor: The color of the area outside of the `Pull In View`
    /// - Returns: a `Push Out View` or a `Pull In View`
    @ViewBuilder
    func isPushOutView(_ isPushOutView: Bool = true, backgroundColor: Color = .clear) -> some View {
        if isPushOutView {
            ZStack {
                backgroundColor
                self
            }
        } else {
            self
        }
    }
    
    // Positions this view within an invisible frame with the specified size with a set .center alignment.
    /// - Parameter square: A fixed width and height for the resulting view. If `width` is `nil`, the resulting view assumes this view's sizing behavior.
    /// - Returns: A square view with fixed dimensions of `width` and `height`.
    func frame(square lenght: CGFloat?) -> some View {
        self.frame(width: lenght, height: lenght)
    }
    
    /// Clips this view to its bounding rectangular frame and defines the content shape for hit testing.
    /// - Parameters:
    ///   - cornerRadius: corner radius. Default is 0
    ///   - style: rounded corner style. Default is .circular
    func clippedContent(cornerRadius: CGFloat = 0, style: RoundedCornerStyle = .circular) -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: style))
            .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: style))
    }
    
#if os(iOS) || os(watchOS)
    /// Links a ``PhotosPicker`` selection to a ``UIImage`` binding
    /// - Parameters:
    ///   - selection: ``PhotosPicker`` selection
    ///   - selectedUIImage: ``UIImage`` binding
    @MainActor
    func linkPhotosPicker(selection: Binding<PhotosPickerItem?>, toSelectedUIImage selectedUIImage: Binding<UIImage?>) -> some View {
        self.onChange(of: selection.wrappedValue) { oldValue, newValue in
            Task {
                if let imageData = try? await newValue?.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                    selectedUIImage.wrappedValue = image
                }
            }
        }
    }
#endif
 
#if os(iOS) || os(macOS)

    /// https://www.youtube.com/watch?v=UETjgKWWB1I
    @ViewBuilder
    func shine(_ toggle: Bool, duration: CGFloat = 0.5, clipShape: some Shape = .rect, rightToLeft: Bool = false) -> some View {
        self
            .overlay {
                GeometryReader {
                    let size = $0.size
                    /// Eliminating Negative Duration
                    let moddedDuration = max(0.3, duration)
                    
                    Rectangle()
                        .fill(.linearGradient(
                            colors: [
                                .clear,
                                .clear,
                                .white.opacity(0.1),
                                .white.opacity(0.5),
                                .white.opacity(1),
                                .white.opacity(0.5),
                                .white.opacity(0.1),
                                .clear,
                                .clear,
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .scaleEffect(y: 8)
                        .keyframeAnimator(initialValue: 0.0, trigger: toggle, content: { content, progress in
                            content
                                .offset(x: -size.width + (progress * (size.width * 2)))
                        }, keyframes: { _ in
                            CubicKeyframe(.zero, duration: 0.1)
                            CubicKeyframe(1, duration: moddedDuration)
                        })
                        .rotationEffect(.init(degrees: 45))
                    /// Simply Flipping View in Horizontal Direction
                        .scaleEffect(x: rightToLeft ? -1 : 1)
                }
            }
            .clipShape(clipShape)
            .contentShape(clipShape)
    }
#endif

    /// DEPRECATED : use embedNavigationStack
    func embedNavigationView() -> some View {
        return NavigationStack { self }
    }
    
}
