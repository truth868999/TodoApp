//
//  Draft.swift
//  TodoApp
//
//  Created by 齊藤真 on 2022/12/14.
//

import SwiftUI

struct Draft: View {
    @State var taskTitle = ""
    var body: some View {
        TextField("タスクを入力してください", text: $taskTitle)
    }
}

struct Draft_Previews: PreviewProvider {
    static var previews: some View {
        Draft()
    }
}
