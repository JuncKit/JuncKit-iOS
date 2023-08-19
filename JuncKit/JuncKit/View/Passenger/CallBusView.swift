//
//  CallBusView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI
import MapKit

struct CallBusView: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
  @State var isShowingWaitingBusView = false
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $region, interactionModes: [.zoom], showsUserLocation: true, userTrackingMode: .constant(.follow))
        .padding([.bottom], 310)
      VStack {
        Spacer()
        ZStack {
          RoundedRectangle(cornerRadius: 30)
            .frame(height: 374)
            .foregroundColor(.white)
          VStack(spacing: 0) {
            Text("You Are Right Here")
              .font(.system(size: 24))
              .foregroundColor(.black.opacity(0.4))
              .padding(.top, 163)
            Button {
              isShowingWaitingBusView.toggle()
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
  }
}

struct CallBusView_Previews: PreviewProvider {
  static var previews: some View {
    CallBusView()
  }
}
