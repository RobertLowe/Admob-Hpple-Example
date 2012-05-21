class GoogleResultCell < UITableViewCell
  CellID = 'CellIdentifier'

  def self.cellForItem(result, inTableView:tableView)
    cell = tableView.dequeueReusableCellWithIdentifier(GoogleResultCell::CellID) || GoogleResultCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)

    cell.textLabel.text       = result[:title].to_s
    cell.detailTextLabel.text = result[:href].to_s

    cell
  end

end