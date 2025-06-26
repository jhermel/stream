//
//  ParticipantsView.swift
//  VideoCall
//
//  Created by amos.gyamfi@getstream.io on 20.7.2023.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct ParticipantsView: View {

    var participants: [CallParticipant]

    var body: some View {
        GeometryReader { proxy in
            if !participants.isEmpty {
                ScrollView {
                    LazyVStack {
                        if participants.count == 1, let participant = participants.first {
                            VideoRendererView(id: participant.id, size: proxy.size) { videoRenderer in
                                videoRenderer.handleViewRendering(for: participant, onTrackSizeUpdate: { _, _ in })
                            }
                            .frame(width: proxy.size.width, height: proxy.size.height)
                        } else {
                            ForEach(participants) { participant in
                                VideoRendererView(id: participant.id, size: proxy.size) { videoRenderer in
                                    videoRenderer.handleViewRendering(for: participant, onTrackSizeUpdate: { _, _ in })
                                }
                                .frame(width: proxy.size.width, height: proxy.size.height / 2)
                            }
                        }
                    }
                }
            } else {
                Color.black
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


