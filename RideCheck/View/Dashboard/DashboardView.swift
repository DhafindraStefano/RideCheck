//
//  DashboardView.swift
//  RideCheck
//
//  Created by Dhafindra Razaqa Stefano on 16/10/25.
//

import SwiftUI

struct DashboardView: View {
	private let columns = [GridItem(), GridItem()]
	private let componentSymbols = ["oilcan.fill", "car.rear.and.tire.marks", "engine.combustion.fill"]
	private let colorHexes        = ["#EF4444", "#F4CA35", "#35DE26"]
	private let names             = ["Engine Oil", "Front Tire", "Combustion Engine"]
	private let kmLefts           = [300, 1200, 5000]
	private let ests              = ["Est. Aug 20", "Est. Nov 7", "Est. Jan 14"]
	private var items: [ComponentItem] {
		var made: [ComponentItem] = []
		for i in 0..<min(componentSymbols.count, colorHexes.count, names.count, kmLefts.count, ests.count) {
			made.append(
				ComponentItem(
					name: names[i],
					symbol: componentSymbols[i],
					colorHex: colorHexes[i],
					kmLeft: kmLefts[i],
					estLabel: ests[i]
				)
			)
		}
		return made
	}
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack {
					OdometerView()
					SummaryView()
					
					VStack {
						HStack {
							Text("Components")
								.font(.title3)
								.fontWeight(.semibold)
							Spacer()
						}
						
						LazyVGrid(columns: columns) {
							ForEach(0..<items.count, id: \.self) { i in
								ComponentCard(item: items[i])
								ComponentCard(item: items[i])
							}
						}
						.padding(.top, 8)
						.padding(.bottom, 110)
					}
					.padding(.top, 24)
					
					Spacer()
				}
				.padding(.horizontal, 20)
				.toolbar {
					ToolbarItem(placement: .navigationBarLeading) {
						Button {
							//
						} label: {
							HStack(spacing: 4) {
								Text("Mercedes Beng")
									.font(.title2.bold())
								Image(systemName: "chevron.down")
									.font(.subheadline.bold())
							}
							.foregroundStyle(.black)
						}
					}
					ToolbarItem(placement: .navigationBarTrailing) {
						Button("?") { }
							.font(.title)
							.fontWeight(.semibold)
					}
				}
				.ignoresSafeArea(edges: .bottom)
			}
			.background(Color(hex: "F2F2F6"))
			.ignoresSafeArea(edges: .bottom)
		}
	}
}

struct ComponentItem: Identifiable {
	let id = UUID()
	let name: String
	let symbol: String
	let colorHex: String
	let kmLeft: Int
	let estLabel: String
}

struct ComponentCard: View {
	let item: ComponentItem
	
	var body: some View {
		VStack(alignment: .center) {
			Text(item.name)
				.font(.callout.bold())
				.multilineTextAlignment(.center)
			
			Spacer()
			
			ComponentIconView(
				Durability: 1,
				IconSize: 100,
				systemIconName: item.symbol,
				fillableRatio: 0.4 // sf symbol could get wonky. Adjust accordingly
			)
			
			Spacer()
			
			VStack(spacing: 3) {
				Text("\(item.kmLeft) Km left")
					.font(.footnote)
					.fontWeight(.semibold)
				
				Text(item.estLabel)
					.font(.caption)
					.fontWeight(.semibold)
					.foregroundStyle(Color(hex: "#B2ACAC"))
			}
		}
		.frame(maxWidth: .infinity)
		.frame(height: 170)
		.padding(13)
//				.background(Color(hex: "F8F8F9"))
//				.clipShape(RoundedRectangle(cornerRadius: 16))
//				.padding(2)
//				.background(Color(hex: "F0EFF5"))
//				.clipShape(RoundedRectangle(cornerRadius: 18))
//				.padding(5)
		.background(.white)
		.clipShape(RoundedRectangle(cornerRadius: 22))
	}
}

struct OdometerView: View {
	var body: some View {
		VStack {
			//Indicators
			HStack {
				HStack(spacing: 3) {
					Circle()
						.frame(width: 14, height: 14)
						.foregroundStyle(Color(hex: "#95D0B4"))
						.overlay() {
							Circle()
								.frame(width: 9, height: 9)
								.foregroundStyle(Color(hex: "2D9C69"))
						}
					Text("RideTrack")
						.font(.footnote)
						.foregroundStyle(Color(hex: "2D9C69"))
				}
				.padding(5.5)
				.background(Color(hex: "#EBFBF1"))
				.clipShape(RoundedRectangle(cornerRadius: 999))
				
				HStack(spacing: 3) {
					Circle()
						.frame(width: 14, height: 14)
						.foregroundStyle(Color(hex: "#5BC0FF"))
						.overlay() {
							Circle()
								.frame(width: 9, height: 9)
								.foregroundStyle(Color(hex: "008BFF"))
						}
					Text("RideRemind")
						.font(.footnote)
						.foregroundStyle(Color(hex: "008BFF"))
				}
				.padding(5.5)
				.background(Color(hex: "#D5EFFF"))
				.clipShape(RoundedRectangle(cornerRadius: 999))
				
				Spacer()
			}
			
			//Input and Tracking Modes
			HStack(spacing: 10) {
				//Input
				HStack {
					Spacer()
					
					Image(systemName: "powermeter")
						.font(.title.bold())
					
					VStack(spacing: 0) {
						Text("32.000")
							.font(.title.bold())
						//								GeometryReader { geometry in
						//									Path { path in
						//										path.move(to: CGPoint(x: 0, y: 0))
						//										path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
						//									}
						//									.stroke(style: StrokeStyle(
						//										lineWidth: 5,
						//										lineCap: .round,
						//										dash: [0.1, 12]
						//									))
						//									.foregroundColor(.black)
						//								}
						//								.frame(height: 5)
					}
					
					Text("km")
						.font(.title.bold())
					
					Spacer()
				}
				.padding(.vertical, 7)
				.background(Color(hex: "F8F8F9"))
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color(hex: "EBECEF"), lineWidth: 4)
				)
				.clipShape(.rect(cornerRadius: 10))
				
				//Tracking Modes
				Button(action: {
					print("Button tapped!")
				}) {
					Circle()
						.frame(width: 50, height: 50)
						.foregroundStyle(Color(hex: "#EBECEF"))
						.overlay() {
							Circle()
								.frame(width: 46, height: 46)
								.foregroundStyle(Color(hex: "#F8F8F9"))
							
							Image(systemName: "mappin.and.ellipse")
								.font(.title3.bold())
						}
				}
				.buttonStyle(.plain)
			}
		}
		.padding(10)
		.background(.white)
		.padding(.top, 1)
		.clipShape(RoundedRectangle(cornerRadius: 16))
		.padding(.top, 12)
	}
}

struct SummaryView: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 3) {
			HStack(spacing: 3) {
				Text("Engine Oil")
					.font(.footnote)
					.fontWeight(.semibold)
				Text("- Replace")
					.font(.footnote)
					.fontWeight(.medium)
					.foregroundStyle(Color(hex: "#85878F"))
				Text("Tuesday")
					.foregroundStyle(Color(hex: "#EF4444"))
					.font(.footnote)
					.fontWeight(.semibold)
				Spacer()
			}
			
			HStack(spacing: 3) {
				Text("Gardan Oil")
					.font(.footnote)
					.fontWeight(.semibold)
				Text("- Replace on")
					.font(.footnote)
					.fontWeight(.medium)
					.foregroundStyle(Color(hex: "#85878F"))
				Text("7 Nov 2025")
					.foregroundStyle(Color(hex: "#EF4444"))
					.font(.footnote)
					.fontWeight(.semibold)
				Spacer()
			}
		}
		.frame(maxWidth: .infinity)
		.padding(.vertical, 10)
		.padding(.horizontal, 13)
		.background(.white)
		.clipShape(RoundedRectangle(cornerRadius: 16))
		.padding(.top, 6)
	}
}

#Preview {
	DashboardView()
}

