//
//  SentMemeCollectionVC.swift
//  MemeMe
//
//  Created by Ahmed Afifi on 4/13/19.
//  Copyright © 2019 Ahmed Afifi. All rights reserved.
//

import UIKit

class SentMemeCollectionVC: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"SentMemeCollectionViewCell" , for: indexPath) as! SentMemeCollectionViewCell
        let currentMeme = memes[indexPath.row]
        cell.memeImageView.image = currentMeme.originalImage
        cell.memesLabel?.text = memes[indexPath.row].topText + "..." + memes[indexPath.row].bottomText
        return cell
    }
    
  
    
   
    
    
    
    
    
}
