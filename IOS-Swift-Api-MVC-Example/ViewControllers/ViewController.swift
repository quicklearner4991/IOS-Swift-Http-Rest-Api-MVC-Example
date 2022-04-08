//
//  ViewController.swift
//  IOS-Swift-Api-MVC-Example
//
//  Created by apple on 07/04/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var postsTableView: UITableView!
    private var apiManager = PostsApiManager()
    private var postsList : [PostsModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        postsTableView.delegate = self
        postsTableView.dataSource = self
        self.postsTableView.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: K.cellIdentifierPosts)
        apiManager.getPosts()
        // Do any additional setup after loading the view.
    }
}

extension ViewController : PostsApiManagerDelegate {
    func onPostsResponse(_ apiManager: PostsApiManager, responseModel: [PostsModel]) {
        print("Response")
        postsList = responseModel
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
        }
    }
    
    func onError(_ error: Error) {
        print("Error")
        
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifierPosts, for: indexPath) as! PostsTableViewCell
        let ad = postsList[indexPath.row]
        cell.titleLabel.text = ad.title!
        cell.subtitleLabel.text = ad.body!
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("item clicked")
    }
    
}

