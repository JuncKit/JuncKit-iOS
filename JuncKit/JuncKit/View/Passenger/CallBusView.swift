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
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $region, interactionModes: [.zoom], showsUserLocation: true, userTrackingMode: .constant(.follow))
        .padding([.bottom], 310)
      ZStack {
        VStack {
          Spacer()
          RoundedRectangle(cornerRadius: 30)
            .frame(height: 374)
        }
        .ignoresSafeArea()
      }
      .frame(alignment: .bottom)
    }
  }
}

struct CallBusView_Previews: PreviewProvider {
  static var previews: some View {
    CallBusView()
  }
}
