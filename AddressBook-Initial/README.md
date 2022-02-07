
####  . AddressBook Initial](https://www.hackingwithswift.com/100/22)
2. add a bar button item to the main view controller that recommends the app to other people.
##### .. at ViewController
    //
        override func viewDidLoad() {
        //
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "<3", style: .plain, target: self, action: #selector(shareTapped))
        //
        }
        @objc func shareTapped() {
            guard let myApp = URL(string: "https://apps.apple.com/app/thisApp") else { return }
            let recommend = "I recommend"
            let vc = UIActivityViewController(activityItems: [recommend, myApp], applicationActivities: [])
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true)
        }
    //
####  . day [40 challenge](https://www.hackingwithswift.com/100/40)
1. Modify project 1 so that loading the list of NSSL images from our bundle happens in the background. Make sure you call reloadData() on the table view once loading has finished!
##### .. at ViewController
    //
    override func viewDidLoad() {
        //
        performSelector(inBackground: #selector(loadNSSLimages), with: nil)
    }
    
    @objc func loadNSSLimages(){
        let fm = FileManager.default
        //bundle = .app directories
        let path = Bundle.main.resourcePath!
        //The items constant will be an array of strings containing filenames
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items{
            if item.hasPrefix("nssl"){
                //this is a picture to load
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
        print(pictures)
        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
    }
    //
