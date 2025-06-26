/*import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

@main
struct VideoCallApp: App {
    @State var call: Call
    @ObservedObject var state: CallState
    @State var callCreated: Bool = false

    private var client: StreamVideo
    private let apiKey: String = "mmhfdzb5evj2" // The API key can be found in the Credentials section
    private let userId: String = "Luke_Skywalker" // The User Id can be found in the Credentials section
    private let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiTHVrZV9Ta3l3YWxrZXIiLCJpc3MiOiJwcm9udG8iLCJzdWIiOiJ1c2VyL0x1a2VfU2t5d2Fsa2VyIiwiaWF0IjoxNjg5NzAzNjMwLCJleHAiOjE2OTAzMDg0MzV9.QDb5rZBP4H0Euc67TyGiylwnmfnaNnG59HrJcjU2VFU" // The Token can be found in the Credentials section
    private let callId: String = "Wlirevu6Ky2V" // The CallId can be found in the Credentials section

    init() {
        let user = User(
            id: userId,
            name: "Martin", // name and imageURL are used in the UI
            imageURL: .init(string: "https://getstream.io/static/2796a305dd07651fcceb4721a94f4505/a3911/martin-mitrevski.webp")
        )

        // Initialize Stream Video client
        self.client = StreamVideo(
            apiKey: apiKey,
            user: user,
            token: .init(stringLiteral: token)
        )

        // Initialize the call object
        let call = client.call(callType: "default", callId: callId)

        self.call = call
        self.state = call.state
    }

    var body: some Scene {
        WindowGroup {
            VStack {
                if callCreated {
                    ZStack {
                        ParticipantsView(participants: call.state.remoteParticipants)
                        FloatingParticipantView(participant: call.state.me)
                    }
                } else {
                    Text("loading...")
                }
            }.onAppear {
                Task {
                    guard callCreated == false else { return }
                    try await call.join(create: true)
                    callCreated = true
                }
            }
        }
    }
}*/

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

@main
struct VideoCallApp: App {
    @ObservedObject var viewModel: CallViewModel

    private var client: StreamVideo
    private let apiKey: String = "mmhfdzb5evj2" // The API key can be found in the Credentials section
    private let userId: String = "Kyle_Katarn" // The User Id can be found in the Credentials section
    private let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiS3lsZV9LYXRhcm4iLCJpc3MiOiJwcm9udG8iLCJzdWIiOiJ1c2VyL0t5bGVfS2F0YXJuIiwiaWF0IjoxNjkwNjQ2Nzg2LCJleHAiOjE2OTEyNTE1OTF9.WYkZXIG-dWiOilDaf48T4dxlVrYd1yQzOzj6NiZKMKI" // The Token can be found in the Credentials section
    private let callId: String = "Bq19P8LCzEpb" // The CallId can be found in the Credentials section

    init() {
        let user = User(
            id: userId,
            name: "Martin", // name and imageURL are used in the UI
            imageURL: .init(string: "https://getstream.io/static/2796a305dd07651fcceb4721a94f4505/a3911/martin-mitrevski.webp")
        )

        // Initialize Stream Video client
        self.client = StreamVideo(
            apiKey: apiKey,
            user: user,
            token: .init(stringLiteral: token)
        )

        self.viewModel = .init()
    }

    var body: some Scene {
        WindowGroup {
            VStack {
                if viewModel.call != nil {
                    CallContainer(viewFactory: DefaultViewFactory.shared, viewModel: viewModel)
                } else {
                    Text("loading...")
                }
            }.onAppear {
                Task {
                    guard viewModel.call == nil else { return }
                    viewModel.joinCall(callType: .default, callId: callId)
                }
            }
        }
    }
}
