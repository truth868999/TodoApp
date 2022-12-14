//
//  ContentView.swift
//  TodoApp
//
//  Created by 齊藤真 on 2022/12/11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userData = UserData()
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.tasks) { task in
                    Button(action: {
                        guard let index = self.userData.tasks.firstIndex(of: task) else {
                            return
                        }
                        self.userData.tasks[index].checked.toggle()
                    })
                    {
                        ListRow(task: task.title, isCheck: task.checked)
                    }
                    }
                Text("+")
                    .font(.title)
            }
            .navigationTitle(Text("Tasks"))
            .navigationBarItems(trailing: Button(action: {
                DeleteTask()
            })
            {
                Text("delete")
            }
            )
        }
    }
    func DeleteTask() {
        let necessaryTask = self.userData.tasks.filter({!$0.checked})
        self.userData.tasks = necessaryTask
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
