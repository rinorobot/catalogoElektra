//
//  CatalogoViewController.swift
//  CatalogoElektra
//
//  Created by Salvador Gómez Moya on 21/06/23.
//

import UIKit

class CatalogoViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    
    @IBOutlet weak var tableViewCatalog: UITableView!
    var catalog = DataCatalog(advertencia: "", codigo: "", folio: "", mensaje: "", resultado: Resultado(categoria: "", paginacion: Paginacion(pagina: 0, totalPaginas: 0, totalRegistros: 0, totalRegistrosPorPagina: 0), productos: [Producto]()))
    
    var a_i = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        a_i.startAnimating()
        self.view.addSubview(a_i)

        tableViewCatalog.delegate = self
        tableViewCatalog.dataSource = self
        
     
        DispatchQueue.main.async {
            self.fetchData()
        }
        
        
        tableViewCatalog.register(UINib(nibName: "CellProductTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    func fetchData(){
        guard let url = URL(string: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a") else {
            fatalError("URL guard stmt failed")
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            //HANDLE DECODING HERE
            
            if let data = data {
                guard let catalogAPI = try? JSONDecoder().decode(DataCatalog.self, from: data) else {
                    fatalError("Error decoding data \(error!)")
                }
                
             //   var catalog = [DataCatalog]()
                
            //    catalog.append(catalogAPI)
                
                
              
              
                
                self?.catalog = catalogAPI
                
                
                
            }
            DispatchQueue.main.async {
                self?.a_i.stopAnimating()
              
                self?.tableViewCatalog.reloadData()
                       }
           
        }.resume()
        
        
        tableViewCatalog.register(UINib(nibName: "CellProductTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let detalle = story.instantiateViewController(withIdentifier: "story") as! ViewController
        
        if let indexPath = tableViewCatalog.indexPathForSelectedRow{
            let index = indexPath.row
           
            detalle.nombre_producto = catalog.resultado.productos[index].nombre
            
            detalle.precio_producto = "$\(catalog.resultado.productos[index].precioFinal)"
            
            detalle.url_imagen_producto = catalog.resultado.productos[indexPath.row].urlImagenes[0]
            
            detalle.categoria_producto = "Código categoría: "+catalog.resultado.productos[index].codigoCategoria
            
          
            
            tableViewCatalog.deselectRow(at: indexPath, animated: true)
        }
        
        self.present(detalle, animated: true, completion: nil)
    }
   

}

extension CatalogoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.resultado.productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewCatalog.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellProductTableViewCell
        
        cell.nameCell.text = catalog.resultado.productos[indexPath.row].nombre
        
        cell.priceCell.text = "$\(catalog.resultado.productos[indexPath.row].precioFinal)"
        
        if let stringImage = catalog.resultado.productos[indexPath.row].urlImagenes[0] as? String{
            if let urlImage = URL(string: stringImage){
                DispatchQueue.global().async{
                    guard let dataImage = try? Data(contentsOf: urlImage) else {
                        cell.imageCell.image = UIImage(systemName: "heart.fill")
                        return
                    }
                    
                    let image = UIImage(data: dataImage)
                    DispatchQueue.main.async{
                        
                        cell.imageCell.image = image
                        
                    }
                    
                }
            }
        }
        
        return cell
        
        
    }
    
    
    
}
