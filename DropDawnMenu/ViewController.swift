import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabla: UITableView!
    
    private let datos = [
        MCDropData(title: "Titulo 1", url: "https://www.youtube.com/watch?v=lDqJR9b6w7s"),
        MCDropData(title: "Titulo 2", url: "https://www.youtube.com/watch?v=mL46fSJ_Nhs"),
        MCDropData(title: "Titulo 3", url: "https://www.youtube.com/watch?v=NDhJfHhe3e4 ")
    ]
    
    private var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.dataSource = self
        tabla.delegate = self
        tabla.register(CeldaTableViewCell.self, forCellReuseIdentifier: "CeldaTableViewCell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex  == indexPath { return 200}
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CeldaTableViewCell", for: indexPath) as! CeldaTableViewCell
        celda.data = datos[indexPath.row]
        celda.selectionStyle = .none
        celda.animate()
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        
        tabla.beginUpdates()
        tabla.reloadRows(at: [self.selectedIndex], with: .none)
        tabla.endUpdates()
    }
    
}
 
