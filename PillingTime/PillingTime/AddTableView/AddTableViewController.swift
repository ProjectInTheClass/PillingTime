
import UIKit

class AddTableViewController: UITableViewController, UIPickerViewDataSource {
    
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var pickerview: UIPickerView!
    
    let pickerArray = ["식후 1시간", "식후 30분", "식전 30분", "식전 1시간"]
    var PickerSelectedValue = ""
    
    @IBAction func modalDismiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if velocity.y < -1.0 {
            memoTextView.resignFirstResponder()
        }

    }
    
}





extension AddTableViewController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        PickerSelectedValue = pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //tableView.frame.width
        let customPickerView = UIView(frame: CGRect(x:0, y:0, width:120, height: 40))
        let customUILable = UILabel(frame: CGRect(x:0, y:0, width:120, height: 40))
        
        customUILable.text = pickerArray[row]
        customUILable.textAlignment = .center
        
        customPickerView.addSubview(customUILable)
        
        return customPickerView
    }
}

