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
![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/storyboard.png?raw=true)
- Dra ut Table View
- Sett på constraints (hug top, bunn, og sidene)
- Dra inn referanse til tableView
![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/ctrldrag.png?raw=true)


# Custom table view cell

- Velg at du skal ha 1 prototype celle ved å velge tableView i storyboard, 
![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/protoypecell.png?raw=true)

- Sett identifer og klasse for protoype cell. Du må opprette en ny klasse (cmd + n). Velg Swift-fil. Den nye klassen må extende UITableViewCell. Husk å importere UIKit

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/customcell.png?raw=true)

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/customclass.png?raw=true)

![alt tag](https://github.com/Lomaas/iOS-kurs-foilsett/blob/gh-pages/exampleViewCell.png?raw=true)

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

- Legg til BarButton knapp oppe i høyre hjørne på navigation baren
- ctrl-click og dra over i ny ViewController. Velg "push" som animasjonstype
- Lag user interface i Storyboard for opprettelse av todo etter ønske. F. eks et textfield og en save knapp
- Ved opprettelse av todo, gi beskjed at ny data er kommet til TableViewController

- Gi beskjed til navigationController at den skal poppe et view fra stacken:
```swift
navigationController?.popViewController
```
