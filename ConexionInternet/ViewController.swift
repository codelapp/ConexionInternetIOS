import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicador: UILabel!
    var reachability : Reachability!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reachability = Reachability.init()
        /*
        if reachability.connection != .none {
            indicador.text = "HAY CONEXION"
        }else{
            indicador.text = "NO HAY CONEXION"
        }
         */
        
        NotificationCenter.default.addObserver(self, selector: #selector(conexion), name: Notification.Name.reachabilityChanged, object: reachability)
        
        do {
            try reachability.startNotifier()
        } catch  {
            print("Error en la notificacion")
        }
        
    }

    @objc func conexion(nota: Notification){
        let reach = nota.object as! Reachability
        
        switch reach.connection {
        case .wifi:
            self.indicador.text = "HAY CONEXION VIA WIFI"
        case .cellular:
            self.indicador.text = "HAY CONEXION VIA CELULAR"
        case .none:
            self.indicador.text = "NO HAY CONEXION"
        }
        
    }


}

