
import UIKit

class TimeLineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var morningButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    @IBOutlet weak var morningImageView: UIImageView!
    @IBOutlet weak var lunchImageView: UIImageView!
    @IBOutlet weak var dinnerImageView: UIImageView!
    
    var pill: Pill? {
        didSet {
            guard let pill = pill else { return }
            
            self.titleLabel.text = pill.title
            self.memoLabel.text = pill.memo
            
        }
    }
    
    override func prepareForReuse() {
        self.morningButton.isEnabled = false
        self.lunchButton.isEnabled = false
        self.dinnerButton.isEnabled = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
