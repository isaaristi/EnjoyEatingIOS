//
//  PrincipalViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 17/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit
import SDWebImage

class PrincipalViewController: UIViewController {
    
    
    @IBOutlet weak var container: UIView!
    var pantalla1:UIViewController!
    var pantalla2:UIViewController!
    var prev:UIViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       pantalla1 = storyboard!.instantiateViewController(withIdentifier: "guardar")
        pantalla2 = storyboard!.instantiateViewController(withIdentifier: "estuve")
        prev = pantalla1
        addController(content: pantalla1)

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
     let r = data[indexPath.row]
     let alert = UIAlertController(title: r.nombre, message: "Seleccionaste un  restaurante", preferredStyle: .alert)
     
     let ok = UIAlertAction(title:"OK", style: .default) { (alert) in
     print("Alert ok")
     }
     
     let cancel = UIAlertAction(title: "Cancelar", style: .cancel) {
     (alert) in
     print("Alert cancel")
     
     }
     
     alert.addAction(ok)
     alert.addAction(cancel)
     
     present(alert, animated: true, completion: nil)
     }*/
    
    
    @IBAction func selectContent(_ sender: UISegmentedControl) {
        let pos = sender.selectedSegmentIndex
        removeController(content: prev)
        if pos == 0{
            addController(content: pantalla1)
            prev = pantalla1
        }else{
            addController(content: pantalla2)
            prev = pantalla2
        }
        
    }
    
    func addController(content:UIViewController){
        addChildViewController(content)
        content.view.frame.size = container.frame.size
        content.view.frame.origin = CGPoint(x: 0, y: 0)
        container.addSubview(content.view)
        content.didMove(toParentViewController: self)
    }
    
    func removeController(content:UIViewController){
        content.willMove(toParentViewController: nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    

}



