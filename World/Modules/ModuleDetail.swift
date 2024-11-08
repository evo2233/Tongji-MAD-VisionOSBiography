/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A detail view that presents information about different module types.

*/

import SwiftUI

/// A detail view that presents information about different module types.这个结构体定义子界面格式
struct ModuleDetail: View {
    @Environment(ViewModel.self) private var model

    var module: Module /*-由此深入，添加member-*/

    var body: some View {
        @Bindable var model = model

        GeometryReader { proxy in
            let textWidth = min(max(proxy.size.width * 0.4, module == .orbit ? 500 : 300), 500)
            let imageWidth = min(max(proxy.size.width - textWidth, 300), 700)
            ZStack {
                HStack(spacing: 60) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(module.heading)
                            .font(.system(size: 50, weight: .bold))
                            .padding(.bottom, 15)
                            .accessibilitySortPriority(4)

                        Text(module.overview)
                            .padding(.bottom, 24)
                            .accessibilitySortPriority(3)

                        switch module {
                        case .globe:
                            GlobeToggle()
                        case .orbit:
                            OrbitToggle()
                                .accessibilitySortPriority(2)
                        case .solar:
                            SolarSystemToggle()
                        /*-在Module里添加member后-*/
                        case .biography:
                            BiographyToggle() /*-这里需要为按钮添加功能-*/
                        }
                    }
                    .frame(width: textWidth, alignment: .leading)

                    module.detailView
                        .frame(width: imageWidth, alignment: .center)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding([.leading, .trailing], 70)
        .padding(.bottom, 24)
        .background {
            if module == .solar {
                Image("SolarBackground")
                    .resizable()
                    .scaledToFill()
                    .accessibility(hidden: true)
            }
        }

        // A settings button in an ornament,
        // visible only when `showDebugSettings` is true.
        .settingsButton(module: module) /*-由此深入-*/
   }
}

extension Module {
    @ViewBuilder
    fileprivate var detailView: some View {
        switch self {
        case .globe: GlobeModule()
        case .orbit: OrbitModule()
        case .solar: SolarSystemModule()
        case .biography: BiographyModule() /*-这里需要一个新的image-*/
        }
    }
}

#Preview("Globe") {
    NavigationStack {
        ModuleDetail(module: .globe)
            .environment(ViewModel())
    }
}

#Preview("Orbit") {
    NavigationStack {
        ModuleDetail(module: .orbit)
            .environment(ViewModel())
    }
}

#Preview("Solar System") {
    NavigationStack {
        ModuleDetail(module: .solar)
            .environment(ViewModel())
    }
}
