//
//  AppDelegate.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
       
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        self.saveContext()
    }
 //————————————————————————————————————————————————————————————————
 
           // Core Data持久化容器的懒加载属性。
    lazy var persistentContainer: NSPersistentContainer = {
        // 创建一个新的NSPersistentContainer实例，指定Core Data模型的名称。
        let container = NSPersistentContainer(name: "DataModel")
        
        // 加载持久化存储器，从而载入SQLite数据库中的数据。
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            // 检查是否有错误发生。
            if let error = error as NSError? {
                // 如果有错误发生，程序会立即崩溃，并显示错误信息。
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        // 返回已载入的持久化容器。
        return container
    }()
//————————————————————————————————————————————————————————————————————————————————————————————
   
    // 保存Core Data的视图上下文。
    func saveContext() {
        // 获取持久化容器的视图上下文。
        let context = persistentContainer.viewContext
        
        // 检查是否有未保存的更改。
        if context.hasChanges {
            do {
                // 尝试保存更改。
                try context.save()
            } catch {
                // 如果保存失败，捕获错误并崩溃。
                // 这是因为保存失败是一个严重的错误，应该立即处理。
                let nserror = error as NSError
                fatalError("未解决的错误 \(nserror), \(nserror.userInfo)")
            }
        }
    }
//——————————————————————————————————————————————————————————————————————————————————————
    


}

