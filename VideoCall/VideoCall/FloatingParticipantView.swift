//
//  FloatingParticipantView.swift
//  VideoCall
//
//  Created by amos.gyamfi@getstream.io on 20.7.2023.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct FloatingParticipantView: View {

    var participant: CallParticipant?
    var size: CGSize = .init(width: 120, height: 120)

    var body: some View {
        if let participant = participant {
            VStack {
                HStack {
                    Spacer()

                    VideoRendererView(id: participant.id, size: size) { videoRenderer in
                        videoRenderer.handleViewRendering(for: participant, onTrackSizeUpdate: { _, _ in })
                    }
                    .frame(width: size.width, height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding()
        }
    }
}
#Preview {
    FloatingParticipantView()
}
