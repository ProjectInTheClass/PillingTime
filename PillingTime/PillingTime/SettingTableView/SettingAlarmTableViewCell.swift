
import UIKit

class SettingAlarmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    var settingSwitchState = false
    
    @IBAction func buttonTapped(_ sender: UISwitch) {
        settingSwitchState = sender.isOn
        sender.isOn = !settingSwitchState
        UserDefaults.standard.set(sender.isOn, forKey: "settingSwitchState")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
