//
//  GetCallView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI
import MapKit

struct GetCallView: View {
  @State var callstate = "Pending Call"
  @State var distance = 5
  @State var min = 3
  @State var centerName = "Hoeryong Village\nCommunity Center"
  @State var address = "8 Baesan-ro, Gijang-gun,\nBusan Metropolitan City"
  @State var isShowingCallButton = true
  @State var isShowingHalfSheet = true
  
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.2335, longitude: 129.1600), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
  
  @Binding var isShowingGetCallView: Bool
  
  var getCallAnnotations: [MyAnnotationItem] = [MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 35.2348, longitude: 129.1591))]
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: getCallAnnotations, annotationContent: { item in
        MapAnnotation(coordinate: item.coordinate) {
                  Image("annotation")
        }
      })
      .ignoresSafeArea()
      VStack(spacing: 0) {

        HStack {
          Button {
            isShowingGetCallView.toggle()
          } label: {
            Image("arrowBackButton")
          }
          .padding([.top], 24)
          Spacer()
        }
        .padding([.leading], 24)
        Spacer()
      }
    }
    .sheet(isPresented: $isShowingHalfSheet) {
       HalfSheet {
           VStack(spacing: 0) {
             HStack(spacing: 12) {
               Text("\(distance)km")
                 .font(.system(size: 24))
                 .foregroundColor(.mainGreen)
                 .padding([.top, .bottom], 4)
                 .padding([.leading, .trailing], 12)
                 .background(
                   RoundedRectangle(cornerRadius: 20)
                     .stroke(Color.mainGreen, lineWidth: 1)
                 )
               Text("\(min)mins")
                 .font(.system(size: 24))
                 .foregroundColor(.mainGreen)
                 .padding([.top, .bottom], 4)
                 .padding([.leading, .trailing], 12)
                 .background(
                   RoundedRectangle(cornerRadius: 20)
                     .stroke(Color.mainGreen, lineWidth: 1)
                 )
             }
             .padding(.top, 41)
             .padding(.bottom, 20)
             Text("\(centerName)")
               .font(.system(size: 32))
               .multilineTextAlignment(.center)
               .padding(.bottom, 12)
             Text("\(address)")
               .font(.system(size: 24))
               .foregroundColor(.black.opacity(0.4))
               .multilineTextAlignment(.center)
           }
           .padding(.bottom, 29)
         
         Button {
             isShowingCallButton.toggle()
           //           isShowingHalfSheet.toggle()
         } label: {
           Text("Get the call")
             .font(.system(size: 28, weight: .semibold))
         }
         .opacity(isShowingCallButton ? 1 : 0)
         .buttonStyle(MainButtonStyle())
         .padding(.bottom, 20)
         
       }
    }
    
  }
}

struct GetCallView_Previews: PreviewProvider {
  static var previews: some View {
    GetCallView(isShowingGetCallView: .constant(true))
  }
}
