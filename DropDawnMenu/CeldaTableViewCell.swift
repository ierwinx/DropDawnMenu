import UIKit

class CeldaTableViewCell: UITableViewCell {
    
    var data: MCDropData? {
        didSet {
            guard let data = data else { return }
            self.titulo.text = data.title
            self.url.text = data.url
        }
    }
    
    fileprivate let titulo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Titulo"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let url: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Contenido del texto para expandir"
        label.textColor = .white
        label.numberOfLines = -1
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var container: UIView = {
        let contenedor = UIView()
        contenedor.clipsToBounds = true
        contenedor.translatesAutoresizingMaskIntoConstraints = false
        contenedor.backgroundColor = .red
        contenedor.layer.cornerRadius = 10
        return contenedor
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(container)
        //Constrains
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        container.addSubview(titulo)
        container.addSubview(url)
        
        titulo.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        titulo.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 4).isActive = true
        titulo.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -4).isActive = true
        titulo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        url.topAnchor.constraint(equalTo: titulo.bottomAnchor).isActive = true
        url.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 4).isActive = true
        url.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -4).isActive = true
        url.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func animate() {
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.contentView.layoutIfNeeded()
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
