//
//  CardViewController.swift
//  Pros
//
//  Created by Suwat Saegauy on 2/21/15.
//  Copyright (c) 2015 com.cpekmutt.project. All rights reserved.
//

import UIKit
import AVFoundation

class CardViewController: BaseTableViewController,
    QRCodeReaderViewControllerDelegate {

    // ------------------------------
    // MARK: -
    // MARK: Properties
    // ------------------------------
    
    @IBOutlet weak var insertCardBarButtonItem: UIBarButtonItem!
    
    var cardView: RKCardView!
    
    lazy var reader = QRCodeReaderViewController(metadataObjectTypes: [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeAztecCode])
    
    // ------------------------------
    // MARK: -
    // MARK: View Life Cycle
    // ------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        customUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        refreshControl?.addTarget(self, action: "loadData", forControlEvents: .ValueChanged)
    }
    
    // ------------------------------
    // MARK: -
    // MARK: Action
    // ------------------------------
    
    @IBAction func scanAction(sender: AnyObject) {        
        let alertController = UIAlertController(title: "Select input form...", message: "", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            println("[CancelAction] ActionSheet")
        }
        alertController.addAction(cancelAction)
        
        let scanQRCodeAction = UIAlertAction(title: "Scan QRCode", style: .Default) { (action) in
            self.performQRCodeReaderViewControllerWithAnimated(true)
        }
        alertController.addAction(scanQRCodeAction)
        
        
        let serialNumberAction = UIAlertAction(title: "Serial number", style: .Default) { (action) in
            self.performSerialNumberAlertACtionWithAnimated(true)
        }
        alertController.addAction(serialNumberAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    // ------------------------------
    // MARK: -
    // MARK: User Interface
    // ------------------------------
    
    private func customUI() -> Void {
        customNavigationBar()
        customTableView()
    }
    
    private func customNavigationBar() -> Void {
        navigationItem.titleView = Utilities.titleLabelOnNavigationBar("Cards")
    }
    
    private func customTableView() -> Void {
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // This will remove extra separators from tableview
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.separatorColor = UIColor.clearColor()
        tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    }
    
    private func updateUI() {
    }
    
    // ------------------------------
    // MARK: -
    // MARK: Data
    // ------------------------------
    
    private func loadData() -> Void {
//        activities = ["cover": ["00_coverDummy", "01_coverDummy", "02_coverDummy", "03_coverDummy"],
//            "logo": ["00_logoDummy", "01_logoDummy", "02_logoDummy", "03_logoDummy"],
//            "title": ["StarBucks", "Black Canyon", "Coffee World", "Cafe Amazon"],
//            "description": ["Coffee shop", "Coffee shop", "Coffee shop", "Coffee shop"],
//            "point": ["99", "100", "7", "55"],
//            "expirationDate": ["04/12/2014", "12/11/2014", "26/06/2015", "01/01/2015"]];
        
        // ----
        
//        userActivities = [User(objectId: userData["objectId"] as? String
//            , createdAt: userData["createdAt"] as? String
//            , updatedAt: userData["updatedAt"] as? String
//            , fbId: userData["id"] as? String
//            , name: userData["name"] as? String
//            , gender: userData["gender"] as? String
//            , birthday: userData["birthday"] as? String
//            , email: userData["email"] as? String
//            , profileImage: nil)]
        
//        userActivities = [User(objectId: "",
//            createdAt: NSDate(),
//            updatedAt: NSDate(),
//            fbId: "",
//            name: "",
//            gender: "",
//            birthday: "",
//            email: "",
//            profileImage: UIImage())]
        
        /*
        UserClass.id = userData["id"] as? String
        UserClass.name = userData["name"] as? String
        UserClass.gender = userData["gender"] as? String
        UserClass.birthday = userData["birthday"] as? String
        UserClass.email = userData["email"] as? String
        
        let fbPictureUrl: NSURL! = NSURL(string: "https://graph.facebook.com/\(self.UserClass.id)/picture?type=large&return_ssl_resources=1")
        let fbUrlRequest: NSURLRequest! = NSURLRequest(URL: fbPictureUrl)
        // Run network request asynchronously
        NSURLConnection.sendAsynchronousRequest(fbUrlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            (response: NSURLResponse!, data: NSData!, connectionError: NSError!) -> Void in
            if (connectionError == nil && data != nil) {
                // Set the image in the header imageView
                self.UserClass.picture = UIImage(data: data)
            }
        })
        
        println("[HomeVC] \(UserClass.id) \(UserClass.email)")
        */
    }
    
    // ------------------------------
    // MARK: -
    // MARK: Configuration
    // ------------------------------
    
    func performQRCodeReaderViewControllerWithAnimated(animted: Bool!) {
        if QRCodeReader.supportsMetadataObjectTypes() {
            self.reader.modalPresentationStyle = .FormSheet
            self.reader.delegate = self
            self.reader.completionBlock = { (result: String?) in
                if let result = result {
                    println("[Log] Completion with result: \(result)")
                } else {
                    println("[Log] Completion with result is nil")
                }
            }
            
            presentViewController(self.reader, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Reader not supported by the current device", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func performSerialNumberAlertACtionWithAnimated(animated: Bool!) {
        let alertController = UIAlertController(title: "Serial number", message: "Please enter your serial number", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            println("[CancelAction] Alert")
        }
        alertController.addAction(cancelAction)
        
        let enterAction = UIAlertAction(title: "Enter", style: .Default) { (action) in
            let serialNumberTextField = alertController.textFields![0] as UITextField
            println("[EnterAction] \(serialNumberTextField.text)")
            // Fn: Send to service API and Check
        }
        enterAction.enabled = false
        alertController.addAction(enterAction)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Serial number"
            textField.secureTextEntry = true
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                enterAction.enabled = textField.text != ""
            }
        }
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    // ------------------------------
    // MARK: -
    // MARK: Table view data source
    // ------------------------------
    
    private let cellIdentifier       = "Cell"
    
    let BUFFERX: CGFloat = 12 //distance from side to the card (higher makes thinner card)
    let BUFFERY: CGFloat = 35 //distance from top to the card (higher makes shorter card)
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let titleCount = activities["title"]!
//        return titleCount.count
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        cell.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        cardView = RKCardView(frame: CGRectMake(BUFFERX, BUFFERY-15,
            view.frame.size.width-2*BUFFERX,
            view.frame.size.height-11*BUFFERY))
        cardView.coverImageView.image = UIImage(named: "00_coverDummy")
        cardView.logoImageView.image = UIImage(named: "00_logoDummy")
        cardView.titleLabel.text = "StackBucks Coffee"
        cardView.typeLabel.text = "@Cafe"
        cardView.pointLabel.text = "99"
        cardView.expirationDateLabel.text = Utilities.dateWithString(NSDate(), dateStype: .ShortStyle, timeStyle: .NoStyle)
        
        cell.contentView.addSubview(cardView)
        
        return cell
    }
    
    // ------------------------------
    // MARK: -
    // MARK: Table view deleagete
    // ------------------------------
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return view.frame.size.height-10*BUFFERY
    }
    
    // ------------------------------
    // MARK: -
    // MARK: - QRCodeReader Delegate Methods
    // ------------------------------
    
    func reader(reader: QRCodeReaderViewController, didScanResult result: String) {
        self.dismissViewControllerAnimated(true, completion: { [unowned self] () -> Void in
            let alert = UIAlertController(title: "Code reader", message: result, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        })
    }
    
    func readerDidCancel(reader: QRCodeReaderViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "segueToQRCodeReader" {
            println("[Segue] Card -> QRCode reader")
        }
    }

}