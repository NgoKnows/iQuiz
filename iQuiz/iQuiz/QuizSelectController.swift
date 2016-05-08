import UIKit

class QuizSelectController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var topics : [[String: String]] = [
    ["title": "Mathematics", "image": "math", "description": "Do you know what 1 + 1 is?"],
    ["title": "Marvel Super Heroes", "image": "marvel", "description": "Test your marvel knowledge!"],
    ["title": "Science", "image": "science", "description": "Let's science!"]];
  
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  @IBAction func handleSettingsClick(sender: AnyObject) {
    let alertView = UIAlertController(title: "Settings", message: "These are the settings!", preferredStyle: .Alert)
    alertView.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
    presentViewController(alertView, animated: true, completion: nil)
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return topics.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: TopicCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! TopicCell
    let idx = indexPath.row
    
    cell.icon.image = UIImage(named: self.topics[idx]["image"]!)
    cell.title.text = self.topics[idx]["title"]!
    cell.descript.text = self.topics[idx]["description"]!
    
    return cell
  }
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


}

