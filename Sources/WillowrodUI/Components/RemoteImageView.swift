////
////  RemoteImageView.swift
////  Fighting Fantasy Tracker
////
////  Created by Mike Hall on 07/10/2024.
////
//
//import Foundation
//import SwiftUI
//import CachedAsyncImage
///**
// *
// * Remote Image Helpers
// *
// * CachedAsyncImage wrappers for images of various weights with or without access tokens
// *
// */
//
//public struct RemoteImage: View {
//    let url: String
//    let width: CGFloat
//    let height: CGFloat
//    var padding: CGFloat = 10
//    public var body: some View {
//        if #available(iOS 15.0, *) {
//            CachedAsyncImage(url: URL(string: url)) { image in
//                image.resizable().aspectRatio(contentMode: .fit).padding(padding)
//            } placeholder: {
//                ProgressView()
//            }
//            .frame(width: width, height: height)
//        } else {
//            RemoteImageView(url: URL(string: url)!, placeholder: {
//                ProgressView()}, image: {$0.resizable().aspectRatio(contentMode: .fit).padding(padding * 1.2)}).frame(width: width, height: height)
//        }
//    }
//}
//
//public struct RemoteImageFill: View {
//    let url: String
//    let width: CGFloat
//    let height: CGFloat
//    var padding: CGFloat = 10
//    var border: Color = .clear
//    var background: Color = .clear
//    public var body: some View {
//
//        if #available(iOS 15.0, *) {
//            CachedAsyncImage(url: URL(string: url)) { image in
//                image.resizable().aspectRatio(contentMode: .fill).frame(width: width, height: height).padding(padding).background(background).clipped().border(border)
//            } placeholder: {
//                ProgressView().frame(width: width, height: height).border(border)
//            }
//        } else {
//            RemoteImageView(url: URL(string: url)!, placeholder: {
//                ProgressView()}, image: {$0.resizable().aspectRatio(contentMode: .fit).background(background).padding(padding * 1.2)}).frame(width: width, height: height).border(border).clipped()
//        }
//    }
//}
//
//public struct RemoteImageFit: View {
//    let url: String
//    let width: CGFloat
//    let height: CGFloat
//    var padding: CGFloat = 10
//    var border: Color = .clear
//    var background: Color = .clear
//    public var body: some View {
//
////        if #available(iOS 15.0, *) {
//            CachedAsyncImage(url: URL(string: url)) { image in
//                image.resizable().aspectRatio(contentMode: .fit).frame(width: width, height: height).padding(padding).background(background).clipped().border(border)
//            } placeholder: {
//                ProgressView().frame(width: width, height: height).border(border)
//            }
////        } else {
////            RemoteImageView(url: URL(string: url)!, placeholder: {
////                ProgressView()}, image: {$0.resizable().aspectRatio(contentMode: .fit).background(background).padding(padding * 1.2)}).frame(width: width, height: height).border(border).clipped()
////        }
//    }
//}
//
//public struct RemoteImageFullWidth: View {
//    let url: String
//    var padding: CGFloat = 10
//    @State var request: URLRequest? = nil
//    let nw = NetworkingService.shared
//
//    //    init(url: String, padding: CGFloat = 10) {
//    //        self.url = url
//    //        self.padding = padding
//    //        createRequest()
//    //    }
//
//    func createRequest() async {
//        //Task{
//            request = await NetworkingService.shared.request(url, type: .GET)
//        //}
//    }
//
//    public var body: some View {
//        HStack{
//            if let request {
//                CachedAsyncImage(urlRequest: request) { image in
//                    image.resizable().aspectRatio(contentMode: .fit).padding(padding)
//                } placeholder: {
//                    ProgressView()
//                }
//            }
//        }.task {
//            await createRequest()
//        }
//
//    }
//}
//
//public struct RemoteImageWithHeight: View {
//    let url: String
//    let height: CGFloat
//    var progressWidth: CGFloat = (300 / 1.414)
//    @State var request: URLRequest? = nil
//
//    init(url: String, height: CGFloat, progressWidth: CGFloat) {
//        self.url = url
//        self.height = height
//        self.progressWidth = progressWidth
//
//    }
//
//    func createRequest() {
//        Task{
//            let myReq = await NetworkingService.shared.request(url, type: .GET)
//            //       DispatchQueue.main.async {
//            request = myReq
//            //       }
//        }
//    }
//
//    public var body: some View {
//
//        if let request {
//            CachedAsyncImage(urlRequest: request) { image in
//                image.resizable().aspectRatio(contentMode: .fit).frame(height: height)
//            } placeholder: {
//                ProgressView()
//            }
//        }
//    }
//}
//
//public struct SecureRemoteImageFit: View {
//        let url: String
//        let width: CGFloat
//        let height: CGFloat
//    @State var request: URLRequest? = nil
//    let nw = NetworkingService.shared
//
//    func createRequest(_ url: String) async {
//        let rq = await nw.request(url, type: .GET)
//        request = rq
//    }
//
//    public var body: some View {
//        HStack{
//            if let request {
//                CachedAsyncImage(urlRequest: request) { image in
//                    image.resizable().scaledToFit().frame(maxWidth: width, maxHeight: height)
//
//                } placeholder: {
//                    ProgressView()
//                }
//            }
//        }.task {
//            await createRequest(url)
//        }
//    }
//}
//
//public struct ProfileImage: View {
//    let profile: Int64
//    let company: String
//    @ObservedObject var session: SessionService = SessionService.shared
//    @State var request: URLRequest? = nil
//    let nw = NetworkingService.shared
//
//    func createRequest(_ url: String) async {
//        let rq = await nw.request(nw.getBaseURL(url, isSecure: true), type: .GET)
//        request = rq
//    }
//
//    public var body: some View {
//        HStack{
//            if let request {
//                CachedAsyncImage(urlRequest: request) { image in
//                    image.resizable().scaledToFit().cornerRadius(20).frame(maxWidth: 80, maxHeight: 120)
//                } placeholder: {
//                    ProgressView()
//                }
//            }
//        }.task(id: session.timeoutPic) {
//            let url = "getEmployeePicture&id=\(profile)&companyId=\(company)&timeout=\(session.timeoutPic ?? "")"
//            await createRequest(url)
//        }
//    }
//}
//
//public struct ProfileImageChangeable: View {
//    let profile: Int64
//    let company: String
//    var width: CGFloat = 80
//    @State var request: URLRequest? = nil
//    let nw = NetworkingService.shared
//
//    func createRequest(_ url: String) async {
//        let rq = await nw.request(nw.getBaseURL(url, isSecure: true), type: .GET)
//        request = rq
//    }
//
//    public var body: some View {
//        HStack{
//            if let request {
//                CachedAsyncImage(urlRequest: request) { image in
//                    image.resizable().scaledToFit().cornerRadius(20).frame(maxWidth: width, maxHeight: width * 1.5)
//                } placeholder: {
//                    ProgressView()
//                }
//            }
//        }.task(id: profile) {
//            let url = "getEmployeePicture&id=\(profile)&companyId=\(company)&timeout=0"
//            await createRequest(url)
//        }
//    }
//}
//
//public struct LogoImage: View {
//    let company: String
//    @State var request: URLRequest? = nil
//    let nw = NetworkingService.shared
//
//    func createRequest(_ url: String) async {
//        let rq = await nw.request(nw.getBaseURL(url, isSecure: true), type: .GET)
//        request = rq
//    }
//
//    public var body: some View {
//        HStack{
//            if let request {
//                CachedAsyncImage(urlRequest: request) { image in
//                    image.resizable().aspectRatio(contentMode: .fit).frame(height: 40)
//                } placeholder: {
//                    ProgressView()
//                }
//            }
//        }.task {
//            let url = "getCompanyPicture&companyId=\(company)"
//            await createRequest(url)
//        }
//    }
//}
//
//public struct RemoteImageWithWidth: View {
//    let url: String
//    let width: CGFloat
//    var border: Color = .clear
//    public var body: some View {
//        if #available(iOS 15.0, *) {
//            CachedAsyncImage(url: URL(string: url)) { image in
//                image.resizable().aspectRatio(contentMode: .fit).border(border)
//            } placeholder: {
//                ProgressView().frame(width: width).border(border)
//            }.frame(width: width)
//        } else {
//            RemoteImageView(url: URL(string: url)!, placeholder: {
//                ProgressView()}, image: {$0.resizable().aspectRatio(contentMode: .fit)}).frame(width: width).border(border)
//        }
//    }
//}
//
//
//public struct RemoteImageView<Placeholder: View, ConfiguredImage: View>: View {
//    var url: URL
//    private let placeholder: () -> Placeholder
//    private let image: (Image) -> ConfiguredImage
//
//    @ObservedObject var imageLoader: ImageLoaderService
//    @State var imageData: UIImage?
//
//    init(
//        url: URL,
//        @ViewBuilder placeholder: @escaping () -> Placeholder,
//        @ViewBuilder image: @escaping (Image) -> ConfiguredImage
//    ) {
//        self.url = url
//        self.placeholder = placeholder
//        self.image = image
//        self.imageLoader = ImageLoaderService(url: url)
//    }
//
//    @ViewBuilder private var imageContent: some View {
//        if let data = imageData {
//            image(Image(uiImage: data))
//        } else {
//            placeholder()
//        }
//    }
//
//    public var body: some View {
//        imageContent
//            .onReceive(imageLoader.$image) { imageData in
//                self.imageData = imageData
//            }
//    }
//}
//
//class ImageLoaderService: ObservableObject {
//    @Published var image = UIImage()
//
//    convenience init(url: URL) {
//        self.init()
//        loadImage(for: url)
//    }
//
//    func loadImage(for url: URL) {
//        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                self.image = UIImage(data: data) ?? UIImage()
//            }
//        }
//        task.resume()
//    }
//}
