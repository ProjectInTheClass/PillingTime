
import UIKit

class AddTableViewController: UITableViewController, UIPickerViewDataSource {
    
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet var iconButtons: [UIButton]!
    @IBOutlet var timeButtons: [UIButton]!

    var iconName = ""
    let iconNameList = ["a_pills-2", "a_pills", "a_medicine_glass",
                        "a_tablets", "a_medicine", "a_tablet", "a_drugs"]
    let pickerArray = ["식후 1시간", "식후 30분", "식전 30분", "식전 1시간"]
    var timeList: [Meridian: Check] = [:]
    var PickerSelectedValue = "식후 1시간"
    
    
    @IBAction func tabIconButton(_ sender: UIButton) {
        for check in iconButtons {
            check.isSelected = false
        }
        iconName = iconNameList[sender.tag]
        sender.isSelected = true
    }
    
    @IBAction func tabTimeButton(_ sender: UIButton) {
        guard let title = sender.currentTitle, let time = Meridian(rawValue: title) else {
            return
        }
        
        if sender.isSelected == true {
            print("Meridian 삭제")
            timeList.removeValue(forKey: time)
            sender.isSelected = false
            
        } else {
            print("Meridian 추가")
            timeList[time] = .check
            sender.isSelected = true
        }
    }
    
    @IBAction func modalDismiss(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func tabSave(_ sender: UIBarButtonItem) {
        if iconName != ""
            && (titleField.text != nil)
            && [Meridian](timeList.keys).count != 0{
            let pill = Pill(iconName: iconName, title: titleField.text!,
                            memo: memoTextView.text, meridianCheckList: timeList,
                            time: PickerSelectedValue)
            
            PillList.append(pill)
            updateCheck = true
            print("PillList 개수 :" + "\(String(describing: PillList.count))")
            print("PillList에 추가")
            self.dismiss(animated: true, completion: nil)
            
        } else {
            let warningAlert = UIAlertController(title: "정보를 모두 입력해주세요.", message: nil, preferredStyle: .alert)
            let warningAction = UIAlertAction(title: "닫기",
                                              style: .default,
                                              handler: { (action: UIAlertAction)
                                                -> Void in
                print("닫기")
            })
            
            warningAlert.addAction(warningAction)
            self.present(warningAlert, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in iconButtons {
            item.isSelected = false
        }
        for item in timeButtons {
            item.isSelected = false
        }

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
        if velocity.y < -0.5 || velocity.y > 0.5 {
            titleField.resignFirstResponder()
        }
        
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

