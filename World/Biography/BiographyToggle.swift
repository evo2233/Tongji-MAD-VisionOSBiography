//
//  BiographyToggle.swift
//  World
//
//  Created by admin on 2024/11/5.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct BiographyToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        @Bindable var model = model
        
        Toggle(Module.biography.callToAction, isOn: $model.isShowingVideo)
            .onChange(of: model.isShowingVideo) { _, isShowing in
                if isShowing {
                    openWindow(id: Module.biography.name)
                } else {
                    dismissWindow(id: Module.biography.name)
                }
            }
            .toggleStyle(.button)
    }
}
