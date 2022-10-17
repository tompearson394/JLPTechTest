//
//  ProductDetailContentView.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import SwiftUI
import NukeUI
import RichText

struct ProductDetailContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @StateObject var viewModel: ProductDetailContentViewModel
    
    var body: some View {
        let priceHeaderView = makePriceHeaderView()
        HStack(alignment: .top, spacing: 0) {
            ScrollView {
                VStack {
                    makeProductImagesView()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        if horizontalSizeClass == .compact {
                            priceHeaderView
                        }
                        makeProductInformationView()
                        makeProductSpecificationView()
                    }
                    
                }
                .padding(.horizontal)
            }
            
            if horizontalSizeClass == .regular {
                Divider()
                
                priceHeaderView
                    .padding()
                    .frame(width: 300)
            }
            
        }
        .navigationTitle(viewModel.title)
    }
    
    private func makeProductImagesView() -> some View {
        TabView {
            ForEach(viewModel.imageURLs, id: \.absoluteString) { url in
                LazyImage(url: url, resizingMode: .aspectFit)
                    .padding(.bottom, 40)
            }
        }
        .tabViewStyle(.page)
        .frame(height: horizontalSizeClass == .compact ? 340 : 500)
    }
    
    private func makePriceHeaderView() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.price)
                .font(.jlpTitle2)
                .fontWeight(.semibold)
                .accessibilityAddTraits(.isHeader)
            
            if let specialOffer = viewModel.specialOffer {
                Text(specialOffer)
                    .foregroundColor(.red)
            }
            
            ForEach(viewModel.includedServices, id: \.self) { service in
                Text(service)
                    .foregroundColor(.green)
                    .padding(.bottom, 20)
            }
            
        }
    }
    
    @ViewBuilder
    private func makeProductInformationView() -> some View {
        Text("Product Information")
            .font(.jlpTitle)
            .accessibilityAddTraits(.isHeader)
        
        Text("Product code: \(viewModel.productCode)")
        
        VStack(alignment: .trailing, spacing: 0) {
            RichText(html: viewModel.productInformationHTML)
                .placeholder {
                    ProgressView()
                }
                .fontType(.customName("Gill Sans"))
                .frame(minHeight: 150)
                .padding(-6) // The RichText framework adds padding by default (unwanted in this case)
            
            if (viewModel.displayShowMoreButton) {
                Button {
                    viewModel.showMoreProductInformationPressed()
                } label: {
                    Label("Show More", systemImage: "chevron.down")
                }
            }
        }
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    private func makeProductSpecificationView() -> some View {
        Text("Product Specification")
            .font(.jlpTitle)
            .accessibilityAddTraits(.isHeader)
        
        ForEach(viewModel.productSpecifications) { specification in
            Divider()
            HStack {
                Text(specification.name)
                Spacer(minLength: 20)
                VStack(alignment: .trailing, spacing: 10) {
                    ForEach(specification.values, id: \.self) { value in
                        Text(value)
                    }
                }
            }
            .padding(.vertical)
            .accessibilityElement(children: .combine)
        }
    }
}

struct ProductDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(
            price: Product.Price(currency: "GBP", now: "399.00"),
            media: Product.Media(
                images: Product.Images(
                    urls: [
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325?",
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325alt1?",
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325alt2?",
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325alt4?",
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325alt5?",
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325alt6?",
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325alt7?",
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325alt8?",
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325alt9?",
                        "//johnlewis.scene7.com/is/image/JohnLewis/240936325alt10?"
                    ]
                )
            ),
            details: Product.Details(
                productInformation: "<P>A great size for medium-sized households, this Bosch dishwasher comes fitted with water, money and energy-saving features - all without sacrificing cleaning power. The EcoSilence Drive motor and Silence programme keeps noise to a minimum, while LoadSensor and DosageAssist ensure the wash cycle runs as efficiently as possible. Plus, it's Wi-Fi compatible, meaning you can control this appliance remotely via your smartphone.</p>\n <P><b>Access and control your dishwasher, no matter where you are</b><br>\n With the Home Connect app (available on Android and iOS), you can control your dishwasher remotely. Select programs, adjust timers, check how long the cycle has left, start the wash when you want; all from the comfort of your Smartphone.</p>\n <p><b>LoadSensor automatically adjusts water useage</b><br>\n Not all washing loads are the same, so why should each cycle automatically use the same amount of water? The LoadSensor feature detects the load weight and water level so that only the required amount of water is used, saving you energy and money off your bills.</p>\n <p><b>EcoSilence Drive™ keeps noise to a minimum</b><br>\n Sleep soundly even with the dishwasher running as EcoSilence Drive™ keeps noise to a minimum. The brushless, energy-saving motor not only ensures you won't be disturbed at the night but also helps give the machine a longer working life; all without sacrificing cleaning power.</p>\n <p><b>Efficient water useage</b><br>\n Bosch's ActiveWater technology keeps your water usage low and your monthly bills even lower. By combining targeted water circulation with faster heat-up times and improved pressure in the spray arms, your dishwasher gets the maximum use out of each and every drop.</p>\n <p><b>DosageAssist provides optimum results</b><br>\n From greasy baking trays to heavily soiled pans, DosageAssist ensures all your kitchen crockery comes out crystal clean. Catching the tablet in a special tray on the top basket, it gets completely dissolved, giving you great results every time.</p>\n <p><b>InfoLight projects onto the floor to tell you when dishes are being washed</b><br>\n Don't worry about having to open the dishwasher to see when the cycle finishes. InfoLight tells you when the dishes are done.</p>\n <p><b>Silence programme</b><br>\n The silence programme is the quietest way to run your dishwasher. By activating it, you automatically reduce the noise levels of your dishwasher to the lowest minimum possible, so you can enjoy some well-deserved peace and quiet.</p>",
                features: [Product.Feature(attributes: [
                    Product.Attribute(
                        name: "Adjustable racking",
                        value: "Upper and Lower Basket",
                        multivalued: false,
                        values: []
                    ),
                    Product.Attribute(
                        name: "Smart Technology",
                        value: "Amazon Alexa Enabled",
                        multivalued: true,
                        values: [
                            "Amazon Alexa Enabled",
                            "Google Assistant Enabled",
                            "Home Connect Enabled",
                            "Via Manufacturer's App"
                        ]
                    )
                ])]
            ),
            title: "Bosch Serie 2 SMS2ITW41G Freestanding Dishwasher, White",
            additionalServices: Product.AdditionalServices(includedServices: [
                "2 year guarantee included"
            ]),
            code: "81701202",
            displaySpecialOffer: "Half price installation available worth £45 (Apply promo code HALFINSTALL45 at checkout)"
        )
        let viewModel = ProductDetailContentViewModel(product: product)
        ProductDetailContentView(viewModel: viewModel)
    }
}
