//
//  PlayerView.swift
//  iMovies
//
//  Created by Mac on 03/04/2022.
//

import UIKit
import YouTubePlayer
class PlayerView: UIViewController {

    @IBOutlet weak var PreviousBtn: UIButton!
    @IBOutlet weak var nextVideoBtn: UIButton!
    @IBOutlet weak var bckbtn: UIButton!
    @IBOutlet weak var myPlayer: YouTubePlayerView!
    var count = 0
    var videoIDs: [TrailerResult]?
    var currentVideoId: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        myPlayer.delegate = self
        currentVideoId = videoIDs![count].key
        myPlayer.loadVideoID(currentVideoId)
        PreviousBtn.isEnabled = false

    }
    override func viewWillAppear(_ animated: Bool) {
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextVideoAction(_ sender: Any) {
        let contain = videoIDs?.indices.contains(count + 1)
        if contain!{
            count += 1
            PreviousBtn.isEnabled = true
            currentVideoId = videoIDs![count].key
            myPlayer.loadVideoID(currentVideoId)
            let nextCheck = videoIDs?.indices.contains(count + 1)
            if nextCheck!{
                nextVideoBtn.isEnabled = true
            }
            else{
                nextVideoBtn.isEnabled = false
            }
        }
        else
        {
            nextVideoBtn.isEnabled = false
        }
       
        
        
    }
    @IBAction func previousVideoAction(_ sender: Any) {
        let contain = videoIDs?.indices.contains(count - 1)
        if contain!{
            count -= 1
            nextVideoBtn.isEnabled = true
            currentVideoId = videoIDs![count].key
            myPlayer.loadVideoID(currentVideoId)
            let previosCheck = videoIDs?.indices.contains(count - 1)
            if previosCheck!{
            PreviousBtn.isEnabled = true
            }
            else{
                PreviousBtn.isEnabled = false
            }
        }
        else
        {
            PreviousBtn.isEnabled = false
        }
       
    }
    
}


extension PlayerView:YouTubePlayerDelegate
{
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState)
    {
        print(playerState)
        switch playerState{
        case .Ended:
            self.navigationController?.popViewController(animated: true)
        default:
            break

        }
    }
   

}
