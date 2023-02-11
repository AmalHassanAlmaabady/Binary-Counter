
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableOfTotal: UILabel!
    
    var arrayOfNumbers : [Int] = []
    var numbers = 1
    var total = 0
    let totalstr = "Total "

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        arrayOfNumbers.append(numbers)
        
        for _ in 1...16{
            numbers = numbers * 10
            arrayOfNumbers.append(numbers)
        }
        tableOfTotal.text = "\(totalstr)0"
        tableOfTotal.backgroundColor = .systemPink
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showNumbers") as! displayNumbersTableViewCell
        let number = arrayOfNumbers[indexPath.row]
        cell.delegate = self
        cell.fill(numbers: number, colorBackground: .lightGray)
        cell.labelNumbers.text = String(number)
        
        return cell
    }

}

extension ViewController : CellDel {
    func add(number: Int) {
        self.total = total + number
        tableOfTotal.text = "\(totalstr) \(String(Int(tableOfTotal.text ?? "" ) ?? 0 + total))"
    }
    
    func sub(number: Int) {
        self.total = total - number
        tableOfTotal.text = "\(totalstr) \(String(Int(tableOfTotal.text ?? "" ) ?? 0 + total))"
    }
    
}

