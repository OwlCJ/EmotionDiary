
import SwiftUI

@main
struct EmotionDiaryApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = DiaryListViewModel(storage: MoodDiaryStorage())
            DiaryListView(vm: vm)
        }
    }
}
