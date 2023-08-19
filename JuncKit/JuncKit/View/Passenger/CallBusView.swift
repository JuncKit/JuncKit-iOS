//
//  CallBusView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI
import MapKit

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

struct CallBusView: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.1688, longitude: 129.1363), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
  @State var isShowingWaitingBusView = false
  @StateObject var locationManager = LocationManager()
  
  var annotationItems: [MyAnnotationItem] = [MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 35.1688, longitude: 129.1363))]
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: annotationItems, annotationContent: { item in
        MapAnnotation(coordinate: item.coordinate) {
                  Image("annotation")
        }
      })
        .padding([.bottom], 310)
      VStack {
        Spacer()
        ZStack {
          RoundedRectangle(cornerRadius: 30)
            .frame(height: 374)
            .foregroundColor(.white)
          VStack(spacing: 0) {
            Image("pin")
              .padding(.bottom, 16)
              .padding(.top, 39)
            Text("You Are Right Here")
              .font(.system(size: 24))
              .foregroundColor(.black.opacity(0.4))
              .padding(.bottom, 28)
            Button {
              isShowingWaitingBusView.toggle()
              print(locationManager.lastKnownLocation?.coordinate.latitude)
            } label: {
              Text("Call Bus")
            }
            .buttonStyle(MainButtonStyle())
            .padding([.bottom], 30)
            .padding(.top, 36)
          }
        }
      }
      .ignoresSafeArea()
      if isShowingWaitingBusView {
        WaitingBusView(isShowingWaitingBusView: $isShowingWaitingBusView)
      }
    }
    .onAppear {
      locationManager.startUpdating()
    }
  }
}

extension CallBusView {
//  private func postMyLocation () {
//    AF.request("http://localhost:5000/test/post", method: .post, parameters: ["key": "hello!"], encoding: URLEncoding.httpBody).responseJSON() { response in
//      switch response.result {
//      case .success:
//        if let data = try! response.result.get() as? [String: Any] {
//          self.message = data["result"] as! String
//        }
//      case .failure(let error):
//        print("Error: \(error)")
//        return
//      }
//    }
//  }
}

struct CallBusView_Previews: PreviewProvider {
  static var previews: some View {
    CallBusView()
  }
}
