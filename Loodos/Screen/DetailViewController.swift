//
//  DetailViewController.swift
//  Loodos
//
//  Created by macbookair on 29.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

@objc class DetailViewController: UIViewController {
    
    @objc var contentPreview: ContentPreview!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentImageCover: UIImageView!
    @IBOutlet weak var contentName: UILabel!
    @IBOutlet weak var contentYear: UILabel!
    @IBOutlet weak var contentDirector: UILabel!
    @IBOutlet weak var contentGenre: UILabel!
    
    struct Detail {
        var title: String
        var description: String
    }
    var contentList: [Detail] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = contentPreview.title
        
        let hud: MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        WebHelper.sharedInstance().getContentDetailImdbID(contentPreview.imdbID, successBlock: {response in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                do {
                    let jsonData: ContentDetail = try ContentDetail.init(string: (response as! String), error: nil)
                    
                    self.contentImageCover.sd_setImage(with: URL(string: jsonData.poster!), placeholderImage: UIImage(named: "placeHolder"))
                    self.contentName.text = jsonData.title
                    self.contentYear.text = jsonData.year
                    self.contentDirector.text = jsonData.director
                    self.contentGenre.text = jsonData.genre
                    
                    self.contentList.append(Detail(title: NSLocalizedString("Actors", comment: ""), description: jsonData.actors))
                    self.contentList.append(Detail(title: NSLocalizedString("Plot", comment: ""), description: jsonData.plot))
                    self.contentList.append(Detail(title: NSLocalizedString("ImdbRating", comment: ""), description: jsonData.imdbRating))
                    self.contentList.append(Detail(title: NSLocalizedString("Language", comment: ""), description: jsonData.language))
                    self.contentList.append(Detail(title: NSLocalizedString("Released", comment: ""), description: jsonData.released))
                    self.contentList.append(Detail(title: NSLocalizedString("Runtime", comment: ""), description: jsonData.runtime))
                    self.analyticsEvent(content: jsonData)
                    self.tableView.reloadData()
                } catch {
                    print("\(error)")
                }
            }
        }, errorBlock: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
            }
        })
    }
    
    func analyticsEvent(content: ContentDetail){
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: content.imdbID,
            AnalyticsParameterItemName: content.title,
            "actors": content.actors,
            "imdbRating": content.imdbRating,
            "language": content.language,
            ])
    }
}

//MARK: Table Delegate
extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let content: Detail = contentList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
        cell.contentText.text = "\(content.title): \(content.description)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
}
