//
//  World
//
//  Created by admin on 2024/11/8.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import AVKit

struct Biography: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "lie", withExtension: "mp4")!))
            .frame(width: 1200, height: 700).cornerRadius(10)
    }
}
