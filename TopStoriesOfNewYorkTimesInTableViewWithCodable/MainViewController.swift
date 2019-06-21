//
//  MainViewController.swift
//  TopStoriesOfNewYorkTimesInTableViewWithCodable
//
//  Created by vagelis spirou on 21/06/2019.
//  Copyright © 2019 vagelis spirou. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    var stories = [Story]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=FKL3xQmUPmuCQhFJmm9ldsUUnYU3nVOL"
        
        if let url = URL(string: urlString) {
            
            if let data = try? Data(contentsOf: url) {
                
                // We are OK Parse Data
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        
        let decoder = JSONDecoder()
        
        if let jsonStories = try? decoder.decode(Stories.self, from: json) {
            stories = jsonStories.results
            tableView.reloadData()
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath)
        
        let story = stories[indexPath.row]
        cell.textLabel?.text = story.title
        
        return cell
    }


}

