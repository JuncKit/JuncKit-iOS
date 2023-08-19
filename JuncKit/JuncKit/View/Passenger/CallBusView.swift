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
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.1675, longitude: 129.1367), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
  @State var isShowingWaitingBusView = false
  @State var isShowingCallBusModal = true
  @StateObject var locationManager = LocationManager()
  
  @Binding var isStartPassengerMode: Bool
  
  var annotationItems: [MyAnnotationItem] = [MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 35.1688, longitude: 129.1363))]
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: annotationItems, annotationContent: { item in
        MapAnnotation(coordinate: item.coordinate) {
                  Image("annotation")
        }
      })
      .ignoresSafeArea()
      VStack {
        HStack {
          Button {
            isStartPassengerMode.toggle()
          } label: {
            Image("arrowBackButton")
          }
          Spacer()
        }
        .padding([.top, .leading], 24)
        Spacer()
      }
      .sheet(isPresented: $isShowingCallBusModal) {
             HalfSheet {
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
              isShowingCallBusModal.toggle()
              print(locationManager.lastKnownLocation?.coordinate.latitude)
            } label: {
              Text("Call Bus")
            }
            .buttonStyle(MainButtonStyle())
            .padding([.bottom], 40)
            .padding(.top, 36)
          }
        }
      }
      if isShowingWaitingBusView {
        Color.white
          .ignoresSafeArea()
        WaitingBusView(isShowingWaitingBusView: $isShowingWaitingBusView, isStartPassengerMode: $isStartPassengerMode)
      }
    }
    .onDisappear {
      isShowingCallBusModal.toggle()
    }
  }
}

struct CallBusView_Previews: PreviewProvider {
  static var previews: some View {
    CallBusView(isStartPassengerMode: .constant(true))
  }
}
