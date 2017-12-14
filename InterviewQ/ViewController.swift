//
//  ViewController.swift
//  InterviewQ
//
//  Created by Yaxin Yuan on 2017-12-14.
//  Copyright © 2017 Yaxin Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var storeArr: [(String, String)]?{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeGestrue = UISwipeGestureRecognizer(target: self, action: #selector(swipe(gestureRecog:)))
        self.view.addGestureRecognizer(swipeGestrue)
        LCBOConnect.getListofStores(completion: {[unowned self] arr in
            self.storeArr = arr
        })
    }
    
    @objc func swipe(gestureRecog: UISwipeGestureRecognizer){
        guard let storeArr = storeArr else{
            return
        }
        let sb = UIStoryboard(name: "MapSB", bundle: nil)
        let mapVC = sb.instantiateInitialViewController() as! MapViewController
        mapVC.initController(addArray: storeArr)
        self.present(mapVC, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell")!
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = storeArr![indexPath.row].0
        return cell
    }
    
}

extension ViewController: UITableViewDelegate{
    
}

