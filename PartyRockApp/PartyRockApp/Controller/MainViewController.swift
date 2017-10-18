//
//  ViewController.swift
//  PartyRockApp
//
//  Created by dvt on 2017/10/11.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let url = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Bg_Q7KYWG1g\" frameborder=\"0\" allowfullscreen></iframe>"
    let imageURL = "https://visualhunt.com/photos/l/8/camera-journal-travel.jpg"
    
    var partyRocks = [PartyRock]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: imageURL, videoURL: url, videoTitle: "When the rock fell")
        let p2 = PartyRock(imageURL: imageURL, videoURL: url, videoTitle: "When the rock fell")
        let p3 = PartyRock(imageURL: imageURL, videoURL: url, videoTitle: "When the rock fell")
        let p4 = PartyRock(imageURL: imageURL, videoURL: url, videoTitle: "When the rock fell")
        let p5 = PartyRock(imageURL: imageURL, videoURL: url, videoTitle: "When the rock fell")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRock = partyRocks[indexPath.row]
            cell.configure(with: partyRock)
            return cell
        }
        return UITableViewCell()
    }
}

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
}
