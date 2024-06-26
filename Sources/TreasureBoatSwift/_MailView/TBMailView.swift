//
//  TBMailView.swift
//
//  Created by Alex Nagy on 19.07.2022.
//

#if canImport(MessageUI)
import SwiftUI
import MessageUI

public struct TBMailView: UIViewControllerRepresentable {
    @Environment(\.dismiss) private var dismiss
    
    private var configure: ((MFMailComposeViewController) -> Void)?
    private var onFinish: ((MFMailComposeResult) -> ())?
    private var onFail: ((Error) -> ())?
    
    public init(configure: ((MFMailComposeViewController) -> Void)?,
                onFinish: ((MFMailComposeResult) -> ())?,
                onFail: ((Error) -> ())?) {
        self.configure = configure
        self.onFinish = onFinish
        self.onFail = onFail
    }
    
    public class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        let parent: TBMailView
        var dismiss: DismissAction
        var onFinish: ((MFMailComposeResult) -> ())?
        var onFail: ((Error) -> ())?
        
        init(_ parent: TBMailView, dismiss: DismissAction,
             onFinish: ((MFMailComposeResult) -> ())?,
             onFail: ((Error) -> ())?) {
            self.parent = parent
            self.dismiss = dismiss
            self.onFinish = onFinish
            self.onFail = onFail
        }
        
        public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer {
                dismiss()
            }
            guard error == nil else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.parent.onFail?(error!)
                }
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.parent.onFinish?(result)
            }
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self, dismiss: dismiss, onFinish: onFinish, onFail: onFail)
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<TBMailView>) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.mailComposeDelegate = context.coordinator
        configure?(viewController)
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<TBMailView>) { }
}

#endif
