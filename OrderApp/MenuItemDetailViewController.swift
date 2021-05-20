//
//  MenuItemDetailViewController.swift
//  OrderApp
//
//  Created by Philip on 12.04.2021.
//

import UIKit

class MenuItemDetailViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MenuController.shared.updateUserActivity(with: .menuItemDetail(menuItem))
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var detailTextLabel: UILabel!
    
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    let menuItem: MenuItem!
    
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func addToOrderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0,
               usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1,
               options: [], animations: {
                self.addToOrderButton.transform =
                   CGAffineTransform(scaleX: 2.0, y: 2.0)
                self.addToOrderButton.transform =
                   CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
       
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        addToOrderButton.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
    }
    

    func updateUI() {
        nameLabel.text = menuItem.name
        priceLabel.text = MenuItem.priceFormatter.string(from: NSNumber(value: menuItem.price))
        detailTextLabel.text = menuItem.detailText
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else {return}
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
