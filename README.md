# Oppgaver

- Lage en Todo-app for iOS
Spec:

1. Liste opp todos
2. Søk på todos
3. Swipe to delete
4. Click to edit
5. Lag ny 
6. Tag todo med lokasjon
7. Få notifikasjon når du er nært en todo

---

# Storyboard

- Start i Main.storyboard
![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/storyboard.png?raw=true)
- Dra ut Table View
- Sett på constraints (hug top, bunn, og sidene)
- Dra inn referanse til tableView
![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/ctrldrag.png?raw=true)


# Custom table view cell

- Velg at du skal ha 1 prototype celle ved å velge tableView i storyboard, 
![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/protoypecell.png?raw=true)

- Sett identifer og klasse for protoype cell. 
![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/customcell.png?raw=true)

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/customclass.png?raw=true)

# ViewController og  tableView

- Sett delegate til tableView til å være self
- Lag et array med fake data til å starte med for å teste presentasjon

```swift
tableView.delegate = self
```

- Implementer delegate og dataSource:

```swift
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
    }
}
```

- Tips for å populere TodoTableViewCell:

```swift
let cell = tableView.dequeueReusableCellWithIdentifier("todoCell") as! TodoTableViewCell
let todo = tableData[indexPath.row]

// sett data på celle og return cell

```


# Opprett Todo


