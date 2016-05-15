import UIKit

class QuizSelectController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var topics : [[String: String]] = [
    ["title": "Science", "image": "science", "description": "Let's science!"],
    ["title": "Marvel Super Heroes", "image": "marvel", "description": "Test your marvel knowledge!"],
    ["title": "Mathematics", "image": "math", "description": "Do you know what 1 + 1 is?"]]
    
  
  var topicInfo :[AnyObject] = []
  var selected = 0
  
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    let url = NSURL(string: "https://tednewardsandbox.site44.com/questions.json")
    let defaults = NSUserDefaults.standardUserDefaults()

    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
      if error != nil {
        // no internet connection so grab data locally
        self.topicInfo = defaults.arrayForKey("data")!
      } else {
        let httpResponse = response as! NSHTTPURLResponse
        let statusCode = httpResponse.statusCode
      
        if (statusCode == 200) {
          do{
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
            
            // store this locally in case they have no internet later
            defaults.setValue(json as! [AnyObject], forKey: "data")
            
            self.topicInfo = json as! [AnyObject]
          }catch {
            print("Error with Json: \(error)")
          }
        }
      }
    }
    
    task.resume()
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
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    selected = indexPath.row
    performSegueWithIdentifier("tableSegue", sender: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
      let vc = segue.destinationViewController as! QuestionController
      vc.data = self.topicInfo[self.selected]
    }
  }

