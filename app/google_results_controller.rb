class GoogleResultsController < UITableViewController

  attr_accessor :banner_view
  attr_accessor :results

  def viewDidLoad
    super

    @results  = []

    @banner_view = GADBannerView.alloc.initWithAdSize(KGADAdSizeBanner)
    # Your Admob Publisher ID
    @banner_view.adUnitID = "a14fbabf58e906f"
    @banner_view.rootViewController = self

    @banner_view.frame = [
      [0, -50],
      [320, 50]
    ]

    self.view.addSubview(@banner_view)

    @banner_view.loadRequest(GADRequest.request)

    # TODO: Why *cant* an http call happen here, we needed to wrap it with a fake class
    @google = Google.new(self)


    self.tableView.contentInset = UIEdgeInsetsMake(70, 0, 0, 0)

    self
  end

  def viewDidUnload
    super
    @banner_view.release
    @results = []
    self.tableView.reloadData
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @results.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    GoogleResultCell.cellForItem(@results[indexPath[1]], inTableView:tableView)
  end

  def updateResults(results)
    @results = results
    self.tableView.reloadData
  end

end