

import UIKit

protocol CellDel : AnyObject{
    func add(number : Int)
    func sub(number : Int)
}

class displayNumbersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var labelNumbers: UILabel!
    
    @IBOutlet weak var color: UIView!
    weak var delegate : CellDel!
    var enterNumber : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fill (numbers : Int, colorBackground: UIColor) {
        self.enterNumber = numbers
        color.backgroundColor = colorBackground
    }
    
    @IBAction func addAction(_ sender: Any) {
        delegate.add(number: enterNumber)
    }
    
    @IBAction func subAction(_ sender: Any) {
        delegate.sub(number: enterNumber)
    }
}
