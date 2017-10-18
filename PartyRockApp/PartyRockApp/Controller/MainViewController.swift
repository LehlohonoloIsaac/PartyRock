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
    
    let videoUrl = "https://www.youtube.com/embed/Bg_Q7KYWG1g"
    
    var partyRocks = [PartyRock]()
    override func viewDidLoad() {
        super.viewDidLoad()

        (0..<5).forEach({ _ in
            let imageURL = "https://visualhunt.com/photos/l/8/camera-journal-travel.jpg"
            let partyRock = PartyRock(imageURL: imageURL, videoURL: videoUrl, videoTitle: "The greatest motivational video")
            partyRocks.append(partyRock)
        })
 
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? VideoViewController {
            if let partyRock = sender as? PartyRock {
                destinationViewController.partyRock = partyRock
            }
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
}
