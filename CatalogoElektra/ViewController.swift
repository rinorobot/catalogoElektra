//
//  ViewController.swift
//  CatalogoElektra
//
//  Created by Salvador Gómez Moya on 21/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var btnCatalogo: UIButton!
    
    @IBOutlet weak var imageProductDetaile: UIImageView!
    @IBOutlet weak var viewProduct: UIView!
    
    @IBOutlet weak var nameProduct: UILabel!
    
    @IBOutlet weak var priceProductLbl: UILabel!
    
    @IBOutlet weak var categoryProductLbl: UILabel!
    
    var nombre_producto = ""
    var precio_producto = ""
    var url_imagen_producto = ""
    var categoria_producto = ""
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameProduct.text = nombre_producto
        priceProductLbl.text = precio_producto
        categoryProductLbl.text = categoria_producto
    
        
        if let stringImage = url_imagen_producto as? String{
            if let urlImage = URL(string: stringImage){
                DispatchQueue.global().async{
                    guard let dataImage = try? Data(contentsOf: urlImage) else {
                        self.imageProductDetaile.image = UIImage(systemName: "heart.fill")
                        return
                    }
                    
                    let image = UIImage(data: dataImage)
                    DispatchQueue.main.async{
                        
                        self.imageProductDetaile.image = image
                        
                    }
                    
                }
            }
            
            
        }
        
        
    }
    
}

